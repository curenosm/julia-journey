using CSV
using DataFrames
# using DataFrames: aggregate

"""
A menudo se busca extraer estadisticas en resumen de un conjunto de datos

La estrategia split-apply-combine es una forma de dividir un conjunto de datos
en grupos, de manera que proveemos una funcion a cada grupo y despues combinamos
los resultados en un solo DataFrame.

Julia implementa esta estrategia haciendo uso de:

- `combine(groupby(df, cols), d)`: Se utiliza para aplicar la funcion f para 
crear una particion mediante las columnas cols en el dataframe.
"""

df = DataFrame(
  X1 = [1, 2, 3, 4, 5, 5],
  X2 = [1.0, 2.0, 3.0, 4.0, 5.0, 5.0],
  X3 = [0.1, 0.2, 0.3, 0.4, 0.5, 0.5],
  X4 = ['a', 'b', 'c', 'd', 'e', 'e'],
  Y = [true, false, true, false, true, true],
)

# Cuenta de los niveles de X2
# Las cuentas estan en la columna x1 del dataframe resultante
combine(groupby(df, :X2), nrow)

"""
- `groupby(df, cols, skipmissing = false)`: Divide el dataframe en sub 
DataFrames de modo que nos es accesible via iteracion.
"""

for part in groupby(df, :X2, sort = true)
  println(unique(part[:, :X4]))
  # El tipo de la columna debe permitirnos calcular estadisticas
  println(summarystats(part[:, :X3]))
end

"""
- `aggregate(df, cols, f)`: Divide un dataframe en sub DataFrames por filas,
en donde cols son las columnas que conformaran los agrupamientos; f es la
funcion que se aplicara a los datos restantes, ademas podemos especificar
multiples funciones mediante el uso de un arreglo, por ejemplo: [sum, mean].
"""

keep2 = setdiff(names(df), [:X1, :X3])

# agg_res tiene las estadisticas en resumen de los niveles de X2
# MAD = Median Absolute Deviation
# agg_res = aggregate(df[:, keep2], [:X2], [length, mean, std, median, mad])

# aggregate fue removida
agg_res = combine(df[:, keep2], [:X2], :X2 .=> [length, mean, std, median, mad])
rename!(agg_res, :X2_length => :X2_n)
println(agg_res)

"""
A menudo los dataframes necesitan ser ordenados. Lo cual podemos conseguir
mediante la funcion sort!() El ! denota que es la version destructiva de un
sort, por lo que va a modificar el dataframe original y no generar una copia
como respuesta.
"""

println(sort!(df, [:X2, :Y], rev = [true, false]))
