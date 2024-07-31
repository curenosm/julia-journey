function final_string(s::String)
  str = ""
  for c in s
    if c == 'i'
      str = reverse(str)
    else
      str *= c
    end
  end
  str
end

input = "poiinter"
output = final_string(input)
println(output)
