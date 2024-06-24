function shortest_to_char(s::String, c::Char)
    len = length(s)
    answer = fill(typemax(Int), len)

    for i in 1:len
        if s[i] == c
            answer[i] = 0
        end
    end

    zeros = filter(i -> answer[i] == 0, 1:len)
    for i in zeros
        l, r, j = i - 1, i + 1, 2
        while 0 < l && answer[l] != 0
            answer[l] = min(answer[l], j - 1)
            l -= 1
            j += 1
        end

        j = 2
        while r <= len && answer[r] != 0
            answer[r] = min(answer[r], j - 1)
            r += 1
            j += 1
        end
    end

    return answer
end

s = "loveleetcode"
c = 'e'
output = shortest_to_char(s, c)
println(output) # [3,2,1,0,1,0,0,1,2,2,1,0]
