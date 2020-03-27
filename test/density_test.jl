using ForestBiometrics
using DelimitedFiles
using Test
using Plots

datapath = joinpath(@__DIR__, "data")
data = readdlm(joinpath(datapath,"StandExam_data.csv"),',',header=true)

tl = Tree[]

for i in eachrow(data[1])
    push!(tl,Tree(i[7], i[8], i[6], i[9]))
end

stand = Stand(tl)

@test isapprox(basal_area(stand), 90.58823529)

basal_area!(stand)

@test isapprox(stand.basal_area, 90.58823529)

@test isapprox(trees_per_area(stand), 147.8593658)

trees_per_area!(stand)

@test isapprox(stand.trees_per_area, 147.8593658)

qmd!(stand)

@test isapprox(stand.qmd, 10.5985824)

@test isapprox(sdi(stand),162.3198113)

@test typeof(gingrich_chart(400, 80)) == Plots.Plot{Plots.GRBackend}
@test typeof(gingrich_chart(stand)) == Plots.Plot{Plots.GRBackend}

@test typeof(reineke_chart(500, 8)) == Plots.Plot{Plots.GRBackend}
@test typeof(reineke_chart(stand))  == Plots.Plot{Plots.GRBackend}
@test typeof(reineke_chart(500,8;maxsdi=600)) == Plots.Plot{Plots.GRBackend}