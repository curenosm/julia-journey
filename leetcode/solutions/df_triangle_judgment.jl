using DataFrames

function triangle_judgment(df)
    x, y, z = df[:, :x], df[:, :y], df[:, :z]
    fun = (x, y, z) -> begin
        if x + y > z && y + z > x && z + x > y
            "Yes"
        else
            "No"
        end
    end
    df[:, :triangle] .= fun.(x, y, z)
    return df
end

data = [13 15 30;
    10 20 15]
cols = [:x, :y, :z]
input = DataFrame(data, :auto)
rename!(input, cols, makeunique=true)
output = triangle_judgment(input)
println(output)
