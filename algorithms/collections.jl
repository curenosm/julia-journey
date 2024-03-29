collection_1 = [1, 2, 3, 4, 5]
isempty(collection_1)

empty!(collection_1)
length(collection_1)

[], typeof([]), isempty([])

empty!([1, 2, 3]), empty!(Set([1, 2, 3]))
length(empty!([1, 2, 3])), length(empty!(Set([1, 2, 3])))
length(empty!(Dict("a" => 1, "b" => 2)))
