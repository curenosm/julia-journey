function reverse_bits(n)
    ans = 0
    for i in 1:32
        ans |= (1 & n) << (31 - i)
        n >>= 1
    end
    ans
end

input = typemax(Int)
output = reverse_bits(input)
println(output)

zero = 0
output = reverse_bits(zero)
println(output)
