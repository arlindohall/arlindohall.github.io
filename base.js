
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


class MarkdownContent {
    constructor(id, path) {
        this.id = id;
        this.path = path;
        this.parser = new commonmark.Parser();
        this.renderer = new commonmark.HtmlRenderer();

        registerComponent(id, this);
    }

    async render() {
        this.content = await require(this.path);
        this.content = this.parser.parse(this.content);
        this.content = this.renderer.render(this.content);

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
}


document.addEventListener(
    'DOMContentLoaded',
    () => {
        header();
        footer();
    }
);