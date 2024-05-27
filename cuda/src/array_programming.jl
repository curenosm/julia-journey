using CUDA

CuArray{Int}(undef, 2)
CuArray{Int}(undef, (1, 2))
similar(ans)

a = CuArray([1, 2])
b = Array(a)
copyto!(b, a)

# Abstracción de alto nivel

a = CuArray{Float32}(undef, (1, 2))
a .= 5
map(sin, a)

a = CUDA.ones(2, 3)
reduce(+, a)
mapreduce(sin, *, a; dims=2)

b = CUDA.zeros(1)
Base.mapreducedim!(identity, +, b, a)


# Para retener valores intermedios
# Debe tratarse de un operador asociativo
a = CUDA.ones(2, 3)
accumulate(+, a; dims=2)

# Operaciones Lógicas
a = CuArray([1, 2, 3])
a
a[[false, true, false]]

a = CuArray([11, 12, 13])
findall(isodd, a)
findfirst(isodd, a)

b = CuArray([11 12 13; 21 22 23])
findmin(b)
findmax(b; dims=1)
findmax(b; dims=2)

# Wrappers de Arrays
a = CuArray(collect(1:10))
a = CuArray(collect(1:6))
b = reshape(a, (2, 3))
c = view(a, 2:5)

a = CuArray(collect(1:1_000_000))
b = reshape(a, 1_000, 1_000)

a .= 123123123

a

# # Texto en Markdown 
#
# Ejemplo utilizando Literate.jl
#

#=
This multiline comment
is treated as markdown.
=#

#=====================
This is also markdown.
=====================#

md"""
# Title
blah blah blah
"""


N = 2^20
x = fill(1.0f0, N) # Un vector lleno de puros 1.0 de tipo Float32
y = fill(2.0f0, N) # Un vector lleno de puros 2.0 de tipo Float32

y .+= x

# Paralelización en la CPU

function sequential_add!(y, x)
    for i in eachindex(y, x)
        @inbounds y[i] += x[i]
    end
    return nothing
end

fill!(y, 2)
sequential_add!(y, x)
@test all(y .== 3.0f0)


# Implementación en paralelo

function parallel_add!(y, x)
    Threads.@threads for i in eachindex(y, x)
        @inbounds y[i] += x[i]
    end
    return nothing
end

fill!(y, 2)
parallel_add!(y, x)
@test all(y .== 3.0f0)


# Verificamos cuantos hilos está utilizando Julia
# con JULIA_NUM_THREADS=4 en una máquina de al menos 4 núcleos

using BenchmarkTools

@btime sequential_add!($y, $x)
# vs
@btime parallel_add!($y, $x)


using CUDA
x_d = CUDA.fill(1.0f0, N) # Se guarda en la GPU
y_d = CUDA.fill(2.0f0, N) # Se guarda en la GPU

y_d .+= x_d
@test all(Array(y_d) .== 3.0f0) # Array() lo mueve al host

function add_broadcast!(y, x)
    # Bloquea la CPU para hacer la operación en la GPU
    CUDA.@sync y .+= x
    return
end

@btime add_broadcast!($y_d, $x_d)


# Misma funcionalidad utilizando un kernel de GPU

function gpu_add1!(y, x)
    for i = 1:length(y)
        @inbounds y[i] += x[i]
    end
    return nothing
end

fill!(y_d, 2)
@cuda gpu_add1!(y_d, x_d) # Compila el kernel para la GPU
# posteriores ejecuciones son más rápidas
@test all(Array(y_d) .== 3.0f0)
