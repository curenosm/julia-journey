using DataFrames

function create_bonus_column(df)
  df[!, :bonus] = 2 * df[!, :salary]
  return df
end

data = [
  "Piper" 4548
  "Grace" 28150
  "Georgia" 1103
  "Willow" 6593
  "Finn" 74576
  "Thomas" 24433
]
cols = [:name, :salary]
input = DataFrame(data, :auto)
rename!(input, cols, makeunique = true)
output = create_bonus_column(input)
println(output)
