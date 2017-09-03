#__precompile__(true) needed?

module ForestBiometrics

#dependencies
using DataFrames

#end dependencies

include("HeightDub.jl")
include("LimitingDistance.jl")
include("VolumeEquations.jl")
include("EquilibriumMoistureContent.jl")
include("ForestStocking.jl")

export limiting_distance,
        scribner_volume,
        international_volume,
        doyle_volume,
        UserDefHD,
        emc,
        sdi

export @HeightDub

end
#end module
