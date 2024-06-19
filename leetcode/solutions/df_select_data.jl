using DataFrames

function select_data(df)
    select(subset(df, :student_id => x -> x .== 101), :name, :age)
end

data = [101         "Ulysses"  13;
        53          "William"  10;
        128         "Henry"     6;
        3           "Henry"    11]
cols = [:student_id, :name, :age]
input = DataFrame(data, :auto)
rename!(input, cols, makeunique=true)
output = select_data(input)
println(output)
