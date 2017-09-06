using Base.Test
using ForestBiometrics
using StatPlots; pyplot()

@test typeof(sdi_chart(230,500,8)) == Plots.Plot{Plots.PyPlotBackend}
