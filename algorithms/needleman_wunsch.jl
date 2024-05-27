bases = "ACGT"

d = -5 # Penalización por salto

S_matrix = [
    [10, -1, 3, -4],
    [-1, 7, -5, -3],
    [-3, -5, 9, 0],
    [-4, -3, 0, 8]
]

A = "ACGTCAGACGATATATCCACA"
B = "ACGTCATATCCA"

"""
Needleman-Wunsch algorithm for global alignment of two sequences.
"""
function needleman_wunsch(A::String, B::String)
    n = length(A)
    m = length(B)
    M = zeros(Int, n + 1, m + 1)
    for i in 1:n
        M[i+1, 1] = M[i, 1] + d
    end
    for j in 1:m
        M[1, j+1] = M[1, j] + d
    end
    for i in 1:n
        for j in 1:m
            c1 = findfirst(A[i], bases)
            c2 = findfirst(B[j], bases)
            M[i+1, j+1] = max(
                M[i, j] + S_matrix[c1][c2],
                M[i, j+1] + d,
                M[i+1, j] + d)
        end
    end
    return M, traceback(M, A, B)
end

"""
Traceback function for Needleman-Wunsch algorithm.
"""
function traceback(M, A::String, B::String)
    n = length(A)
    m = length(B)
    i = n
    j = m
    align_A = ""
    align_B = ""
    while i > 0 && j > 0
        c1 = findfirst(A[i], bases)
        c2 = findfirst(B[j], bases)
        if M[i+1, j+1] == M[i, j] + S_matrix[c1][c2]
            align_A = A[i] * align_A
            align_B = B[j] * align_B
            i -= 1
            j -= 1
        elseif M[i+1, j+1] == M[i, j+1] + d
            align_A = A[i] * align_A
            align_B = "-" * align_B
            i -= 1
        else
            align_A = "-" * align_A
            align_B = B[j] * align_B
            j -= 1
        end
    end
    while i > 0
        align_A = A[i] * align_A
        align_B = "-" * align_B
        i -= 1
    end
    while j > 0
        align_A = "-" * align_A
        align_B = B[j] * align_B
        j -= 1
    end
    return align_A, align_B
end

needleman_wunsch(A, B)
