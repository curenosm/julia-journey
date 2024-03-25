Ω = zeros(2, 2)

λ_1, λ_2 = 2, 1
Ω[1, 1] = λ_1
Ω[2, 2] = λ_2

c_1, c_2 = 1, 1
Ψ_ket = [c_1, c_2]

# Mean of Ω on Ψ_ket
μ = Ψ_ket' * Ω * Ψ_ket

Ω_Ψ_braket = zeros(2, 2)
Ω_Ψ_braket[1, 1] = μ
Ω_Ψ_braket[2, 2] = μ

# Definimos la función para obtener la diferencia
Δ_Ψ(Ω, Ψ_ket) = Ω - Ω_Ψ_braket

# Multiplicamos la matriz por sí misma
sqr_res = Δ_Ψ(Ω, Ψ_ket) * Δ_Ψ(Ω, Ψ_ket)

# Ahora para obtener la varianza, multiplicamos
# el resultado anterior por el ket
var = Ψ_ket' * sqr_res * Ψ_ket

print("Varianza: ", var)
