using DataFrames
using CSV

"""
## Funciones utiles

- `eltype()`: Provee los tipos de cada elemento en un DataFrame.
- `head(df, n)`: Nos devuelve las primeras n filas.
- `tail(df, n)`: Nos devuelve las últimas n filas.
- `size(df)`: Devuelve una tupla con las dimensiones del DataFrame.
- `size(df, 1)`: Devuelve el numero de columnas.
- `size(df, 2)`: Devuelve el numero de filas.
- `describe(df)`: Nos da un resumen de las columnas del DataFrame.
- `colwise(f, df)`: Aplica la funcion f a las columnas en df.
- `delete!(df, col_symbol)`: Elimina una o mas columnas, donde las columnas
estan referenciadas por un simbolo o por un arreglo de simbolos. Por ejemplo
:x1 o [:x1, :x2].

- `rename!(df, :old_name => :new_name)`: Utiliza una estructura de datos de
par para especificar el nombre existente y el nuevo nombre. Podemos crear dicho
par de manera dinamica.

```julia
> rename!(df1, o => n for (o, n) = zip([:x1, :x2, :x3, :y],
  [:X1, :X2, :X3, :Y]))
```

- `filter(f, df)`: filtra las filas en el dataframe utilizando la funcion
provista en el primer argumento, y devuelve una copia de df con las filas
filtradas removiendo aquellas para las cuales f es false.

- `filter!(f, df)`: Actualiza el dataframe df, NO CREA UNA COPIA.

```julia
# Elimina las filas donde el estilo este ausente.
filter!(row -> !ismissing(row[:style]), df_recipe)
```

- `push!(df, item)`: Agrega uno o mas elementos al dataframe.

- `append!(df1, df2)`: Agrega df2 al final de df1.

"""

df = DataFrame(
  X1 = [1, 2, 3, 4, 5],
  X2 = [1.0, 2.0, 3.0, 4.0, 5.0],
  X3 = ['a', 'b', 'c', 'd', 'e'],
  Y = [true, false, true, false, true],
)

describe(df[:, :X1])
size(df)
