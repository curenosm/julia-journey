s = "July 23, 1998"
m = match(r"(?<month>\w+)\s+(?<day>\d+),\s+(?<year>\d+)", s)

m["day"], m["month"], m["year"]
m[:day], m[:month], m[:year]


# Anidando grupos de expresiones regulares
s = "123_456_789"
m = match(r"(?<number>(?<area>\d+)_(\d+)_(\d+))", s)

m[:number], m[:area], m[1], m[2], m[3]

# Usando named classes
s = "artificial intelligence: julia"
match(r"artificial intelligence: (?<name>[[:alnum:]]+)", s)["name"]


