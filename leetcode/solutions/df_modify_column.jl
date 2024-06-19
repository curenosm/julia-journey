using DataFrames

function modify_salary_column(df)
    df[!, :salary] *= 2
    return df
end

data = ["Jack" 19666;
    "Piper" 74754;
    "Mia" 62509;
    "Ulysses" 54866]
cols = [:name, :salary]
input = DataFrame(data, :auto)
rename!(input, cols, makeunique=true)
output = create_bonus_column(input)
println(output)
