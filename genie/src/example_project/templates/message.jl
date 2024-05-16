h1("Welcome to Genie $name !")

p("1+1 is: $(1+1)")

form("/hello", method="post") do
  input(name="name", placeholder="Your name")
  button("Submit")
end

