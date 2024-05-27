# Destructive functions end with `!`

eltype([1, 2, 3]) # Int64|1
eltype([1.0, 2.0, 3.0]) # Float64
eltype(["a", "b", 'x']) # Any

in(1, [1, 2, 3]) # true
1 in [1, 2, 3] # true

issubset([1, 2], [1, 2, 3]) # true
indexin([1, 2], [1, 2, 3]) # [1, 2]

unique((x) -> x^2, [1, 2, 2, 3]) # [1, 2, 3]

unique([[12, 2, 55, 1],
        [1, 1, 2, 5],
        [8, 8, 2, 1],
        [1, 1, 1, 1]], dims=2)

allunique([-1, 0, 1]) # true
allunique([1, 1, 2]) # false

# Dict
dict = Dict(:a => 1, :b => 2, :c => 3)
first(dict) # :a => 1
collect(dict) # Pair{Symbol, Int64}[:a => 1, :b => 2, :c => 3]
collect(Pair{Symbol,Int64}, dict)

count(x -> x > 0, [1, 2, 3, -1, -2, -3]) # 3
maximum(x -> x^2, [1, 2, 3]) # 9

matrix = [[12, 2, 55, 1],
    [1, 1, 2, 5],
    [8, 8, 2, 1],
    [1, 1, 1, 1]]

maximum(matrix)

extrema(matrix)
extrema(-100:0.1:100)
extrema(["a", "b", "c"])

findmax([-2.1, 1e-10, 1.0, 2.0, 2e59]) # (2.0, 3)
findmin([-2.1, BigInt(-1.4e89), 1.0, 2.0, 2e59]) # (1.0, 3)

reduce(.*, [[1, 2, 3], [4, 5, 6], [7, 8, 9]]) # 362880
foldl(^, [2, 3, 4]) # 4096
foldr(&, [true, false, false]) # false
foldr(&, [true, true, true]) # true

matrix_of_ranges = [i:0.1:j for i in 1:30, j in 1:30]


any(x -> x > 0, [-1, -2, -3]) # false
all(x -> x > 0, [1, 2, 3]) # true

function my_factorial(n::Integer)::BigInt
    reduce(*, BigInt(1):BigInt(n))
end

function my_exp(x, n::Integer, factorial=my_factorial)
    reduce(+, [x^i / factorial(i) for i in 0:n])
end

my_exp(1, 10) # 2.7182818284590455

# Using generators, which do not allocate memory
my_exp2(x, n::Integer) = sum(x^i / my_factorial(i) for i in 0:n)

typeof(BigInt(1):BigInt(10)) # UnitRange{BigInt}

function my_maximum(arr::AbstractArray{T}) where {T}
    reduce(max, arr, init=-Inf)
end

my_maximum([1, 2, 3]) # 3

function my_minumum(arr::AbstractArray{T}) where {T}
    reduce(min, arr, init=Inf)
end

my_minumum([1, 2, 3]) # 1

