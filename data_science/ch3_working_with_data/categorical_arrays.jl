using CategoricalArrays
using StatsBase

# En Julia los datos categoricos se representaan por arreglos de tipos
# CategoricalArray, que se define en el paquete CategoricalArrays.jl

# Ventajas:

# * Guardan memoria representando cada valor único del arreglo de cadenas como
#   si se tratase de un índice.
# * Cada índice corresponde a un nivel.
# * Despues de limpiar los datos, usualmente hay solo un pequeño número de 
#   niveles

# Además soporta valores ausentes. El tipo CategorialArray{Union{T, Missing}}
# es utilizado para representar valores faltantes.

## Número de entradas para los arreglos categoricos
Nca = 50

## Arreglo vacío
v3 = Array{Union{String,Missing}}(undef, Nca)

## El arreglo tiene un string y valores ausentes
v3 = [isodd(i) ? sample(["High", "Low"], pweights([0.35, 0.65])) : missing for i = 1:Nca]

## v3c es de tipo CategoricalArray{Union{Missing, String}, 1, UInt32} 
v3c = categorical(v3)

# Los niveles deberían de ser ["High", "Low"]
println("1. levels(v3c): ", levels(v3c))
# 1. levels(v3c): ["High", "Low"]

# Niveles reordenados - no cambia los datos
levels!(v3c, ["Low", "High"])
println("2. levels(v3c):", levels(v3c))
# 2. levels(v3c): ["Low", "High"]

println("2. v3c: ", v3c)
# 3. v3c: Union{Missing, CategoricalString{UInt32}}
# ["High", missing, "Low", missing, "Low", missing, "High", missing, "Low", missing]

"""
# Funciones Utiles

1. `levels()`: Devuelve los niveles del CategoricalArray.
2. `levels!()`: Cambia el orden de los niveles del arreglo.
3. `compress()`: Comprime el arreglo guardando memoria.
4. `decompress()`: Descomprime el arreglo comprimido.
5. `categorical(ca)`: Convierte el arreglo ca en un arreglo de tipo
CategoricalArray.
6. `droplevels!(ca)`: Descarta los niveles que ya no estan presentes en el
arreglo ca. Esto resulta util cuando un DataFrame ha sido filtrado y algunos
niveles no estan presentes en el DataFrame filtrado.
7. `recode(a, pairs)`: Recodifica los niveles del arreglo. Los nuevos niveles
deberían de ser del mismo tipo que los niveles originales.
8. `recode!(new, orig, pairs)`: Recodifica los niveles del arreglo _origin_
utilizando los pares de valores en _pairs_ y coloca los nuevos niveles en _new_.
"""

v5 = [sample([0, 1, 2], pweights([0.2, 0.6, 0.2])) for i = 1:Nca]

# Un arreglo de strings vacío
v5b = Array{String}(undef, Nca)

## Recodifica el arreglo de valores enteros y guardalos en v5b
recode!(v5b, v5, 0 => "Apple", 1 => "Orange", 2 => "Pear")
v5c = categorical(v5b)

println(typeof(v5c))
# CategoricalArray{String, 1, UInt32, String, CategoricalString{UInt32}, Union{}}

println(levels(v5c))
# ["Apple", "Orange", "Pear"]
