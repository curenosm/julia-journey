function count_numbers_of_nice_subarrays(nums, k)
    odds = [i for i in eachindex(nums) if nums[i] % 2 == 1]
    result = 0

    for i in 1:length(odds)-k+1
        l, r = odds[i], odds[i+k-1]
        min, max, sum = l - 1, r + 1, 0

        while 0 < min
            if nums[min] % 2 == 1
                break
            end
            min -= 1
        end

        while max <= length(nums)
            if nums[max] % 2 == 1
                break
            end
            max += 1
        end

        for _ in min:l-1
            for _ in r:max-1
                sum += 1
            end
        end

        result += sum
    end

    return result
end

nums, k = [2, 2, 2, 1, 2, 2, 1, 2, 2, 2], 2
output = count_numbers_of_nice_subarrays(nums, k)
println(output)
