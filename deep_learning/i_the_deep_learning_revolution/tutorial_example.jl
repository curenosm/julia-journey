# Modelos lineales
y(x, w) = sum(w[i] * (x^(i - 1)) for i in eachindex(w))
y(5, [1, 2, 3])

# Función de error
E(w, X, t) = (1 / 2) * sum((y(X[n], w) - t[n])^2 for n = eachindex(w))

# El 1/2 resulta conveniente para posteriores cálculos

# Root Mean Square (RMS)
E_rms(w, X, t, M) = sqrt((1 / length(X)) * sum((y(X[n], w) - t[n])^2 for n in eachindex(w)))

# La division entre N nos permite comparar conjuntos de datos de diferente
# tamaño.
