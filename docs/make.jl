using Documenter
using ForestBiometrics

makedocs(
        modules =[ForestBiometrics],
        doctest=false)

deploydocs(deps = nothing,
   repo = "github.com/Crghilardi/ForestBiometrics.jl.git"
   )
