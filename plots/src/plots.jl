using Plots
using PlotThemes

theme(:juno::Symbol;)

f(x) = 10 * sin(x)

g(x) = x^2

plot([f, g], 0, 2pi, title="f and g", xlabel="x", ylabel="y", linewidth=4)

# scatter([f, g], 0, 2pi, title="f and g", xlabel="x", ylabel="y", linewidth=4)
scatter([f, g], 0, 2pi, title="f and g", xlabel="x", ylabel="y", linewidth=4)

x = collect(-20:0.2:20);

y1 = x .^ 2
t2 = cos.(x);

plot(x, y1, label="cos(x)", lw=2)
plot(x, y1, label="x^2", lw=2)

title!("Line Plot")
xlabel!("x")
ylabel!("y")
histogram(y1, label="cos(x)", alpha=0.3)
histogram(y1, label="x^2", alpha=0.1)

# 3D Plots

x = -3:0.01:3
y = -3:0.01:3
typeof(x)
f(x, y) = exp(-(x^2 + y^2))

color_gradient = cgrad([:violet, :red])
surface(x, y, f, c=color_gradient)
xlabel!("x")
ylabel!("y")
title!("3D Surface Plot")

# ------------

t = 0:pi/20:20*pi

x = cos.(t)
y = sin.(t)

plot3d(x, y, t, lw=2, color="green", legend=false)
