function satisfies_conditions(grid)
    m, n = size(grid)

    for i = 1:m, j = 1:n
        cur_matches = true

        if i != m
            cur_matches &= grid[i, j] == grid[i+1,j]
        end

        if j != n
            cur_matches &= grid[i, j] != grid[i, j+1]
        end

        if !cur_matches
            return false
        end
    end

    true
end

input = [1 7; 1 1]
output = satisfies_conditions(input)
println(output)
