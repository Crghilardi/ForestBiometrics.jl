# Functionality

This package was inspired by its R counterpart, the [lmfor package](https://CRAN.R-project.org/package=lmfor) with the addition of equations from the western US. For more info on lmfor, please see http://cs.uef.fi/~lamehtat/rcodes.htm

## Calculating missing tree heights using a height diameter equation
Height-diameter equations are widespread in forestry and have been the subject of extensive research over the past decades.
As a result there is a large amount of formulas and parameter sets based on regional, operational and biological differences.

In forest inventories, measuring heights on all trees may not be possible so formulas are used to fill in missing data.

# Types

ForestBiometrics creates a type `HeightDiameter` that holds an equation form and its parameters.

    struct HeightDiameter <: Function
    formula::Function
    b
    end

`formula` can be one of the pre-named equation forms such as Wyckoff, Korf, etc.

    Wyckoff=(x,b)->4.5+exp(b[1]+(b[2]/(x+1)) #defined in HeightDub.jl

`b` is a dictionary of species specific equation parameters in the form of

    String: Array{Float64} #species specific coefficients stored as dictionary

    coeffs =Dict{String,Array{Float64}}(
    "WP"=> [5.19988	-9.26718],
    "WL"=>[4.97407	-6.78347],
    "DF"=>[4.81519	-7.29306] )

    HD = HeightDiameter(Wyckoff,coeffs)

If a user wanted to change model parameters, they can redefine them as needed independent of model form or change both equation form and associated parameters.

Pre-defined equation forms available include:
`#latex equations to be added`
`#2 parameter equation forms, mainly from LMFOR package`
Curtis,
Michailoff,
Meyer,
Micment,
Micment2,
Naslund,
Naslund2,
Naslund3,
Naslund4,
Power,
Wyckoff

`3 parameter equations, mainly from LMFOR R package`
Chapman,
Gompertz,
HossfeldIV,
Korf,
Logistic,
Monserud,
Prodan,
Ratkowsky,
Sibbesen,
Weibull

#functions

`calculate_height(params::HeightDiameter,dbh,species)`

This takes a HeightDiameter type and applies the function given a species and dbh.

## Calculating the volume of an individual tree

ForestBiometrics has functions to calculate log volumes using a variety of scaling rules

      doyle_volume(small end diameter, log length)

calculates the doyle volume

      scribner_volume(small end diameter, log length)

calculates the scribner volume

      international_volume(small end diameter, log length)

calculates the volume using international rule

## Calculating limiting distance for a variable radius plot

While this may not be useful in a programming context, it is a relatively simple function and may be useful for demonstration purposes.

    limiting_distance(baf, dbh, horizontal distance)


## Calculating equilibrium moisture content

Equilibrium moisture content is the content where a piece of wood neither gains or loses moisture. The equation is from
**The National Fire Danger Rating System: Basic Equations;
Jack D Cohen, John E. Deeming. GTR PSW-82**

    emc(relative_humidity::Float64,temp::Float64)


## Calculating Reineke's Stand Density Index (SDI)

    sdi(tpa,qmd)

will return the Stand Density Index calculated as

\\\( sdi = tpa * (\frac{qmd}{10})^{1.605} \\\)
