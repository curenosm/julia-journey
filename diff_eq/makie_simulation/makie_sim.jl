using WaterLily
using StaticArrays

norm(x::StaticArray) = √(sum(x' * x))

function make_sim(; n=2^6, U=1, Re=1000, mem=Array)
    # Definimos el cuerpo
    R = n / 2
    function sdf(xyz, t) # signed distance function
        norm(xyz) - R # Esfera
    end

    map(xyz, t) = xyz - SA[2n/3, 0, 0] # Coloca / mueve el centro

    # Devolvemos la simulación

    return Simulation((2n, n, n), (U, 0, 0), R;
        ν=U * R / Re, body=AutoBody(sdf, map), mem)
end


# Simulación en MacOS
using Metal

sim = make_sim();
@assert Metal.functional()

sim = make_sim(mem=Metal.MtlArray)
sim_step!(sim, 0.2)


# Simulación en MacOS
using CUDA

sim = make_sim();
@assert CUDA.functional()

sim = make_sim(mem=CUDA.CuArray)
sim_step!(sim, 0.2)
