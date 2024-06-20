using DataFrames

function pivot_table(df)
    pivoted_df = unstack(df, :city, :temperature)
    sorted_columns = apppend!(["month"], sort(names(pivoted_df)[2:end]))
    sort(pivoted_df)[:, sorted_columns]
end

data = [
    "Jacksonville" "January" 13;
    "Jacksonville" "February" 23;
    "Jacksonville" "March" 38;
    "Jacksonville" "April" 5;
    "Jacksonville" "May" 34;
    "ElPaso" "January" 20;
    "ElPaso" "February" 6;
    "ElPaso" "March" 26;
    "ElPaso" "April" 2;
    "ElPaso" "May" 43
]
cols = [:city, :month, :temperature]
input = DataFrame(data, :auto)
rename!(input, cols, makeunique=true)
output = pivot_table(input)
println(output)
