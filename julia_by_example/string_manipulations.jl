s1 = "The quick brown fox jumps over the lazy dog 🦊 🐶"

# search returns the first index of a char
i = findfirst(isequal('b'), s1)
println(i)
#> 11
# the second argument is equivalent to the second argument of split, see below

# or range if called with another string
r = findfirst("brown", s1)
println(r)
#> 11:15

# string replace is done thus:
r = replace(s1, "brown" => "red")
show(r);
println();
#> "The quick red fox jumps over the lazy dog 🦊 🐶"

# search and replace can also take a regular expressions by preceding the
# string with 'r'
r = findfirst(r"b[\w]*n", s1)
println(r)
#> 11:15

# again with a regular expressions
r = replace(s1, r"b[\w]*n" => "red")
show(r);
println();
#> "The quick red fox jumps over the lazy dog 🦊 🐶"

# there are also functions for regular expressions that return RegexMatch types
# match scans left to right for the first match (specified starting index
# optional)
r = match(r"b[\w]*n", s1)
println(r)
#> RegexMatch("brown")

# RegexMatch types have a property match that holds the matched string
show(r.match);
println();
#> "brown"

# eachmatch returns an iterator over all the matches
r = eachmatch(r"[\w]{4,}", s1)
for i in r
    print("\"$(i.match)\" ")
end
#> "quick" "brown" "jumps" "over" "lazy"
println()

r = collect(m.match for m = eachmatch(r"[\w]{4,}", s1))
println(r)
#> Substring{String}["quick", "brown", "jumps", "over", "lazy"]

# a string can be repeated using the repeat function,
# or a more succintly with the `^` syntax:
r = "hello "^3
show(r);
println();

# the strip function works the same as python:
r = strip("  hello  ")
show(r);
println(); #> "hello"

# or with a second argument of an array of chars it strips any of them;
r = strip("  hello  ", ['h', ' '])
show(r);
println(); #> "ello"
# (note the array is of chars and not strings)

# similarly split works in basically the same way as python:
r = split("hello, there,bob", ',')
show(r);
println(); #> Substring{String}["hello", " there", "bob"]

r = split("hello, there,bob", ", ")
show(r);
println(); #> Substring{String}["hello", "therebob"]

r = split("hello, there,bob", [',', ' '])
show(r);
println(); #> Substring{String}["hello", "", "there", "bob"]

# (the last two arguments are limit and include_empty, see docs)

# the opposite of split: join is simply
r = join(collect(1:10), ", ")
println(r) #> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
