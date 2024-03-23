using AbstractAlgebra

R, x = QQ["x"]

S, t = power_series_ring(R, 30, "t")

u = t + O(t^100)

@time divexact((u * exp(x * u)), (exp(u) - 1))
