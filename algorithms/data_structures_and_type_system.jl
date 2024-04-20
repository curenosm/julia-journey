function increase(x::Number)
    return x + 1
end

typemax(Int64)
typemin(Float64)

typeof(Base.MathConstants.e)
typeof(Base.MathConstants.pi)

supertypes(typeof(Base.MathConstants.e))

struct Foo1
    a
    b
end

foo1 = Foo1(1, 2.0)

for name in fieldnames(Foo1)
    @show name, getfield(foo1, name)
end

mutable struct Foo2
    a::Int
    b::Float64
end

foo = Foo2(1, 2.0)

foo.a
foo.b
getfield(foo, :a)
getfield(foo, :b)
methods(Foo2)

# Types are associated to values and 
# not to variables, since Julia is dynamic


struct Interval
    left_open::Bool
    left::Number
    right_open::Bool
    right::Number
end

Interval(false, 0, true, 1)

let io = IOBuffer()
    Base.show(io, Interval(false, 0, true, 1))
    dump(Meta.parse(String(take!(io))))
end

(typeof(Int), typeof(Any))

# Problems

# 5.1 (Numerical tower) Use the seen functions to obtain
# the numerical tower, i.e. the whole hierarchy below the
# type Number. Draw the numerical tower (by hand). How
# does the numerical tower correspond to the sets

# N ⊆ Z ⊆ Q ⊆ R ⊆ C


# 5.2 (Visualize type graph) Write function that obtains 
# the full type graph. The write a function that writes
# an input file for graph visualization software such
# as Graphviz to plot the type graph.


#=
5.3 (Type hierarchy for intervals) Define a type hierarchy
for intervals below an abstract type called GeneralInterval.
The types in the type hierarchy should provide for intervals 
with finite and infinite number of elements. Define intervals
for Unicode characters, for integers, for rational numbers,
and for floating point numbers.
=#

#=
5.4 (Interval arithmetic) Define generic function for the
addition, substraction, multiplication, and division of numeric
intervals. The functions should take numeric intervals of the
same type (and a Boolean value to indicate wheter a division by
zero occurred in the case of division).
=#


#=
5.5 (Bisection) Bisection is a straighforward algorithm for calculating
a root of a continuos function on a given real-valued interval. Starting
with an interval on whose endpoints the function to bisect has opposite
signs, the interval is split at its midpoint. Depending on the sign of 
the function at the midpoint, bisection continues recursively.

1. Implement bisection based on the data type for floating-point
intervals in Problem 5.3.

2. Find a suitable stopping criterion that works with floating
point numbers.

3. As an example, apply your bisection implementation to finding the
root of sin in the interval [3, 4].
=#





