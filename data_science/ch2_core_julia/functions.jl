# Las funciones son objetos de primer orden
# en Julia, por lo que podemos asignarlas a variables,
# llamarlas desde dichas variables, pasarlas como
# argumentos a otras funciones y devolverlas como
# resultado de otra funcion.

function add(x, y)
    return (x + y)
end

# Se recomienda utilizar solo letras minusculas
# y evitar abreviaciones como fib en lugar de fibonacci

# Se utilizan los parentesis para llamar a las funciones

# Forma de asignacion
add2(x, y) = x + y

# Los argumentos son pasados mediante referencia, por ejemplo
# las modificaciones a la estructura de datos de entrada 
# seran visibles fuera de la funcion (efectos secundarios)

# Si no se va a modificar ningun input de la funcion, se recomienda
# realizar una copia de la informacion antes de realizar cualquier
# alteracion al estado.

## Argument passing
function f1!(x)
    x[1] = 9999
    return (x)
end

ia = Int64[0, 1, 2]
println("Array ia: ", ia)
# Array ia: [0, 1, 2]

f1!(ia)
println("Paso de argumentos por referencia: ", ia)

# Por defecto, la ultima expresion que se evalua en el
# cuerpo de una funcion es su valor de retorno, pero podemos
# utilizar return

function gt(g1, g2)
    if g1 > g2
        return "$g1 is largest"
    elseif g1 < g2
        return "$g2 is largest"
    else
        return "$g1 and $g2 are equal"
    end
end

gt(2, 4) # "4 is largest"

# La mayoria de operadores en realidad son funciones

+(1, 3)
*(2, 3)

# Funciones anonimas, normalmente utilizadas como
# argumentos que se pasan a funciones que reciben funciones

a = [1, 2, 3, 1, 2, 1]
μ = mean(a)
sd = std(a)

## centra y escala a
b = map(x -> (x - mu) / sd, a)

# Podemos especificar argumentos por defecto para los
# parametros de la funcion

function fibonacci(n=20)
    if n <= 1
        return 1
    else
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
end

fibonacci(12) # 233

# Son equivalentes:
fibonacci(20)
fibonacci()

