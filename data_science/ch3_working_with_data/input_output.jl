"""
# Caracteristicas del paquete CSV.jl

- `fullpath`: Es un String que representa el path al archivo de texto delimitado
- `Data.sink`: Usualmente es un DataFrame pero puede ser cualquier Data.Sink en
el paquete `DataStreams.jl` que está diseñado para transferir eficientemente
streams de datos del tipo tabulado. Algunos ejemplos de data sinks incluyen
Arrays, DataFrames, y bases de datos (SQLite.jl, ODBC.jl, etc)

- `delim`: es un caracter que representa cómo están delimitados los campos en el
archivo (| o , )

- `quotechar`: es el caracter utilizado para envolver datos que pudieran contener
saltos de linea o caracteres delimitadores como comas o barras verticales.
(Regularmente se trata de ")

- `types`: especifica los tipos de las columnas en un arreglo de tipo DataType
o un diccionario con llaves correspondientes al nombre de la columna o numero y
los valores correspondientes a los tipos de dato de las columnas.

"""


# Podemos utilizar la funcion cd("...") para cambiar el directorio de trabajo
# en el REPL, tambien tenemos la funcion homedir()

# Los usuarios de Windows tienen que escapar el backslash en el path, por lo que
# se utilizan dos backslashes en lugar de uno.

homedir()
# "/Users/curenosm"

cd("$(homedir())/Desktop/")
pwd()
# "/Users/curenosm/Desktop"

using CSV
using DataFrames
using JLD2
using MLJ
using MLLabelUtils
using Query
using Random
using StatsBase

include("chp3_functions.jl")
Random.seed(24_908)

# Tipos para las columnas de los archivos

IntOrMiss = Union{Int64, Missing}
FltOrMiss = Union{Float64, Missing}
StrOrMiss = Union{String, Missing}

# Definimos los nombres para cada columna
recipe_header = [
  "beer_id", "name", "url", "style", "style_id", "size",
  "og", "fg", "abv", "ibu", "color", "boil_size", "boil_time", "biol_grav",
  "efficiency", "mash_thick", "sugar_scale", "brew_method", "pitch_rate",
  "pri_temp", "prime_method", "prime_am"]

## Diccionario de tipos para cada columna
recipe_types2 = Dict{String, Union}(
  "beer_id" => IntOrMiss,
  "name" => StrOrMiss,
  "url" => StrOrMiss,
  "style" => StrOrMiss,
  "style_id" => IntOrMiss,
  "size" => FltOrMiss,
  "og" => FltOrMiss,
  "fg" => FltOrMiss,
  "abv" => FltOrMiss,
  "ibu" => FltOrMiss,
  "color" => FltOrMiss,
  "boil_size" => FltOrMiss,
  "boil_time" => IntOrMiss,
  "biol_grav" => FltOrMiss,
  "efficiency" => FltOrMiss,
  "mash_thick" => FltOrMiss,
  "sugar_scale" => FltOrMiss,
  "brew_method" => StrOrMiss,
  "pitch_rate" => FltOrMiss,
  "pri_temp" => FltOrMiss,
  "prime_method" => StrOrMiss,
  "prime_am" => FltOrMiss,
)

# Leemos el archivo CSV
df_recipe_raw = CSV.read("recipeData.csv",
  DataFrame;
  delim = ',',
  quotechar = '"',
  missingstring = "N/A",
  datarow = 2,
  types = recipe_types2,
  allowmissing:=:all
)

## Descartamos columnas
delete!(df_recipe_raw, [:recipe_method, :prime_am, :url])

#####
## Escribimos los datos crudos del dataframe
JLD2.@save "recipeRaw.jld2" df_recipe_raw

################################
## Creamos la version limpia

## Creamos una copia del DF
df_recipe = deepcopy(df_recipe_raw)

## Excluimos los estilos faltantes
filter!(row -> !ismissing(row[:style]), df_recipe)

println("-- df_recipe: ", size(df_recipe))
# df_recipe: (73861, 19)

## Formamos categorias de cervezas
df_recipe[!, :y] = map(x ->
  occursin(r"ALE"i, x) || occursin(r"IPA"i, x) || occursin(r"Porter"i, x) 
   || occursin(r"stdout"i, x) ? 0 :
  occursin(r"larger"i, x) || occursin(r"pilsner"i, x) || occursin(r"bock"i, x)
   || occursin(r"okto"i, x) ? 1 : 99,
df_recipe[:style])

## Eliminamos los estilos que no sean lagers or ales
filter!(row -> row[:y] != 99, df_recipe)

# Removemos otras columnas
delete!(df_recipe, [:beer_id, :name, :style, :style_id])

## Creamos variables dummy y utilizamos one hot encoding
onehot_encoding!(df_recipe, "brew_method", trace = true)
onehot_encoding!(df_recipe, "sugar_scale")

describe(df_recipe, [:eltype, :nmissing])

delete!(df_recipe, [:brew_method, :sugar_scale])
