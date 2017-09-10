using Documenter, ForestBiometrics

makedocs(module =[ForestBiometrics],
        doctest=false)

deploydocs(
   repo = "github.com/Crghilardi/ForestBiometrics.jl.git",
   deps = nothing)
