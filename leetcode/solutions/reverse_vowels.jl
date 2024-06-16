function reverse_vowels(s::String)
    vowels = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
    vect, str = [], ""

    for c in s
        if c in vowels
            push!(vect, c)
        end
    end

    for c in s
        str *= if c in vowels pop!(vect) else c end
    end

    str
end

input = "hello"
output = reverse_vowels(input)
println(output)
