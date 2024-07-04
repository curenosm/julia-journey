sum_counts(nums::Vector{Int}, N=length(nums)) =
    sum(length(unique(sublist))^2 for i = 1:N for j = i:N for sublist in [nums[i:j]])


input = [1, 2, 1]
output = sum_counts(input)
println(output)
