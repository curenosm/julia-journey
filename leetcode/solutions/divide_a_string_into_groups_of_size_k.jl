function divide_string(s::String, k::Int, fill::Char)
    result, cur = [], ""

    for i in eachindex(s)
        cur *= s[i]

        if i % k == 0
            push!(result, cur)
            cur = ""
        end
    end

    if length(cur) != 0
        while length(cur) < k
            cur *= fill
        end
        push!(result, cur)
    end

    result
end

input = "abcdefghi"
output = divide_string(input, 3, 'x')
println(output)
