Meta.parse("foo")
typeof(:foo)

:foo == Symbol("foo") == Symbol('f', "oo")


# Creando uno nuevo

gensym(), gensym()

gensym("foo"), gensym("foo")


foo = 0
eval(:foo)

