using Documenter
using ForestBiometrics

makedocs(
        modules =[ForestBiometrics],
        sitename= "ForestBiometrics.jl",
        format = :html,
        doctest=false,
        clean=true,
        pages = Any["Home" => "index.md"]
        )

 deploydocs(#deps = Deps.pip(
            #"pygments",
            #"mkdocs",
            #"mkdocs-material",
            #"python-markdown-math"),
            deps = nothing,
            branch = "gh-pages",
            latest = "master",
            julia="0.6",
            repo = "github.com/Crghilardi/ForestBiometrics.jl.git",
            target = "build"
   )
