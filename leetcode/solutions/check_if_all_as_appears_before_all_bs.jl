check_string(s::String)::Bool = occursin(r"a*b*", s)

input = "aaabbb"
output = check_string(input)
println(output)
