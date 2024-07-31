using WebAssembly: i32, f64, irfunc
using IRTools.All

pow = let
  ir = IR()
  x = argument!(ir, f64)
  n = argument!(ir, i32)
  cond = block!(ir)
  body = block!(ir)
  ret = block!(ir)
  n = argument!(cond, n, i32)
  r = argument!(cond, 1.0, f64)
  branch!(cond, ret, unless = push!(cond, stmt(xcall(i32.gt_s, n, Int32(0)), type = i32)))
  n = push!(body, stmt(xcall(i32.sub, n, Int32(1)), type = i32))
  r′ = push!(body, stmt(xcall(f64.mul, r, x), type = f64))
  branch!(body, cond, n, r′)
  return!(ret, r)
  ir
end
