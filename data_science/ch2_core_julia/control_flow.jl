# Podemos utilizar bloques o encadenamiento para formar
# expresiones compuestas
b1 = begin
  c = 20
  d = 5
  c * d
end

println("b1: ", b1) # 100

# Encadenamiento
b2 = (c = 20; d = 5; c * d)
println("b2: ", b2)



## Evaluacion condicional

k = 1
if k == 0
  "zero"
else
  "not zero"
end # not zero

k = 11
if k % 3 == 0
  0
elseif k % 3 == 1
  1
else
  2
end # 2

# Evaluacion de corto circuito

# A ? se le conoce como el operador ternario
# asocia de derecha a izquierda y resulta util en
# sentencias condicionales cortas.

b = 10;
c = 20;
println("SCE: b < c: ", b < c ? "less than" : "not ledd than")

# Evaluacion de corto circuito con anidacion

d = 10;
f = 10;
println("SCE: chained d vs e: ", d < f ? "less than " : d > f ? "greater than " : "equal")


# e es una literal en Julia, por lo que sin declarar
# podemos hacer uso de la funcion exponencial

# Aunque posible, se recomienda no sobreescribirla
using Base.MathConstants
e
