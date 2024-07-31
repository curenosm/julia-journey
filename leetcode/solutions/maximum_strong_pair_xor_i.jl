function maximum_strong_pair_xor(nums::Vector{Int})
  max = typemin(Int)

  for i in eachindex(nums)
    for j in eachindex(nums)
      x, y = nums[i], nums[j]
      if abs(x - y) <= min(x, y) && x ⊻ y > max
        max = x ⊻ y
      end
    end
  end

  return max
end


input = [5, 6, 25, 30]
output = maximum_strong_pair_xor(input)
println(output)
