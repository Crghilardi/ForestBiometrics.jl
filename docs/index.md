# Functionality

This package was inspired by its R counterpart, the [lmfor package](https://CRAN.R-project.org/package=lmfor) with the addition of equations from the western US. For more info on lmfor, please see http://cs.uef.fi/~lamehtat/rcodes.htm

## Calculating missing tree heights using a height diameter equation
Height-diameter equations are widespread in forestry and have been the subject of extensive research over the past decades.
As a result there is a large amount of formulas and parameter sets based on regional, operational and biological differences.

In forest inventories, measuring heights on all trees may not be possible so formulas are used to fill in missing data.

# `@HeightDub(model,coefficients,dataframe,species,diameter)`

where `model` is an equation form stored as an anonymous function

    Wyckoff=(x,b)->4.5+exp(b[1]+(b[2]/(x+1))

    @HeightDub(Wyckoff,...)

`coefficients` is a dictionary of species specific equation parameters in the form of

    String: Array{Float64}

    Dict{String,Array{Float64}}(
    "WP"=> [5.19988	-9.26718],
    "WL"=>[4.97407	-6.78347],
    "DF"=>[4.81519	-7.29306] )

If a user wanted to change model parameters, they can redefine them as needed independent of model form

`dataframe` is a DataFrame where the species and diameter for each tree record are stored

`species` is the name of the column containing the species information in the DataFrame expressed as a symbol e.g. `:Species`

and `diameter` is the name of the column in the DataFrame  containing the tree record diameter expressed as a symbol e.g. `:DBH`

ForestBiometrics.jl uses Julia's [metaprogramming abilities](https://docs.julialang.org/en/release-0.6/manual/metaprogramming/) to build the function at runtime allowing a user to change both model form and parameters.

There is also a helper function `UserHD()` that a user can use to define their own equation as a string.
    UserDefHD("4.5+x^2^b[1]")
