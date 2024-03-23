ex = :(2a + b + 1)

dump(ex)

Meta.show_sexpr(ex)

ex.args[3]

ex.args[3] = :(3b)

ex

