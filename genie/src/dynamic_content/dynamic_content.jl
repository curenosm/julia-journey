using Genie, Genie.Renderer.Html

# Usamos Genie en lugar de GenieFramework, porque
# no necesitamos de las funcionalidades reactivas
# de Stipple.jl

route("/message") do
  name = "John"
  h1("Welcome to Genie, $name!")
end


"""
La función `html` agrega información al header de
HTTP response
"""
route("/message") do
  name = "Alice"
  html(Genie.Renderer.filepath("message.jl"), name = name)
end


route("/message") do
  html(Renderer.filepath("pages/message.jl.html"))
end
