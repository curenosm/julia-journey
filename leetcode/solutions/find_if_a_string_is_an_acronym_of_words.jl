is_acronym(words::Vector{String}, s::String) = s == join(map(w -> w[1], words))


words = ["alice", "bob", "charlie"]
s = "abc"
output = is_acronym(words, s)
println(output)
