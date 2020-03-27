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

export curtis,
michailoff,
meyer,
micment,
micment2,
naslund,
naslund2,
naslund3,
naslund4,
power,
wyckoff

#3 parameter equations, mainly from LMFOR R package
#sorted alphabetically
export chapman,
gompertz,
hossfeldIV,
korf,
logistic,
monserud,
prodan,
ratkowsky,
sibbesen,
weibull

end