function my_sqrt(x)
  for i = 0:x
    if x < i * i
      return (i - 1)
    end
  end
  x
end

input = my_sqrt(20000000000)
println(input)
