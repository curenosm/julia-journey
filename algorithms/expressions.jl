Meta.parse("0 + 1")

typeof(ans)

Meta.parse("foo + bar")

typeof(ans)

:(0 + 1)

:(foo + bar)

dump(:(0 + 1))

expr = Meta.parse("foo + 2*bar")
expr.head
expr.args

Expr(expr.head, expr.args...)
Expr(expr.head, expr.args...) == :(foo + 2 * bar)

foo = 1;
bar = 2;

eval(expr)
