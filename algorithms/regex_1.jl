s = "June 24, 2021, 12:00:00"
m = match(r"(?<month>\w+)\s+(?<day>\d+), \s+(?<year>\d+),", s)

m[:month], m[:day], m[:year]
m["month"], m["day"], m["year"]


# Nested named groups

m = match(r"(?<number>(?<area>\d+)_(\d+)_(\d+))", s)
m[:number], m[:area], m[1], m[2], m[3]

match(r"artificial intelligence: (?<name>[[:alnum:]]+)", s)["name"]


# Named and numbered groups
s = "...release date: 7 May 1983\n"
r = r"(?<month>\w+)\s+(?<day>\d+),\s+(?<year>\d+)"
replace(s, r => s"\2 \1 \3 (\0)")

replace("2,718281828", r"(\d+),(\d+)" => s"\1.\2")
parse(Float64, ans)
typeof(ans)

eachmatch(r"\d+", "123 456 789") do m
  println(m.match)
end
