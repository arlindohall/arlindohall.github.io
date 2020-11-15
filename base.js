
async function require(file) {
    var content = await fetch(file);
    return await content.text();
}

async function requireJson(file) {
    var content = await fetch(file);
    return await content.json();
}

function makeButton(props) {
    return `
        <span class="header-button ${props.extraClasses ? props.extraClasses : ''}">
            <a href=${props.link}>${props.text}</a>
        </span>
    `;
}

async function header() {
    var json = await requireJson('header-buttons.json');

    var leftButtons = json.buttons
            .map(makeButton)
            .join(`
                <span class="header-button-space"></span>
            `);
    var rightButtons = makeButton({
        text: 'Twitter',
        link: 'https://twitter.com/arlindohall',
        extraClasses: 'button-float-right'
    });

    var el = document.querySelector('.header');
    el.innerHTML = `${leftButtons}${rightButtons}`;
}

async function footer() {
    var sharedFooter = await require('shared-footer.html');
    var el = document.querySelector('.footer');
    el.innerHTML = sharedFooter;
}

window.onload = () => {
    header(), footer();
};