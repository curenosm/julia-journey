function find_the_difference(s::String, t::String)
  s_freq = Dict(s[i] => count(c -> c == s[i], s) for i in eachindex(s))
  t_freq = Dict(t[i] => count(c -> c == t[i], s) for i in eachindex(t))

  for c in t
    if !(c in keys(s_freq)) || s_freq[c] != t_freq[c]
      return c
    end
  end

  return '0'
end

s = "abcd"
t = "abcde"
output = find_the_difference(s, t)
println(output)
