using DataFrames

function rename_columns(df)
    rename(df,
        :id => :student_id,
        :first => :first_name,
        :last => :last_name,
        :age => :age_in_years)
end


data = [1 "Mason" "King" 6;
    2 "Ava" "Wright" 7;
    3 "Taylor" "Hall" 16;
    4 "Georgia" "Thompson" 18;
    5 "Thomas" "Moore" 10]
cols = [:id, :first, :last, :age]
input = DataFrame(data, :auto)
rename!(input, cols, makeunique=true)
output = rename_columns(input)
println(output)
