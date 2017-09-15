using Documenter
using ForestBiometrics

makedocs(
        modules =[ForestBiometrics],
        sitename= "ForestBiometrics.jl",
        format = :html,
        doctest=false,
        pages = Any["Home" => "index.md"])

 deploydocs(deps = nothing
            target = "site",
            branch = "gh-pages",
            latest = "master",
            julia="0.6",
            repo = "github.com/Crghilardi/ForestBiometrics.jl.git",
            target = "build"
   )
