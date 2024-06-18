function alternating_digits_sum(num::Int64)
    sign = if length(string(num)) % 2 == 0 - 1
    else
        1
    end
    sum, n = 0, num

    while n != 0
        sum += sign * (n % 10)
        n = div(n, 10)
        sign *= -1
    end

    return sum
end

input = 886996
output = alternating_digits_sum(input)
println(output)
