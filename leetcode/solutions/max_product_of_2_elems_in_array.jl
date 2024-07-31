"""
    max_product(nums::Vector{Int64}) -> Int64

Nos devuelve el máximo producto que podemos obtener
como resultado de multiplicar dos elementos del vector.

# Arguments
- `nums::Vector{Int64}` : Vector de números enteros.

# Returns
- `Int64` - Máximo producto entre 2 elementos del vector.

# Examples
```julia
julia> max_product([1,5,4,5])
16
```
"""
function max_product(nums::Vector{Int64})
  max = typemin(Int64)

  for i in eachindex(nums)
    for j = (i+1):length(nums)
      cur = (nums[i] - 1) * (nums[j] - 1)
      max = if (max < cur)
        cur
      else
        max
      end
    end
  end

  return max
end


input = [3, 4, 5, 2]
output = max_product(input)
println(output)
