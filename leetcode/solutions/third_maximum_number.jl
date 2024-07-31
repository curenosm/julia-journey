function third_max_number(nums::Vector{Int})
  max = sort(unique(nums), rev = true)
  return if length(max) >= 3
    max[3]
  else
    max[0]
  end
end

input = [3, 6, 5, 6, 1, 1, 0]
output = third_max_number(input)
println(output)
