function find_distance_between_arrays(arr1::Array{Int64}, arr2::Array{Int64}, d::Int64)
  res = 0
  for i in eachindex(arr1)
    counter = 0
    for j in eachindex(arr2)
      if abs(arr1[i] - arr2[j]) <= d
        counter += 1
        break
      end
    end

    if counter == 0
      res += 1
    end
  end

  return res
end

arr1 = [2, 1, 100, 3]
arr2 = [-5, -2, 10, -3, 7]
d = 6
output = find_distance_between_arrays(arr1, arr2, d)
println(output)
