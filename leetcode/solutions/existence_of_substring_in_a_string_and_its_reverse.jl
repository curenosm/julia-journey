function is_substring_present(s::String)
  rev = reverse(s)

  for i = 1:length(s)-2
    if contains(s[i:i+2], rev)
      return true
    end
  end

  false
end

input = "abcd"
output = is_substring_present(input)
println(output)
