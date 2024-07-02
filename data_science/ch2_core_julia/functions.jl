using Statistics

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
# b = map(x -> (x - μ) / sd, a)

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

# Funciones con argumentos nombrados (se especifican despues de ;)
# se evaluan de izquierda a derecha, por lo que las podemos utilizar
# en las deifiniciones de argumentos mismas.


# Estimaremos la mediana de un arreglo 1 dimensional utilizando el algoritmo
# MM por claridad 

function mm_median(x, ϵ=0.001; maxit=25, iter::Int64=Int(floor(ϵ)))
    # Inicializacion
    ψ = fill!(Vector{Float64}(undef, 2), 1e2)

    while true
        iter += 1
        if iter == maxit
            println("Iteración máxima alcanzada en iter=$iter")
            break
        end

        num, ρ = (0, 0)
        ## usa map() para hacer operaciones elemento a elemento en wgt
        wgt = map(d -> abs(d - ψ[2])^(-1), x)
        num = sum(map(*, wgt, x))
        ρ = sum(wgt)
        ψ = circshift(ψ, 1)
        ψ[2] = num / ρ

        δ = abs(ψ[2] - ψ[1])
        if δ < ϵ
            println("Convergió en la iteración $iter")
            break
        end
    end

    return Dict(
        :psi_vec => ψ,
        :median => ψ[2]
    )
end

# Lo corremos con datos simulados
using Distributions, Random
Random.seed!(1234)

N = Int(1e3)
dat = rand(Normal(0, 6), N)

# Llamada a la función con diferentes tipos de argumentos
median(dat) # 0.279
mm_median(dat, 1e-9)[:median]
mm_median(dat, maxit=50)[:median]
mm_median(dat, 1e-9, maxit=100)[:median]

# TIPS

# 1. Dividir el problema en funciones
# 2. Las funciones no deberian operar sobre variables globales
# 3. Por convencion se pone ! al final del nombre de las funciones que
#    modifican el estado de sus argumentos.
# 4. No sobreutilizar las funciones anonimas
# 5. Utilizar Int en funciones para los enteros, cambian el tipo resultante con
#    menos frecuencia. (Promoción de Tipos)
# 6. Asegurar el correcto tipo de argumentos antes de pasarlos a una funcion con
#    anotaciones de tipo.

a1 = [2, 3, 1, 6, 2, 8]
sort!(a1) # Tip 3
a1

A = [1, -0.5, -2, 0.5]
map(x -> abs(x), A) # No envolvemos abs en otra funcion anonima

# En su lugar, hacemos:
map(abs, A) # Tip 4

# Tip 5: Promoción de Tipos
times1a(y) = *(y, 1)
times1b(y) = *(y, 1.0)
println("times1a(1/2): ", times1a(1 / 2))
println("times1a(2): ", times1a(2)) # Preserva el tipo
println("times1a(2.0): ", times1a(2.0))
println("times1b(1/2): ", times1b(1 / 2))
println("times1b(2): ", times1b(2)) # Cambia el tipo
println("times1b(2): ", times1b(2.0))

# Tip 6: Función con argumentos tipados
times1c(y::Float64) = *(y, 1)
times1c(float(23)) 
