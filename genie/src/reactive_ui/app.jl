module App
# Setup the Genie Framework environment

using GenieFramework, Genie.Renderer.Html
@genietools

# Reactive code

@app begin
  @in N = 0
  @out msg = ""
  @onchange N begin
    msg = "N = $N"
  end
end

# UI Components
function ui()
  [
    cell(
      [
        cell([
          p("Enter a number")
          textfield("N", :N)
        ])
        cell([bignumber("The value of N is", :N)])
      ],
    ),
  ]
end

# Definition of root route
@page("/", ui)
end
