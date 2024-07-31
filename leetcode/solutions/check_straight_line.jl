function check_straight_line(coordinates)
  a, b = coordinates[1], coordinates[length(coordinates)]

  if a[1] - b[1] != 0
    m = (a[2] - b[2]) / (a[1] - b[1])

    for i in eachindex(coordinates)
      if a[2] - coordinates[i][2] != m * (a[1] - coordinates[i][1])
        return false
      end
    end

    return true
  end

  return all(x -> x[1] == a[1], coordinates)
end

input = [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7]]
output = check_straight_line(input)
println(output)
