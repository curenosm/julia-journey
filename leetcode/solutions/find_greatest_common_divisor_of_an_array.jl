find_gcd(nums) = gcd(minimum(nums), maximum(nums))

gcd(a::Int, b::Int) =
  if b != 0
    gcd(b, a % b)
  else
    abs(a)
  end


input = [7, 5, 6, 8, 3]
output = find_gcd(input)
println(output)
