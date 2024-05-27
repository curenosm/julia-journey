using Test

foo = x -> length(x)^2

@testset "Foo Tests" begin
    @testset "Animals" begin
        @testset "Felines" begin
            @test foo("cat") == 9
        end
        @testset "Canines" begin
            @test foo("dog") == 9
        end
    end
    @testset "Arrays" begin
        @test foo(zeros(2)) == 4
        @test foo(fill(1.0, 4)) == 16
    end
end

@testset "trigonometric identities" begin
    θ = 2 / 3 * π
    @test sin(-θ) ≈ -sin(θ)
    @test cos(-θ) ≈ cos(θ)
    @test sin(2θ) ≈ 2 * sin(θ) * cos(θ)
    @test cos(2θ) ≈ cos(θ)^2 - sin(θ)^2
end;