using DataFrames

function fill_missing_values(df)
  df[!, :quantity] = coalesce.(df[!, :quantity], 0)
  return df
end


data = [
  "Wristwatch" missing 135
  "WirelessEarbuds" missing 821
  "GolfClubs" 779 9319
  "Printer" 849 3051
]
cols = [:name, :quantity, :price]
input = DataFrame(data, :auto)
rename!(input, cols, makeunique = true)
output = fill_missing_values(input)
println(output)
