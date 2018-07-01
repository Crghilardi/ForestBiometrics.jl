using Test
using Plots
using StatPlots; gr()
using ForestBiometrics
using DataFrames

#@test amd_convert(7) == 6.552 #how to test this since its in function?
@test typeof(gingrich_chart(400,80)) == Plots.Plot{Plots.GRBackend}
