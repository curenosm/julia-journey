using CUDA

CUDA.versioninfo()

a = CuArray([1])

CUDA.allowscalar(false)

a .+= 1

a

CUDA.allowscalar() do 
    a[1] += 1
end

CUDA.@allowscalar a[1] += 1
