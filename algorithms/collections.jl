collection_1 = [1, 2, 3, 4, 5]
isempty(collection_1)

empty!(collection_1)
length(collection_1)

[], typeof([]), isempty([])

empty!([1, 2, 3]), empty!(Set([1, 2, 3]))
length(empty!([1, 2, 3])), length(empty!(Set([1, 2, 3])))
length(empty!(Dict("a" => 1, "b" => 2)))


# No sustituye nada por que el rango no de posiciones está vacío.
v = [1, 2, 3]; splice!(v, 2:1, [20, 30])
v

length(2:1)


# TODO: Escribir tu propio REPL

# TODO: Escribir una función que calcula el logaritmo natural utilizando su
# serie de Taylor. Compara la velocidad y cantidad de memoria utilizada de
# cinco versiones utilizando reduce, sum, mapreduce, array comprehensions y
# generadores.



