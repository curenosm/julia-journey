function insertion_sort!(arr)
  for i in eachindex(arr)
    key = arr[i]
    j = i - 1
    while j >= 1 && arr[j] > key
      arr[j+1] = arr[j]
      j -= 1
    end
    arr[j+1] = key
  end
end

arr = [12, 11, 13, 5, 6]
insertion_sort!(arr)

print("Sorted array is: ", arr)

function merge_sort(arr)
  if length(arr) <= 1
    return arr
  end

  mid = length(arr) ÷ 2
  left = arr[1:mid]
  right = arr[mid+1:end]

  left = merge_sort(left)
  right = merge_sort(right)

  return merge(left, right)
end

function merge(left, right)
  result = []
  i = j = 1

  while i <= length(left) && j <= length(right)
    if left[i] < right[j]
      push!(result, left[i])
      i += 1
    else
      push!(result, right[j])
      j += 1
    end
  end

  append!(result, left[i:end])
  append!(result, right[j:end])

  return result
end

merge_sort([12, 11, 13, 5, 6])
