using Pkg

Pkg.add("DataFrames")
Pkg.add("SQLite")
Pkg.add("CSV")

using DataFrames
using CSV, SQLite


# Pkg.update()

s = "D:\\pc\\github\\journeys\\julia-journey\\"
df = DataFrame(CSV.File(joinpath(s, "iris.tsv")))

df = DataFrame(A = 1:10, B = 11:20)
