"""
    even_odd_bit(n::Int64) -> Vector{Int64}

Cuenta las ocurrencias de los 1's y 0's presentes
en la representación binaria del número n.

# Arguments
- `n::Int64` : Número entero.

# Returns
- `Vector{Int64}`: Vector con la cuenta de unos en la primera
coordenada, y la cuenta de los ceros en la segunda coordenada.

# Examples
```julia
julia> event_odd_bit(50)
[1, 2]
```

"""
function even_odd_bit(n::Int64)
    res = [0, 0]
    bin = bitstring(n)

    for (i, c) in enumerate(bin)
        res[i%2+1] += if c == '1'
            1
        else
            0
        end
    end

    return res
end

input = 50
output = even_odd_bit(input)
println(output)
