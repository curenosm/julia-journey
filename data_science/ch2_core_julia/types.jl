# Numericos

# La variable interna Sys.WORD_SIZE muestra el tipo de arquitectura (32/64 bits)
Sys.WORD_SIZE

# Valores máximos para un tipo determinado, estos tipos son especificos para
# cada máquina
typemin(Int) # Primitiva por defecto
typemax(Int64)

# Los tipos signados utilizan el bit mas significativo para el signo
literal_int = 1

# Los no signados pueden alojar valores más grandes, pero aún son propensos
# a errores del tipo overflow, en ese caso es recomendable BigInt
println("typeof(literal_int): ", typeof(literal_int))

x = typemax(Int64)
x += 1
cond = x > typemax(Int64) # false

x = typemin(Int64)
x -= 1
cond = x < typemin(Int64) # false

# Booleanos
x = Bool(0) # true
y = Bool(1) # false


# Flotantes (IEEE-754)

# Significan: Precision
# Base
# Exponente: Entero con signo que cambia la posicion del punto

# Las literales Float64 se distingan por tener 'e' antes de la potencia y pueden 
# ser hexadecimales, los Float32 en su lugar utilizan una 'f'.

# Tambien tenemos tres valores que no están en la recta real
Inf # Mayor a cualquier otro valor de punto flotante, excepto NaN
-Inf

# Devuelve 'false' al intentar compararlo con otro valor de punto flotante
# incluso con el mismo
NaN
NaN == NaN # false

# ES BUENA PRACTICA CHECAR LOS CASOS LÍMITE EN OPERACIONES CON Float

x1 = 1.0
x64 = 15e-5
x32 = 2.5f-4

typeof(x32) # Float32

# Separando digitos con guión bajo
9.2_4 == 9.24 # true

isnan(0 / 0)
isinf(1 / 0)
isinf(-11 / 0)
y1 = 2 * 3
isnan(y1) # false
isinf(y1) # false

y2 = 2 / 0 # Inf
isnan(y2) # false
isinf(y2) # true

# También hay errores de overflow para los flotantes, en particular cuando
# el resultado de un cálculo es mas pequeño que el 'Machine Epsilon' o cuando
# números con una precisión similar son substraidos uno del otro.

# Machine Epsilon: El vlaor mas pequeño de z que tal que 1 + z != 1
ϵ = eps()

# Se tiene que el espaciado entre un numero de punto flotante x y uno adyacente
# es a lo más:
ϵ * abs(x)

n1 = [1e-25, 1e-5, 1.0, 1e5, 1e25]

for i in n1
  println(*(i, ϵ))
end


# Strings (Secuencia de puntos Unicode, utilizando codificación UTF-8)

# Los primeros 128 puntos unicode corresponden a los caracteres ASCII

# Char es el tipo integrado para representar caracteres individuales, de hecho
# Char es un valor númerico que representa un code point de Unicode.

# Los Strings son inmutables, por lo que tenemos que formar siempre un nuevo
# string en caso de que necesitemos efectuar una modificacion.

s1 = "Hi"
s2 = """I have a "quote" character""" # "I have a \"quote\" character"

# Podemos obtener una subcadena, mediante indexado (que empieza en 1)
s2[4:6]

# Concantemos utilizando la funcion 'string', el operador '*', o bien haciendo
# uso de interpolación de cadenas.

str = "Data science is fun!"
str[1] # 'D'
str[end] # '!'

## Slicing
str[4:7] # "a sc"

str[end-3:end] # "fun!"

# Concatenacion
string(str, " Sure is :)")
str * " Sure is :)"

# Interpolacion
"1 + 2 = $(1 + 2)" # "1 + 2 = 3"

word1 = "Julia"
word2 = "data"
word3 = "science"
"$word1 is greate for $word2 $word3" # Julia is great for data science


# Funciones utiles
pat = "a"
findfirst(pat, str) # Devuelve un índice
occursin(pat, str)
repeat(str, 4)
length(str)
replace(str, pat => "ϵ")

# Las expresiones regulares en Julia son totalmente compatibles con Perl y se
# utilizan para cazar patrones en cadenas de texto.
regex = r"^[a-zA-Z0-9]+" # Se prefijan con 'r'

# Funciones utiles
occursin(regex, str)
# Primer match en la cadena str, si no hay match Devuelve el valor especial 
# que utiliza Julia: "nothing"
match(regex, str)
eachmatch(regex, str) # Devuelve todos los matches

s1 = "abcd"
s2 = "abce"
s1 == s2 # false

# Comparación lexicográfica
s1 < s2
s1 > s2

# Guarda los resultados exitosos de la búsqueda en un vector
collect(eachmatch(r"[^a-zA-Z0-9]", str))



# Tuplas

tup1 = (3.0, 9.1, 0.8, 1.9)
println(tup1)
typeof(tup1) # NTuple{4, Float64}

# Los elementos pueden tener diferentes tipos
tup2 = ("Data", 2.5, "Science", 8.8)
typeof(tup2) # Tuple{String,Float64,String,Float64}

# Asignacion de variables
a, b, c = ("Fast", 1, 5.2)
println(a, b, c)
