using BenchmarkTools

f(arr) = sum(x -> x^3, arr)
arr = rand(1024)

# La primera vez que se ejecuta una función, tiene que compilarse.
@time f(arr)

# $ significa interpolación
@benchmark f($arr)



# PROFILING

function elementmul(a, b)
    @assert all(size(a) .== size(b))
    c = similar(a)
    for i in eachindex(a)
        c[i] = a[i] * b[i]
    end
    return c
end

@belapsed elementmul(rand(1000), rand(1000))


"""
O(n^2): Time complexity
"""
function nearestneighbour(pointcloud)
    # Get the dimension and size of the pointcloud
    N, D = size(pointcloud)
    neighbours = zeros(Int, N)
    # Allocate a new array to store the result
    for i in 1:N
        point_i = pointcloud[:, i]
        # Set the current minimum distance to the
        # largest possible value, given the type.
        min_distance_squared = typemax(eltype(pointcloud))
        for j in 1:N
            point_j = pointcloud[:, j]
            distance_squared = sum((point_i .- point_j) .^ 2)
            if min_distance_squared < distance_squared
                min_distance_squared = distance_squared
                neighbours[i] = j
            end
        end
    end
    return neighbours
end


"""
O(n!): Time complexity
"""
function recursivecalc(n, a)
    if n == 1
        return a * a
    end

    s = 0.0
    for i in 1:n
        s += recursivecalc(n - 1, i)
    end

    return s
end



"""
Inserta un número en un arreglo ordenado
O(log(n)): Time complexity
"""
function insertintosorted!(numbers, num)
    n = length(numbers)
    startpoint = 1
    endpoint = n

    while startpoint - endpoint > 1
        midpoint = (startpoint + endpoint) ÷ 2
        if num < numbers[midpoint]
            endpoint = midpoint
        elseif num > numbers[midpoint]
            startpoint = midpoint
        else
            insert!(numbers, midpoint, num)
            return
        end
    end

    insert!(numbers, startpoint, num)
    nothing
end


function f_vectorised(x)
    y = similar(x)
    @. y = exp(x) * sin(x) * x + x^4 + 5 * sqrt(3 * x)
    return y
end

function f_native(x_arr)
    y = similar(x_arr)

    @inbounds for i in eachindex(x_arr)
        x = x_arr[i]
        y[i] = exp(x) * sin(x) * x + x^4 + 5 * sqrt(3 * x)
    end

    return y
end

# Order of iteration makes a big perfomance difference

function row_major_matrix_add!(C, A, B)
    @assert size(C) == size(A) == size(B)
    @inbounds for i in axes(A, 2)
        for j in axes(A, 1)
            C[i, j] = A[i, j] + B[i, j]
        end
    end
    nothing
end

function column_major_matrix_add(C, A, B)
    @assert size(C) == size(A) == size(B)
    @inbounds for j = axes(A, 2)
        for i in axes(A, 1)
            C[i, j] = A[i, j] + B[i, j]
        end
    end
    nothing
end




function cumulative_sum_preallocated(numbers)
    results = similar(numbers)
    total_sum = zeros(eltype(numbers))
    for i in eachindex(numbers)
        total_sum += numbers[i]
        results[i] = total_sum
    end
    return results
end

function cumulative_sum_appending(numbers)
    results = eltype(numbers)[]
    total_sum = zero(eltype(numbers))
    for i in eachindex(numbers)
        total_sum += numbers[i]
        push!(results, total_sum)
    end
    return results
end




function example_equation_no_cache(x)
    numerator = 5 .* x .^ 5 .* sin(x^2) .+ 20
    denominator = exp.(-4 .* x) .- x .^ 2
    y = numerator ./ denominator
    return y
end

function example_equation_cache(x)
    y = 5 .* x .^ 5 .* sin(x^2) .+ 20
    y ./= exp.(-4 .* x) .- x .^ 2
    return y
end


using StaticArrays


# Example of usage of StaticArrays


