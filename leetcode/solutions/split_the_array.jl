function split_the_array(arr::Array{Int64})
    freq = Dict{Int64,Int64}()
    for n in arr
        freq[n] = get(freq, n, 0) + 1
        if freq[n] > 2
            return false
        end
    end
    true
end

input = [1, 1, 1, 1]
output = split_the_array(input)
println(output)
