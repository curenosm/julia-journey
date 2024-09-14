using Markdown
using MathLink

md"""
# Examples
"""

md"""
## Usage
"""

W"Sin"
sin1 = W"Sin"(1.0)
@show sin1

sinx = W"Sin"(W"x")
@show sinx

md"""
## The Algebraic Operators
"""

res = W"a" + W"b"
@show res

res₂ = W"a" + W"a"
@show res₂

res₃ = W"a" - W"a"
@show res₃
