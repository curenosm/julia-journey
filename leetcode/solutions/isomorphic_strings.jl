function is_isomorphic(s, t)
  if length(s) != length(t)
    return false
  end

  freq = Dict{Char,Int64}()
  for i in eachindex(s)
    if !haskey(freq, i)
      if s[i] in values(freq)
        return false
      end

      freq[s[i]] = t[i]
    elseif freq[s[i]] != t[i]
      return false
    end
  end

  return true
end

s = "egg"
t = "add"
solution = is_isomorphic(s, t)
println(solution)
