function is_valid(s)
    if length(s) < 3
        return false
    end

    consonants = r"(?i)([a-z&&[^aeiou]])"
    vowels = r"(?i)[aeiou]"
    digits = r"\\d"
    pattern = string("^(", consonants, "|", vowels, "|", digits, "|", ")+\$")
    regex = Regex(pattern)

    return !isnothing(match(consonants, s)) &&
           !isnothing(match(vowels, s)) &&
           !isnothing(match(pattern, s)) &&
           !isnothing(match(regex, s))
end

input = "234Adas"
output = is_valid(input)
println(output)
