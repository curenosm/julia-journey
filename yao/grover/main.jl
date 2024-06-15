using Yao
using Yao.EasyBuild: variational_circuit
using LinearAlgebra

# Grover Step
function grover_step!(reg::AbstractRegister, oracle, U::AbstractBlock)
    apply!(reg |> oracle, reflect_circuit(U))
end

function reflect_circuit(gen::AbstractBlock)
    N = nqudits(gen)
    reflect0 = control(N, -collect(1:N-1), N => -Z)
    chain(gen', reflect0, gen)
end

function solution_state(oracle, gen::AbstractBlock{D}) where {D}
    reg = zero_state(nqudits(gen)) |> gen
    ratio = abs2(solution_state(oracle, gen)' * reg)
    Int(round(pi / 4 / sqrt(ratio))) - 1
end


# Run
num_bit = 12
oracle = matblock(
    Diagonal((
        v = ones(ComplexF64, 1 << num_bit);
        v[Int(bit"000001100100")+1] *= -1;
        v
    )))

gen = repeat(num_bit, H, 1:num_bit)
reg = zero_state(num_bit) |> gen

target_state = solution_state(oracle, gen)

