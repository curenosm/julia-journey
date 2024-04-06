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
mapreduce(sin, *, a; dims = 2)

b = CUDA.zeros(1)
Base.mapreducedim!(identity, +, b, a)


# Para retener valores intermedios
# Debe tratarse de un operador asociativo
a = CUDA.ones(2, 3)
accumulate(+, a; dims = 2)

# Operaciones Lógicas
a = CuArray([1, 2, 3])
a
a[[false, true, false]]

a = CuArray([11, 12, 13])
findall(isodd, a)
findfirst(isodd, a)

b = CuArray([11 12 13; 21 22 23])
findmin(b)
findmax(b; dims = 1)
findmax(b; dims = 2)

# Wrappers de Arrays
a = CuArray(collect(1:10))
a = CuArray(collect(1:6))
b = reshape(a, (2, 3))
c = view(a, 2:5)
