using Plots
using ForwardDiff


function Babylonian(x, N = 10)
  t = (1 + x) / 2
  for _ = 2:N
    t = (t + x / t) / 2
  end
  t
end

struct D <: Number
  f::Tuple{Float64,Float64}
end


import Base: +, /, convert, promote_rule
+(x::D, y::D) = D(x.f .+ y.f)
/(x::D, y::D) = D((x.f[1] / y.f[1], (y.f[1] * x.f[2] - x.f[1] * y.f[2]) / y.f[1]^2))
convert(::Type{D}, x::Real) = D((x, zero(x)))
promote_rule(::Type{D}, ::Type{<:Number}) = D


x = 49;
Babylonian(D((x, 1))), (sqrt(x), 0.5 / sqrt(x));

x = 100;
Babylonian(D((x, 1))), (sqrt(x), 0.5 / sqrt(x));


A = randn(3, 3)
x = randn(3)
ForwardDiff.gradient(x -> x'A * x, x)
(A + A') * x

n = 4
Strang = SymTridiagonal(2)
