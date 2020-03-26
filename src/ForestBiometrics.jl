module ForestBiometrics

const K = 0.005454154
const KMETRIC = 0.00007854

struct Metric end
const metric = Metric()

include("tree.jl")
include("stand.jl")
include("density.jl")
include("charts.jl")
include("height.jl")

export Tree
export Stand

export basal_area, basal_area!
export trees_per_area, trees_per_area!
export qmd, qmd!
export sdi

export gingrich_chart
export reineke_chart

export HeightModel
export estimate_height, estimate_height!

export Curtis,
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

#3 parameter equations, mainly from LMFOR R package
#sorted alphabetically
export Chapman,
Gompertz,
HossfeldIV,
Korf,
Logistic,
Monserud,
Prodan,
Ratkowsky,
Sibbesen,
Weibull

end