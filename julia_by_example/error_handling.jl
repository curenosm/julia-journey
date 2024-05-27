# try, catch can be used to deal with errors as with many other languages
try
  push!(a, 1)
catch err
  showerror(stdout, err, backtrace())
  println()
end

#= 
UndefVarError: `a` not defined
Stacktrace:
 [1] top-level scope
   @ C:\Users\Misael\Desktop\github\journeys\julia-journey\julia_by_example\error_handling.jl:5
 [2] include(mod::Module, _path::String)
   @ Base .\Base.jl:495
 [3] exec_options(opts::Base.JLOptions)
   @ Base .\client.jl:318
 [4] _start()
   @ Base .\client.jl:552
=#
println("Continuing after error")
#> Continuing after error
