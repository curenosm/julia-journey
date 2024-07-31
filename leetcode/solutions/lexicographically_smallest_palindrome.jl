"""

lexicographically_smallest_palindrome(s::String) -> String

Nos devuelve el palindromo mas pequeño lexicograficamente
que se puede formar cambiando la mínima cantidad posible de
letras.

# Arguments
- `s::String` - Cadena de caracteres.

# Returns
- `String` - Palíndromo.

# Examples
```julia
julia> lexicographically_smallest_palindrome("seven")
"neven"
```
"""
function lexicographically_smallest_palindrome(s::String)
  str, l, r = "", 1, length(s)

  while l <= r
    str *= if s[l] != s[r]
      if s[l] < s[r]
        s[l]
      else
        s[r]
      end
    else
      s[l]
    end
    l += 1
    r -= 1
  end

  str * reverse(str)[if length(s) % 2 == 0
    1
  else
    2
  end:end]
end

input = "seven"
output = lexicographically_smallest_palindrome(input)
println(output)
