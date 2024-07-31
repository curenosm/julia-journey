function count_digits(num)
  counted, n = 0, num
  while n != 0
    if num % (n % 10) == 0
      counted += 1
    end
    n = div(n, 10)
  end
  counted
end

input = 1248
output = count_digits(input)
println(output)
