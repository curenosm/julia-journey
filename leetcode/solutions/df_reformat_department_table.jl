using DataFrames

columns =
  ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

function reformat_department_table(df)
  df_unstacked = unstack(df, :month, :revenue)

  # Verificamos que todos los meses estén presentes
  for col in columns
    if col ∉ names(df_unstacked)
      insertcols!(df_unstacked, col => repeat([missing], nrow(df_unstacked)))
    end
  end

  df_unstacked = df_unstacked[:, Cols(:id, Symbol.(columns)...)]
  rename_dict = Dict(Symbol(col) => Symbol("$(col)_Revenue") for col in columns)
  rename!(df_unstacked, rename_dict)
  sort!(df_unstacked, :id)
  return df_unstacked
end

data = [
  1 8000 "Jan"
  2 9000 "Jan"
  3 10000 "Feb"
  1 7000 "Feb"
  1 6000 "Mar"
]
cols = [:id, :revenue, :month]
input = DataFrame(data, :auto)
rename!(input, cols, makeunique = true)
output = reformat_department_table(input)
println(output)
