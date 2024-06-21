using DataFrames

function biggest_single_number(df::DataFrame)
    grouped = groupby(df, names(df))
    single_occurrences = filter(grp -> nrow(grp) == 1, grouped)
    return maximum(vcat(single_occurrences...)[!, :num])
end

data = [8, 8, 3, 3, 1, 4]
input = DataFrame(num=data)
output = biggest_single_number(input)
println(output)
