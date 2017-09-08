__precompile__(true) #needed?

module ForestBiometrics

#dependencies
using DataFrames
using Plots
using StatPlots

#end dependencies

export emc
export sdi
export gingrich_chart
export @HeightDub, UserDefHD

export limiting_distance

export sdi_chart

export  scribner_volume,
        international_volume,
        doyle_volume

#Alphabetic order

include("EquilibriumMoistureContent.jl")
include("ForestStocking.jl")
include("GingrichStocking_chart.jl")
include("HeightDub.jl")
include("LimitingDistance.jl")
include("SDI_chart.jl")
include("VolumeEquations.jl")

end
#end module
