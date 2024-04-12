module App

using GenieFramework, Genie.Renderer.Html
@genietools

function assets()
[
    head([
        meta(charset="utf-8")
        meta(name="og:image", content="/meta.png")
        link(rel="stylesheet", href="/style.css")
        title("Including assets")
    ])
    body([
        img(src="/fig.png", alt="plot")
    ])
]
end

@page("/", assets)
end

# Para correr:
# using GenieFramework; Genie.loadapp(); up()
