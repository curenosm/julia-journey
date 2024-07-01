# Condiciones inesperadas que pueden acontecer durante
# la ejecucion de nuestro programa

# Por ejemplo, si llamaramos:
# log(-1)

# Podemos arrojar una excepcion explicitamente haciendo:
# throw()

#=
for i in [1, 2, -1, 3]
    if i < 0
        throw(DomainError())
    else
        println("i: $(log(i))")
    end
end
=#

# error
for i in [1, 2, -1, 3]
    if i < 0
        # Inmediatamente detiene la ejecucion de todo el
        # programa en Julia, arrojando un ErrorException()
        error("i is a negative number")
    else
        println("i: $(log(i))")
    end
end

# Si queremos verificar que no suceda una excepcion
# y en caso de que pase podamos manejarla apropiadamente 
# usamos un bloque try-catch

for i in [1, 2, -1, "A"]
    try
        log(i)
    catch ex
        if isa(ex, DomainError)
            println("i: $i --- Domain Error")
            log(abs(i))
        else
            println("i: $i")
            println(ex)
            error("Not a DomainError")
        end
    end
end

# Para codigo de alta eficiencia los bloques try-catch
# pueden degradar el rendimiento, por lo que se recomienda
# evaluacion condicional para manejar todas las excepciones
# conocidas.

