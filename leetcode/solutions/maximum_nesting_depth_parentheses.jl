"""
    max_depth(s::String) -> Int64

Nos devuelve la máxima anidación de parentesis
para la cadena especificada.

# Arguments
- `s::String` - Cadena que posiblemente contiene los caracteres
'(' o ')'.

# Returns
- `Int64` - Cuenta de la maxima profundidad para dicha expresión.

# Examples
```julia
julia> max_depth("(1)+((2))+(((3)))")
3
```
"""
function max_depth(s::String)
  cur, max = 0, typemin(Int64)
  for c in s
    cur += if c == '('
      1
    elseif c == ')' - 1
    else
      0
    end
    if cur > max
      max = cur
    end
  end
  return max
end

input = "(1+(2*3)+((8)/4))+1"
output = max_depth(input)
println(output)
