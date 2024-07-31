function base_7(n::Int)::String
  if n == 0
    return "0"
  end
  sign = if n >= 0
    ""
  else
    "-"
  end
  n, sign = abs(n)

  str = ""
  while n != 0
    str *= string(n % 7)
    n /= 7
  end

  return sign * reverse(str)
end

input = 12345
output = base_7(input)
println(output)
