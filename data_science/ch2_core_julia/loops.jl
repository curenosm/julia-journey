# Basicos

str = "Julia"

# For loop con una cadena, iterando por índice
for i = 1:length(str)
    print(str[i])
end

# For loop para un string iterando por container element
for s in str
    print(s)
end

# For loop anidado
for i in str, j = 1:length(str)
    println((i, j))
end

odd = [1, 3, 5]
even = [2, 4, 6]
for i in odd, j in even
    println("i*j: $(i*j)")
end

# Ejemplos de ciclo while, donde se ejecuta
# el cuerpo mientras la expresion condicional sea verdadera

n = 0
x = 1
while x < 10
    global n
    n = n + 1
end

# Un ciclo while para estimar la mediana utilizando
# un algoritmo MM
using Distributions, Random
Random.seed!(1234)

iter = 0
N = 100
x = rand(Normal(2, 1), N)
Ψ = fill!(Vector{Float64}(undef, 2), 1e9)
while true
    global iter, x, psi
    iter += 1
    if iter == 25
        println("Maxima iteracion alcanzada en=$iter")
        break
    end
    num, den = (0, 0)
    # operaciones elemento a elemento en wgt
    wgt = (abs.(x .- Ψ[2])) .^ -1
    num = sum(wgt .* x)
    den = sum(wgt)
    Ψ = circshift(Ψ, 1)
    Ψ[2] = num / den

    dif = abs(Ψ[2] - Ψ[1])
    if dif < 0.001
        print("Converge en iteracion $iter")
        break
    end
end

# Estimado de la mediana
median(x) # 1.959
print(Ψ[2]) # 1.959


# Terminando un ciclo

# En algunos casos puede resultar terminar un ciclo
# antes de que complete su finalizacion.

i = 0
while true
    global i
    sq = i^2
    println("i: $i --- sq: $sq")
    if sq > 16
        break
    end
    i += 1
end

# i: 0 --- sq: 0
# i: 1 --- sq: 1
# i: 2 --- sq: 4
# i: 3 --- sq: 9
# i: 4 --- sq: 16
# i: 5 --- sq: 25

for i = 1:10
    sq = i^2
    println("i: $i --- sq: = $sq")
    if sq > 16
        break
    end
end

# En otros casos simplemente necesitamos saltar un
# paso en la ejecucion y continuar con el siguiente

for i in 1:5
    if i % 2 == 0
        continue
    end
    sq = i^2
    println("i: $i --- sq: $sq")
end

# i: 1 --- sq: 1
# i: 3 --- sq: 9
# i: 5 --- sq: 25
