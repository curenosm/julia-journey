using JuMP
import HiGHS
import Makie
import Plots
import MultiObjectiveAlgorithms as MOA

languages = [
  "Julia",
  "Wolfram",
  "Python",
  "Lean4",
  "Java",
  "Kotlin",
  "Clojure",
  "Rust",
  "Scala",
  "SQL",
  "R",
  "C",
  "C++",
]

speed = [9, 6, 4, 6, 9, 8, 5, 10, 8, 8, 6, 10, 10]
ease_of_use = [8, 7, 10, 3, 8, 7, 3, 5, 5, 8, 7, 5, 5]
reproducibility = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
learning_curve = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
development_time = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
composability = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
machine_learning = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
scientific_domains = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
parallel_computing = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
operating_systems = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
plotting = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
data_science = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
data_visualization = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
pure_math = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
mobile_development = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
software_architecture = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
embedded_systems = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
telecommunications = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
artificial_intelligence = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
game_development = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
frontend_development = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
backend_development = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

begin
  model = Model()
  @variable(model, x[1:N], Bin)
  # @constraint(model, sum(weight[i] * x[i] for i in 1:N) <= capacity)
  @constraint(model, sum(x[i] for i = 1:N) <= capacity)
  @expression(model, speed_expr, sum(speed[i] * x[i] for i = 1:N))
  @expression(model, ease_of_use_expr, sum(ease_of_use[i] * x[i] for i = 1:N))
  @expression(model, science_expr, sum(scientific_domains[i] * x[i] for i = 1:N))
  @objective(model, Max, [speed_expr, ease_of_use_expr, science_expr])
end

begin
  set_optimizer(model, () -> MOA.Optimizer(HiGHS.Optimizer))
  set_silent(model)
end
