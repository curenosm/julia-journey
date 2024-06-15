function count_pairs(nums, target)
    counted = 0
    for i in eachindex(nums)
        for j in i+1:length(nums)
            if nums[i] + nums[j] < target
                counted += 1
            end
        end
    end
    return counted
end

input = [-6, 2, 5, -2, -7, -1, 3]
target = -2
output = count_pairs(input, target)
println(output)
