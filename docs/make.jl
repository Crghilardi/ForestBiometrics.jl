using Documenter
using ForestBiometrics

makedocs(
        modules =[ForestBiometrics],
        doctest=false)

deploydocs(deps = Deps.pip(
            "pygments",
            "mkdocs",
            "mkdocs-material",
            "python-markdown-math"),
   repo = "github.com/Crghilardi/ForestBiometrics.jl.git"
   )
