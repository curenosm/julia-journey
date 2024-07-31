function longest_nice_substring(s::String)
  str = ""

  for i in eachindex(s)
    for j = 1:length(s)
      cur_sub_str = s[i:j]
      if is_nice(cur_sub_str) && length(cur_sub_str) > length(str)
        str = cur_sub_str
      end
    end
  end

  return str
end

function is_nice(s::String)
  freq = Dict{Char,Int}()

  for c in s
    freq[c] = get(freq, c, 0) + 1
  end

  for c in s
    curU, curL = uppercase(c), lowercase(c)
    if !haskey(freq, curU) || !haskey(freq, curL)
      return false
    end
  end

  return true
end


input = "YazaAay"
output = longest_nice_substring(input)
println(output)
