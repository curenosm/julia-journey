#=

Expresiones Compuestas

begin blocks do not introduce a new scope

=#

c = begin
    global a = 3
    global b = 2
    a^a // b^2
end

c = begin
    global a = 3
    global b = 2
    a^a // b^b
end

c = begin
    global a = 3
    global b = 2
    a^a // b^b
end

c = (global a = 3; global b = 2; a^a // b^b)

nothing isa Nothing
nothing === Nothing()
begin end
ans === nothing
typeof(begin end)


# Conditional Evaluation

function my_sign(x)
    if x < 0
        typeof(x)(-1)
    elseif x == 0
        typeof(x)(0)
    else
        typeof(x)(1)
    end
end

typeof(my_sign(Int8(2)))

# If blocks do not introduce new scopes

foo = if 1 > 0
    "yes"
else
    "no"
end

foo = 1 > 0 ? "yes" : "no"

function compare(a, b)
    string(a) * " is " *
    (a < b ? "less than " : "greater than or equal to ") *
    string(b)
end

compare(0, 1)


# Operador ternario se asocia de derecha a izquierda

function compare(a, b)
    string(a) * " is " *
    (a < b ? "less than " :
     a == b ? "equal to " : "greater than ") *
    string(b)
end

compare(0, -1), compare(0, 0), compare(0, 1)

# Evaluación de corto circuito


