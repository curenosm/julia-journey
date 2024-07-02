function array_rank_transform(arr)
    sorted = sort(unique(arr))
    map(n -> findfirst(==(n), sorted), arr)
end

input = [37, 12, 28, 9, 100, 56, 80, 5, 12]
output = array_rank_transform(input)
println(output)
