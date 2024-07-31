function is_good(nums::Vector{Int})
  if length(nums) == 2
    return nums[1] == 1 && nums[1] == 1
  end

  n = length(nums)
  freq = Dict{Int,Int}()

  for i = 1:n+1
    put!(freq, i => 0)
  end

  for i in nums
    if !haskey(freq, i)
      return false
    end
    freq[i] += 1
  end

  for i = 1:nums.size-1
    if freq[i] == 0
      return false
    end
  end

  true
end

input = [1, 1]
output = is_good(input)
println(output)
