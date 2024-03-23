create_hilbert_matrix(n::Int) = [1/(i + j - 1) for i=1:n, j=1:n]


local res1 = create_hilbert_matrix(3)

print(res1)
