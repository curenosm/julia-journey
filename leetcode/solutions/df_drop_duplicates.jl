using DataFrames

function drop_duplicates(df)
    unique(df, [:email])
end


data = [
    1 "Ella" "emily@example.com";
    2 "David" "michael@example.com";
    3 "Zachary" "sarah@example.com";
    4 "Alice" "john@example.com";
    5 "Finn" "john@example.com";
    6 "Violet" "alice@example.com"]
cols = [:customer_id, :name, :email]
input = DataFrame(data, :auto)
rename!(input, cols, makeunique=true)
output = drop_duplicates(input)
println(output)
