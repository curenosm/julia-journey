module App
using Main.StatisticAnalysis
using GenieFramework, Genie.Renderer.Html
@genietools

# Para correr:
# using OhMyREPL; using GenieFramework; Genie.loadapp(); up()

route("/dynamic-content") do
  html(Renderer.filepath("templates/dynamic_content.jl"), name = "Genie")
end

route("/message") do
  html(Renderer.filepath("templates/message.jl"), name = "Genie")
end

route("/message2") do
  html(Renderer.filepath("templates/message.jl.html"), name = "Genie")
end

route("/hello", method = "post") do
  name = request(:name)
  data = transform_data_inplace([1, 2, 3])
  html("Hello $name!")
end

# CONTROLLERS
route("/form") do
  Html.form(
    action = "/result",
    method = "POST",
    [
      input(type = "number", name = "N", placeholder = "Enter vector length")
      input(type = "submit", value = "Send")
    ],
  )
end

using GenieFramework.Genie.Requests: postpayload
route("/result", method = POST) do
  N = parse(Int, postpayload(:N))
  x = gen_numbers(N)
  m = calc_mean(x)
  p("The mean of $N random numbers is: $m", style = "font-size:20px")
end

end

include("Reactiveform.jl")
