function number_of_lines(widths, s)
  ABC = "abcdefghijklmnopqrstuvwxyz"
  result = [1, 0]

  for c in s
    i = findfirst(x -> x == c, ABC)
    if result[2] + widths[i] <= 100
      result[2] += widths[i]
    else
      result[1] += 1
      result[2] = widths[i]
    end
  end

  return result
end

widths = [
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
]
s = "abcdefghijklmnopqrstuvwxyz"
output = number_of_lines(widths, s)
println(output)
