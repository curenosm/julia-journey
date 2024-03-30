# Alineamiento Local

# O(nm^2) time complexity
# O(nm) space complexity

A = "AACCCG"
B = "AAGGCT"

w_1 = 1 # Costo de un solo espacio
s(a, b) = a == b ? 1 : -1
W(k) = k * w_1

"""
Función de alineamiento local Smith-Waterman.
"""
function smith_waterman(A::String, B::String)
    m = length(A)
    n = length(B)
    H = zeros(Int64, m + 1, n + 1)

    for i in 1:m
        H[i+1, 1] = 0
    end

    for j in 1:n
        H[1, j+1] = 0
    end

    for i in 2:m
        for j in 2:n
            H[i, j] = max(
                H[i-1, j-1] + s(A[i], B[j]),
                max([H[i-k+1, j] - W(k) for k in 1:i]...),
                max([H[i, j-l+1] - W(l) for l in 1:j]...),
                0)
        end
    end

    return H, traceback(H, A, B)
end

"""
Viajamos desde la celda con el valor más alto en la matriz H 
hasta llegar a la celda con valor 0.

Si el valor de la celda actual es 0, terminamos el algoritmo.
"""
function traceback(H, A::String, B::String)
    m = length(A)
    n = length(B)
    i = m
    j = n

    align_A = ""
    align_B = ""

    while H[i, j] != 0
        if H[i, j] == H[i-1, j-1] + s(A[i], B[j])
            align_A = A[i] * align_A
            align_B = B[j] * align_B
            i -= 1
            j -= 1
        elseif H[i, j] == H[i, j-1] - W(1)
            align_A = "-" * align_A
            align_B = B[j] * align_B
            j -= 1
        else
            align_A = A[i] * align_A
            align_B = "-" * align_B
            i -= 1
        end
    end

    return align_A, align_B
end

H, (align_A, align_B) = smith_waterman("ACGT", "ACGT")

H
