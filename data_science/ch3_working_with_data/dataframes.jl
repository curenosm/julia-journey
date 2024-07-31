"""
- `Dataframe`: Representacion tabular de un conjunto de datos

Las observaciones son las filas, y las variables las columnas.
Cada fila es una unica observacion (evaluada vectorialmente)

Para una unica observacion, cada columna representa la realizacion de una
variable.

Supongamos que hacemos n mediciones x_1, ..., x_n de X_1, ..., X_n variables
aleatorias p-dimensionales donde 𝚾_i = (X_i1, X_i2, ..., Xip)' para i = 1:n


                             | 𝚾_1' |
𝝌 = (𝚾_1, 𝚾_2, ..., 𝚾_n)' = | 𝚾_2' |
                             | ...  |
                             | 𝚾_n' |


𝚾_1 se llama un vector aleatorio y 𝝌 se llama una matriz aleatoria de n × p

Una realizacion de 𝝌 puede ser considerada una matriz de datos.
Una matriz con entradas constantes es llamada matriz constante.

Un dataframe es una representacion computacional de una matriz de datos.

## Ventajas de usar DataFrames en Julia:

1. Las columnas pueden diferir en tipos.
2. Puede haber entradas de datos faltantes.
3. Se le puede asociar metadatos a un Dataframe
4. Las columnas pueden tener nombres
5. Podemos substraer datos por columna, fila, o ambos.
"""

fruit = "apple"

println("eval(:fruit): ", eval(:fruit))
println("""eval("apple"): """, eval("apple"))

"""
En Julia un simbolo es la manera en que el nombre de una variable se
representa como datos, por otro lado un string representa a si mismo.

Accedemos a una columna mediante un simbolo haciendo:

    df[:symbol]

Mas especificamente los datoos en la columna representada por symbol
contenida en el DataFrame df.

Los DataFrame pueden ser creados en un solo paso o en multiples fases.
"""

using CategoricalArrays
using DataFrames
using Distributions
using Missings
using Missings: Missing, missings
using Random
using StatsBase
Random.seed!(825)

N = 50

# Creando un dataframe de ejemplo, inicialmente el DataFrame cuenta con N filas
# y 3 columnas
df1 = DataFrame(
  x1 = rand(Normal(2, 1), N),
  x2 = [sample(["High", "Medium", "Low"], pweights([0.25, 0.45, 0.30])) for i = 1:N],
  x3 = rand(Pareto(2, 1), N),
)

println(df1)

## Agregamos una cuarta columna, y, que es dependiente de x3 y el nivel de x2
df1[!, :y] = [
  df1[i, :x2] == "High" ? *(4, df1[i, :x3]) :
  df1[i, :x2] == "Medium" ? *(2, df1[i, :x3]) : *(0.5, df1[i, :x3]) for i = 1:N
]

println(df1)

###############################################################################

## Slicing DataFrames
println("df1[1:2, 3:4]:", df1[1:2, 3:4])
println("\ndf1[1:2, [:y, :x1]]: ", df1[1:2, [:y, :x1]])

# Now, exclude columns x1 and x2
keep = setdiff(names(df1), [:x1, :x2])
println("\nColumns to keep: ", keep)
# Columns to keep: Symbol[:x3, :y]

println("df1[1:2, keep]: ", df1[1:2, keep])

###############################################################################

## Examples of vector with missing values
v1 = missings(2)
println("v1: ", v1)
# v1: Missing[missing, missing]

v2 = missings(Float64, 1, 3)

v2[2] = pi
println("v2: ", v2)
# v2: Union{Missing, Float64}[missing, 3.14159, missing]

println(v2)

## Test for missing
m1 = map(ismissing, v2)

println("m1: ", m1)
# m1: Bool[true, false, true]

println("Percent missing v2: ", *(mean([ismissing(i) for i in v2]), 100))
# Percent missing v2: 66.66666666666

## Drop missing values
mean(skipmissing(v2))

# collects the non-missing values in an array
collect(skipmissing(v2))
# 1-element Array{Float64, 1}
#  3.14159...
