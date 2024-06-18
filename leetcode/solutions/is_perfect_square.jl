function is_perfect_square(n::Int64)
    if n == 0 || n == 1
        return true
    end

    for i in 0:n/2+1
        if i * i == n
            return true
        end
    end

    return false
end

input = 100000001
output = is_perfect_square(input)
println(output)
