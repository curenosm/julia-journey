function added_integer(nums1::Vector{Int}, nums2::Vector{Int})
    sort!(nums1)
    sort!(nums2)
    nums2[1] - nums1[1]
end

nums1 = [2, 6, 4]
nums2 = [9, 7, 5]
output = added_integer(nums1, nums2)
println(output)
