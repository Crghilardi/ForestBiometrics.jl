var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#Functionality-1",
    "page": "Home",
    "title": "Functionality",
    "category": "section",
    "text": "This package was inspired by its R counterpart, the lmfor package with the addition of equations from the western US. For more info on lmfor, please see http://cs.uef.fi/~lamehtat/rcodes.htm"
},

{
    "location": "index.html#Constants-1",
    "page": "Home",
    "title": "Constants",
    "category": "section",
    "text": "This package exports a const K = 0.005454154to convert between diameter squared in square inches to square feet and const KMETRIC = 0.00007854 to convert diameter squared in centimeters to square meters when using metric."
},

{
    "location": "index.html#Calculating-missing-tree-heights-using-a-height-diameter-equation-1",
    "page": "Home",
    "title": "Calculating missing tree heights using a height diameter equation",
    "category": "section",
    "text": "Height-diameter equations are widespread in forestry and have been the subject of extensive research over the past decades. As a result there is a large amount of formulas and parameter sets based on regional, operational and biological differences.In forest inventories, measuring heights on all trees may not be possible so formulas are used to fill in missing data."
},

{
    "location": "index.html#Types-1",
    "page": "Home",
    "title": "Types",
    "category": "section",
    "text": "ForestBiometrics creates a type HeightDiameter that holds an equation form and its parameters for estimating a tree height given a diameter at a fixed height(usually 4.5 feet).struct HeightDiameter <: Function\nformula::Function\nb\nendformula can be one of the pre-named equation forms such as Wyckoff, Korf, etc.Wyckoff=(x,b)->4.5+exp(b[1]+(b[2]/(x+1)) #defined in HeightDub.jlb is a dictionary of species specific equation parameters in the form ofString: Array{Float64} #species specific coefficients stored as dictionary\n\ncoeffs =Dict{String,Array{Float64}}(\n\"WP\"=> [5.19988	-9.26718],\n\"WL\"=>[4.97407	-6.78347],\n\"DF\"=>[4.81519	-7.29306] )\n\nHD = HeightDiameter(Wyckoff,coeffs)If a user wanted to change model parameters, they can redefine them as needed independent of model form or change both equation form and associated parameters.Pre-defined equation forms available include:"
},

{
    "location": "index.html#parameter-equation-forms,-mainly-from-LMFOR-package:-1",
    "page": "Home",
    "title": "2 parameter equation forms, mainly from LMFOR package:",
    "category": "section",
    "text": "Curtis: ht(diameter) = dbh + b1(fracdbh1+dbh)^b2Michailoff: ht(diameter) = dbh + b1e^b2dbh^-1Meyer: ht(diameter) = dbh + b1(1-e^-b2dbh)Micment: ht(diameter) = dbh + fracb1dbhb2+dbhMicment2: ht(diameter) = dbh +fracdbhb1+b2*dbhNaslund: ht(diameter) = dbh + fracdbh^2(b1+b2dbh)^2Naslund2: ht(diameter) = dbh + fracdbh^2(b1+e^b2dbh)^2Naslund3: ht(diameter) = dbh + fracdbh^2e^b1+b2dbh^2Naslund4: ht(diameter) = dbh + fracdbh^2(e^b1+e^b2dbh)^2Power: ht(diameter) = dbh + b1dbh^b2Wyckoff: ht(diameter) = dbh + exp(b1+fracb2dbh+1)"
},

{
    "location": "index.html#parameter-equations,-mainly-from-LMFOR-R-package:-1",
    "page": "Home",
    "title": "3 parameter equations, mainly from LMFOR R package:",
    "category": "section",
    "text": "Chapman: ht(diameter) = dbh + b1(1-e^-b2dbh)^b3Gompertz: ht(diameter) = dbh + b1exp(-b2exp(-b3dbh))HossfeldIV: ht(diameter) = dbh + fracb11+frac1b2dbh^b3Korf: ht(diameter) = dbh + b1exp(-b2dbh^-b3)Logistic: ht(diameter) = dbh + fracb11+b2e^-b3dbhMonserud: ht(diameter) = dbh + exp(b1 + b2dbh^b3)Prodan: ht(diameter) = dbh + fracdbh^2b1+b2dbh+b3dbh^2Ratkowsky: ht(diameter) = dbh + b1exp(frac-b2dbh+b3)Sibbesen: ht(diameter) = dbh + b1dbh^b2dbh^-b3Weibull: ht(diameter) = dbh + b1(1-e^-b2dbh^b3)"
},

{
    "location": "index.html#Functions-1",
    "page": "Home",
    "title": "Functions",
    "category": "section",
    "text": "calculate_height(params::HeightDiameter,dbh,species)This takes a HeightDiameter type and applies the function given a species and dbh."
},

{
    "location": "index.html#Calculating-the-volume-of-an-individual-tree-1",
    "page": "Home",
    "title": "Calculating the volume of an individual tree",
    "category": "section",
    "text": "This functionality is under active development and may changeForestBiometrics has functions to calculate log volumes using a variety of scaling rules  doyle_volume(small end diameter, log length)calculates the doyle volume  scribner_volume(small end diameter, log length)calculates the scribner volume  international_volume(small end diameter, log length)calculates the volume using international ruleIn addition, we introduce two abstract types, VolumeEquation, and MerchSpecs.MerchSpecs is a super type to allow for merchandizing specifications to be stored and referenced by product and some common ones have been predefined.  type Sawtimber<:MerchSpecs\n  std_length\n  trim\n  min_length\n  max_length\n  min_dib\n  end\n  Sawtimber(16.0,0.5,8.0,20.0,6.0)"
},

{
    "location": "index.html#Calculating-limiting-distance-for-a-variable-radius-plot-1",
    "page": "Home",
    "title": "Calculating limiting distance for a variable radius plot",
    "category": "section",
    "text": "While this may not be useful in a programming context, it is a relatively simple function and may be useful for demonstration purposes.limiting_distance(baf, dbh, horizontal distance)"
},

{
    "location": "index.html#Calculating-equilibrium-moisture-content-1",
    "page": "Home",
    "title": "Calculating equilibrium moisture content",
    "category": "section",
    "text": "Equilibrium moisture content is the content where a piece of wood neither gains or loses moisture. The equation is from The National Fire Danger Rating System: Basic Equations; Jack D Cohen, John E. Deeming. GTR PSW-82emc(relative_humidity::Float64,temp::Float64)"
},

{
    "location": "index.html#Calculating-Reineke's-Stand-Density-Index-(SDI)-1",
    "page": "Home",
    "title": "Calculating Reineke's Stand Density Index (SDI)",
    "category": "section",
    "text": "sdi(tpa,qmd)will return the Stand Density Index calculated as:sdi = tpa * (fracqmd10)^1605"
},

]}
