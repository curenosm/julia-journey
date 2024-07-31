using Pkg

Pkg.add("DataFrames")
Pkg.add("SQLite")
Pkg.add("CSV")

using DataFrames
using CSV, SQLite


# Pkg.update()

s = "D:\\pc\\github\\journeys\\julia-journey\\"
df = DataFrame(CSV.File(joinpath(s, "iris.csv")))

df = DataFrame(A = 1:10, B = 11:20)

# Ahora lo guardamos en un archivo CSV
CSV.write(joinpath(s, "iris2.csv"), df)

# O en un sql
db = SQLite.DB(joinpath(s, "iris.db"))
SQLite.load!(df, db, "iris")
