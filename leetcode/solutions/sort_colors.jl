function sort_colors!(nums::Vector{Int64})
    count = [0, 0, 0]
    for i in eachindex(nums)
        count[nums[i] + 1] += 1
    end

    cur, i = 1, 1
    while i <= length(nums)
        if count[cur] != 0
            nums[i] = cur - 1; i += 1
            count[cur] -= 1
        else
            cur += 1
        end
    end
end

solution = [2, 0, 2, 1, 1, 0]
println(solution)
sort_colors!(solution)
println(solution)
