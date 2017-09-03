using ForestBiometrics
using Base.Test
#no idea if i should use this?

#macro not wokring right, fix and revisit
#@testset "HeightDub" begin include("HeightDub_test.jl") end

@testset "LimitingDistance" begin include("LimitingDistance_test.jl") end
@testset "VolumeEquations" begin include("VolumeEquations_test.jl") end
@testset "EquilibriumMoistureContent" begin include("EquilibriumMoistureContent_test.jl") end
@testset "ForestStocking" begin include("ForestStocking_test.jl") end
