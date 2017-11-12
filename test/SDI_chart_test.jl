using Base.Test
using ForestBiometrics
using StatPlots; gr()

@test typeof(sdi_chart(230,500,8)) == Plots.Plot{Plots.GRBackend}
