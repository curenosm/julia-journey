is_triangle(a, b, c) = a + b > c && b + c > a && c + a > b

function type_of_triangle(nums::Vector{Int})
    return if is_triangle(nums...)
        sides = Set(nums)
        if length(sides) == 1
            "equilateral"
        elseif length(sides) == 2
            "isosceles"
        elseif length(nums) == 3
            "scalene"
        else
            "none"
        end
    else
        "none"
    end
end

input = [1, 1, 1]
output = type_of_triangle(input)
println(output)
