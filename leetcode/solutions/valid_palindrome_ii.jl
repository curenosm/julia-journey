function valid_palindrome(s::String)
    l, r = 1, length(s)

    while l <= r
        if s[l] == s[r]
            l += 1
            r -= 1
        else
            return is_palindrome(s, l + 1, r) || is_palindrome(s, l, r - 1)
        end
    end

    true
end

function is_palindrome(s::String, l::Int64, r::Int64)
    while l <= r
        if s[l] == s[r]
            l += 1
            r -= 1
        else
            return false
        end
    end

    true
end

input = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
output = valid_palindrome(input)
println(output)
