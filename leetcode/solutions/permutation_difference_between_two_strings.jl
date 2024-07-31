find_permutation_difference(s::String, t::String) =
  sum(abs(i - findfirst(==(s[i]), t)) for i in eachindex(s))


s = "abc"
t = "bac"
output = find_permutation_difference(s, t)
println(output)
