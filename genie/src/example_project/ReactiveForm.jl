module ReactiveForm
using GenieFramework
using .Main.App.StatisticAnalysis
@genietools

@app begin
  @in N = 0
  @out m = 0.0
  @onchange N begin
    m = calc_mean(gen_numbers(N))
  end
end

function ui()
  cell([
    textfield("How many numbers?", :N),
    p("The average of {{N}} random numbers is {{m}}"),
  ])
end

@page("/reactive", ui)
end
