using DataFrames

function find_total_time_spent_by_employee(df::DataFrame)
    df = groupby(df, [:emp_id, :event_day])
    df = combine(df, :in_time => sum => :in_time, :out_time => sum => :out_time)
    df[!, :total_time] = df[!, :out_time] - df[!, :in_time]
    rename!(df, Dict(:event_day => :day))
    df[:, [:day, :emp_id, :total_time]]
end


data = [
    1 "2020-11-28" 4 32;
    1 "2020-11-28" 55 200;
    1 "2020-12-3" 1 42;
    2 "2020-11-28" 3 33;
    2 "2020-12-9" 47 74
]
cols = [:emp_id, :event_day, :in_time, :out_time]
input = DataFrame(data, :auto)
rename!(input, cols, makeunique=true)
output = find_total_time_spent_by_employee(input)
println(output)
