using DataFrames
using StatsBase
using Query

"""
Paquete influenciado por LINQ para C#, nos permite hacer queries a bases de
datos relacionales.

## Pseudocodigo de Query.jl
```julia
x_obj = @from <range_var> in <data_source> begin
  <statements>
end
```

"""

df_recipe = DataFrame(
  id=["id$i" for i in rand(1:10000)],
  y=rand(0:1, 1000),
  pri_temp=rand(10:30, 1000),
  color=rand(0:30, 1000), # rand(["red", "blue", "green"], 1000)
  ibu=rand(0:100, 1000)
)

x_obj = @from i in df_recipe begin
  @where i.y == 1 && i.pri_temp > 20
  @select {i.y, i.pri_temp, i.color} # Proyección: pueden ser tuplas nombradas
  # @select (y = i.y, pri_temp = i.pri_temp, color = i.color)
  # @select (; y, pri_temp, color)
  @collect DataFrame # Data sink
  # Pueden ser array, dataframes, dictionaries, o cualquier stream de datos
  # en DataStreams.jl, entre otros...
end

typeof(x_obj)
# DataFrame

names(x_obj)
# Symbol[3]
# :y
# :pri_temp
# :color

size(x_obj)
# (333, 33)

### Ejemplo 2

a1_obj = @from i in df_recipe begin
  @where i.y == 1 && i.color <= 5.0
  @select {i.color, i.ibu}
  @collect # Por defecto se utiliza Array
end

println(a1_obj)

a2_obj = @from i in df_recipe begin
  @where i.y == 1 && i.color <= 5.0
  @select {col = i.color, ibu = i.ibu}
  @collect
end

println(a2_obj)

N = size(a2_obj)[1]
a2_array = zeros(N, 2)

for (i, v) in enumerate(a2_obj)
  a2_array[i, 1] = v.col
  a2_array[i, 2] = v.ibu
end

println(a2_array)

## Ejemplo 3

dict_obj = @from i in df_recipe begin
  @where i.y == 1 && i.color <= 5.0
  @select i.id => i.color
  @collect Dict
end

println(dict_obj)
println(typeof(dict_obj))

# Tambien podemos crear lo que se conocen ocmo range variables, que son
# variables que se utilizan para iterar sobre los elementos de un data source

# El siguiente ejemplo centra cada columna para que tenga una media de 0 así
# como una desviación estándar de 1

# Una buena idea en estos casos es definir un diccionario que mapee el tipo de
# columna con la función que se desea aplicar

using Statistics, StatsBase

# Todos los valores missing seran saltados en los calculos
# Utilizamos un const tipado para asegurar que la inferencia de tipo ocurra
# de manera correcta

const cs_dict = Dict{String,Float64}()

push!(cs_dict, "m_color" => mean(skipmissing(df_recipe[:, :color])))
push!(cs_dict, "m_ibu" => mean(skipmissing(df_recipe[:, :ibu])))
push!(cs_dict, "sd_color" => std(skipmissing(df_recipe[:, :color])))
push!(cs_dict, "sd_ibu" => std(skipmissing(df_recipe[:, :ibu])))

# Centramos en la media y escalamos una columna para finalmente devolver un 
# arreglo.

s1_obj = @from i in df_recipe begin
  @let ibu_cs = (i.ibu - cs_dict["m_ibu"]) / cs_dict["sd_ibu"]
  @select ibu_cs
  @collect
end

println(s1_obj)
println(mean(skipmissing(s1_obj)))
println(std(skipmissing(s1_obj)))

## Utilizamos tuplas nombradas

s2_obj = @from i in df_recipe begin
  @let ibu_cs = (i.ibu - cs_dict["m_ibu"]) / cs_dict["sd_ibu"]
  @let color_cs = (i.color - cs_dict["m_color"]) / cs_dict["sd_color"]
  @select {id = i.id, ibu = ibu_cs, color = color_cs}
  @collect DataFrame
end

println(s2_obj)
println(mean(skipmissing(s2_obj[:, :color])))
println(std(skipmissing(s2_obj[:, :color])))

## Ejemplo 4 - Trabajando con multiples datasets

beer_style = DataFrame(id=0:1, beername=["Ale", "Lager"])

## Inner Join
ji_obj = @from i in df_recipe begin
  @join j in beer_style on i.y equals j.id
  @select {i.y, j.beername}
  @collect DataFrame
end

println(ji_obj)

"""
A menudo tambien quisieramos agrupar los datos en categorías así como calcular
aggregate summaries para dichos grupos.

En el query los valores ausentes son representados como instancias del tipo de
dato de DataValue, por lo que podemos usar la funcion isna() de dicho paquete
para filtrar los valores ausentes y no `ismissing()`

Agregamos los datos basados en los valores de su media.
"""

using DataValues

g1_obj = @from i in df_recipe begin
  @where !isna(i.ibu)
  @group i by i.y into grp
  @select {Group = key(grp), Mean_IBU = mean(grp.ibu),
    TrimM_IBU = mean(trim(grp.ibu; prop = 0.2))}
end
