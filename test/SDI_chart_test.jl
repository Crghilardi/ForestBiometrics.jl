using Base.Test
using ForestBiometrics
using StatPlots; gr()

@test typeof(sdi_chart(500,8)) == Plots.Plot{Plots.GRBackend}
@test typeof(sdi_chart(500,8;max_sdi=600)) == Plots.Plot{Plots.GRBackend}
