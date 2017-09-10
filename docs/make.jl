using Documenter
using ForestBiometrics

makedocs(module =[ForestBiometrics],
        doctest=false)

deploydocs(deps = nothing,
   repo = "github.com/Crghilardi/ForestBiometrics.jl.git"
   )
