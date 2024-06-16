function hamming_distance(m::Int64, n::Int64)
    result = 0
    while m != 0 || n != 0
        result += (m & 1) ⊻ (n & 1)
        m >>= 1 ; n >>= 1
    end
    result
end


m = 1
n = 4
output = hamming_distance(m, n)
println(output)
