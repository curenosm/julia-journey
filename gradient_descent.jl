import Pkg

Pkg.add(Zygote)
Pkg.add(Distributions)

using Zygote
using Distributions

# Gradient descent in Julia

# We need a lm function
lm(x, m, b) = m .* x .+ b

# And some data!
x = rand(Uniform(-2, 2), 100)
epsilon = rand(Normal(0.0, 0.05), length(x))
p_0 = [-1.2, 0.05]

# And a y, too
y = lm(x + epsilon, p_0...)

# Loss ? L2!
L2(y, x, f, p...) = sum(
    (y .- f.(x, p...)).^2.0
)/length(x)

p = rand(length(p_0))

grad_l(y, x, f, p...) = gradient(
    (p...) -> L2(y, x, f, p...),
    p...
)

# Learning rate
eta = 0.01

for epoch in 1:50_000
    p .= eta .* grad_l(y, x, lm, p...)
end


round(p[1]; digits=5)
round(p[2]; digits=5)
