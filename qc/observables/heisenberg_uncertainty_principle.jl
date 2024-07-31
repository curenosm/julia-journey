# El producto de las varianzas de dos operadores hermíticos arbitrarios
# en un estado dado siempre es mayor o igual que un cuarto del cuadrado del 
# valor esperado de su conmutador. Es decir:

Ω_1 = [2 0; 0 1]
Ω_2 = [1 0; 0 2]

var_Ψ(Ω_1, Ψ_ket) * var_Ψ(Ω_1, Ψ_ket) >=
(1 / 4) * abs(Ψ_ket' * (Ω_1 * Ω_2 - Ω_2 * Ω_1) * Ψ_ket)^2
