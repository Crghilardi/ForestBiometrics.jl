#__precompile__(true) needed?

module ForestBiometrics

#dependencies
using DataFrames

#end dependencies

include("HeightDub.jl")
include("LimitingDistance.jl")
include("VolumeEquations.jl")


export LimitingDistance,
        scribner_volume,
        international_volume,
        doyle_volume,

export @HeightDub

end
#end module
