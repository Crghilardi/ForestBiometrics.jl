using ForestBiometrics
using Base.Test
#no idea if i should use this?

@testset "HeightDub" begin include("HeightDub_test.jl") end
@testset "LimitingDistance" begin include("LimitingDistance_test.jl") end
@testset "VolumeEquations" begin include("VolumeEquations_test.jl")
