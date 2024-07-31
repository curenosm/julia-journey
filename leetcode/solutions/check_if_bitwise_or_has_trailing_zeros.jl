function has_trailing_zeros(nums)
  for i in eachindex(nums)
    for j = i+1:length(nums)
      if nums[i] & 1 === 0 && nums[j] & 1 === 0
        return true
      end
    end
  end
  false
end

input = [1, 2]
output = has_trailing_zeros(input)
println(output)
