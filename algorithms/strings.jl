# Strings are immutable, once created they cannot change

"hello"

"""hello"""

println("123\b\b\b456456\r789")

"""
This is an "interesting" example.
"""


s = "Hello, world!"

s[1], s[2], s[floor(Int, end / 2)], s[end-1], s[end]


s[8:12]

s[1:2:length(s)]

typeof(s[1]), typeof(s[1:1])

# Not all characters are encoded by the same number of bytes
a = "\u2200x\u2208\u211d"


# Solo el segundo caracter unicode ocupa 1 byte

# Intentar acceder a a[2] o a[3] da error,
# podemos solucionarlo haciendo

a[2], a[3]

nextind(a, 1)

nextind(a, 4)

nextind(a, 5)


# La forma más conveniente de iterar sobre un string es usando for
for char in a
    println(char)
end

"Command-line arguments are: $ARGS"

"exp(im*pi) = $(exp(im*pi))"

in('\u2200', a)

'\u2200' in a

occursin("world", s)


findfirst('x', a)

findfirst('x', s)
ans === nothing


