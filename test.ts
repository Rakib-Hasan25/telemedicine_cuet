import * as dom from " "
const main = async () => {
    console.log("[")
    for (let i = 1; i <= 59; i++) {
        const res = await fetch(`https://www.doctorbangladesh.com/doctors/page/${i}/`)
        const data = await res.text();
        const html = new dom.JSDOM(data)
        for (const i of html.window.document.getElementsByClassName("entry-header")) {
            try {
                const entry_header = new dom.JSDOM(i.innerHTML);
                const image_html = new dom.JSDOM(entry_header.window.document.getElementsByClassName("photo")[0].innerHTML);
                const image = image_html.window.document.getElementsByTagName("img")[0].getAttribute("src");
                const name = new dom.JSDOM(entry_header.window.document.getElementsByClassName("entry-title")[0].innerHTML);
                const name_text = name.window.document.getElementsByTagName("a")[0].innerHTML;
                const info_html = new dom.JSDOM(entry_header.window.document.getElementsByClassName("info")[0].innerHTML);
                const ul_html = new dom.JSDOM(info_html.window.document.getElementsByTagName("ul")[0].innerHTML);
                const li_html = ul_html.window.document.getElementsByTagName("li");
                const degree = li_html[0].innerHTML;
                const speciality = li_html[1].innerHTML;
                const designation = li_html[2].innerHTML;
                const workplace = li_html[3].innerHTML;
                console.log(`{
                    "name": "${name_text}",
                    "image": "${image}",
                    "degree": "${degree}",
                    "speciality": "${speciality}",
                    "designation": "${designation}",
                    "workplace": "${workplace}"
                },`);
            }
            catch (e) { }
        }
    }
    console.log("]")

}

// for (const i of html.window.document.getElementsByClassName("pagination-next")) {
//     // console.log(i.innerHTML)
//     const next_page_html = new dom.JSDOM(i.innerHTML);
//     const next_page = next_page_html.window.document.getElementsByTagName("a")[0].getAttribute("href");
//     console.log(next_page)
// }
// for (const i of html.window.document.getElementsByClassName("photo")) {
//     const image_html=new dom.JSDOM(i.innerHTML);
//     const image=image_html.window.document.getElementsByTagName("img")[0].getAttribute("src");
//     console.log(image)
// }
// }

await main()