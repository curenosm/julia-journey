using DataFrames

function concatenate_tables(df1::AbstractDataFrame, df2::AbstractDataFrame)
    return DataFrames.append!(df1, df2)
end

df1 = DataFrame([
        1 "Mason" 8;
        2 "Ava" 6;
        3 "Taylor" 15;
        4 "Georgia" 17
    ], :auto)

df2 = DataFrame([
        5 "Leo" 7;
        6 "Alex" 7
    ], :auto)

output = concatenate_tables(df1, df2)
println(output)
