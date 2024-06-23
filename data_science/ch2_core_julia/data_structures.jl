# Arreglos

# Grid multidimensional de elementos del mismo tipo, por optimizacion

# No requieren vectorización, para realizar operaciones eficientes sobre uno

println(Array <: AbstractArray)

# Bloque contiguo de memoria, mientras que otros subtipos no lo son
# como SparseMatrixCSC y SubArray

# Podemos utilizar undef para crear un arreglo sin inicializarlo
# nothing para crear arreglos sin valores o missing para crear arreglos
# de valores faltantes.

a1 = Array{Int64}(undef, 5)
a2 = Array{Int64}(undef, (2, 2))
a2 = Array{Any}(undef, (2, 2))

# También podemos utilizar [] para generar arreglos, incluso con Vector()
# Matrix(), collect()

# Vector fila
a4 = [1, 2, 3] # No cuenta con una segunda dimensión

# Vector columna -- Arreglo multidimensional
a5 = [1 2 3]

# En pocas palabras, Julia hace una distinción entre Array{T, 1} y Array{T, 2}

# Matriz
a6 = [80 81 82; 90 91 92]
a7 = Float64[3.0 5.0; 1.1 3.5]
Vector(undef, 3)
Matrix(undef, 2, 2)
a3 = collect(Float64, 3:-1:1)

# Funciones utiles para generar arreglos
# zeros(T, d1, ...)
# ones(T, d1, ...)

# Entradas aleatorias entre 0 y 1, si se especifica un arreglo como primeros
# argumento, entonces se hace una seleccion de entre los elementos del mismo
# rand(T, d1, ...) 

# Arreglo multidimensional con datos aleatorios de la dist. normal

# randn(T, d1, ...) 
# MatrixT(I, (n, n)) - Matriz identidad
# fill!(A, x) - Arreglo con puras x como entradas


# Concatenación de Arreglos (Con las mismas dimensiones)

# vcat(A1, A2, ...) - Pone A1 arriba de A2
# hcat(A1, A2, ...) - Pone A1 a la izquierda de A2


# Ejemplo de majejo de arreglos
begin

    using LinearAlgebra
    imat = Matrix{Int8}(I, (2, 2))

    rand(2)

    B = [80 81 82; 90 91 92]

    rand(B, 2) # Selecciona dos elementos de B
    length(B) # Tamaño del arreglo (cantidad de elementos)
    size(B) # Dimensiones (Tupla)
    ndims(B) # Número de dimensiones
    reshape(B, (3, 2))

    # Copia de B generada recursivamente
    B2 = deepcopy(B)

    # Al hacer slicing, pasamos un slice por cada dimensión
    B[1:2,]
    B[1:2, 1]
    B[1:2, 2]
    B[1, :] # Primera fila
    B[3] # Tercer elemento

    # Tambien podemos generarlos utilizando list comprehension
    A1 = [sqrt(i) for i in [16, 25, 64]]
    A2 = [i^2 for i in [1, 2, 3]]

    # JULIA CUENTA LOS ELEMENTOS DE UN ARREGLO POR COLUMNAS, ES DECIR

    #= El 4 elemento de:
    1 | 2 | 3
    4 | 5 | 6
    7 | 8 | 9

        |
        v
    1 | 2 | 3
    |
    v
    4 | 5 | 6
    |
    v
    7 | 8 | 9
    |
    v

    Es el número 2
    =#

end


# Diccionarios

# Estructuras asociativas formadas por pares llave-valor, de tipo
# Pairtypeof(key), typeof(value), lo cual crea un objeto de tipo Pair
# de igual manera se puede utilizar el símbolo => para separar la llave y
# el valor asociada en el par.



