
async function require(file) {
    let content = await fetch(file);
    return await content.text();
}


function registerComponent(id, self) {
    document.addEventListener(
        'DOMContentLoaded',
        self.render.bind(self),
    );
}

let markdown = {
    async fetchMarkdown(path) {
        let content;
        content = await fetch(path);
        if (content.ok) {
            content = await content.text();
        } else {
            content = await require('/content/no-such-page.md');
        }
        content = this.parser.render(content);
        return content;
    },
    parser: markdownit({
        html: true,
    }).use(markdownitFootnote),
};

class MarkdownContent {
    constructor(id, path) {
        this.id = id;
        this.path = path;

        registerComponent(id, this);
    }

    async render() {
        this.content = await markdown.fetchMarkdown(this.path);

        this.el = document.getElementById(this.id);
        this.el.innerHTML = this.content;
    }
}


async function header() {
    let sharedHeader = await require('/shared-header.html')
    let el = document.querySelector('.header');
    el.innerHTML = sharedHeader;
}

async function footer() {
    let sharedFooter = await require('/shared-footer.html');
    let el = document.querySelector('.footer');
    el.innerHTML = sharedFooter;

    let pathname = document.location.pathname;
    if (pathname === '/') {
        pathname = '/index.html';
    }
    document.getElementById('footer-source-link')
        .href = `https://github.com/arlindohall/arlindohall.github.io/blob/mainline${pathname}`;
}


document.addEventListener(
    'DOMContentLoaded',
    () => {
        header();
        footer();
    }
);