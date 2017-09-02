# Getting Started

## Calculating missing tree heights using a height diameter equation
Height-diameter equations are widespread in forestry and have been the subject of extensive research over the past decades.
As a result there is a large amount of formulas and parameter sets based on regional, operational and biological differences. 

In forest inventories, measuring heights on all trees may not be possible so formulas are used to fill in missing data.

# `@HeightDub`

ForestBiometrics.jl uses Julia's [metaprogramming abilities](https://docs.julialang.org/en/release-0.6/manual/metaprogramming/) to build the function at runtime allowing a user to change both model form and parameters. 

As it is built now, species specific coefficients are stored in a dictionary in the key value form of:

`String: Array{Float64}`

e.g.


    Dict{String,Array{Float64}}(
    "WP"=> [5.19988	-9.26718],
    "WL"=>[4.97407	-6.78347],
    "DF"=>[4.81519	-7.29306] )

If a user wanted to change model parameters, they can redefine them as needed. 

