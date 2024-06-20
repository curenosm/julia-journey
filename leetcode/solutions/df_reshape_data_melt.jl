using DataFrames

function melt_table(df)
    stack(df, [:quarter_1, :quarter_2, :quarter_3, :quarter_4],
        variable_name=:quarter, value_name=:sales)
end


data = [
    "Umbrella" 417 224 379 611;
    "SleepingBag" 800 936 93 875]
cols = [:product, :quarter_1, :quarter_2, :quarter_3, :quarter_4]
input = DataFrame(data, :auto)
rename!(input, cols, makeunique=true)
output = melt_table(input)
println(output)
