using DataFrames

function create_data_frame(list)
    df = DataFrame(list, :auto)
    rename(df, [:student_id, :age], makeunique=true)
end

input = [
    1 15;
    2 11;
    3 11;
    4 20]
output = create_data_frame(input)
println(output)
