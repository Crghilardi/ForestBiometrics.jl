using DataFrames
#using Base.test

cd("$(pwd())/test/data")
df=readtable("IEsubset_Data_CSV.csv")
# 2 parameter Wyckoff coefficients. Default values for IE variant of FVS
FVS_IE=Dict{String,Array{Float64}}(
"WP"=>[5.19988	-9.26718],
"WL"=>[4.97407	-6.78347],
"DF"=>[4.81519	-7.29306],
"GF"=>[5.00233	-8.19365],
"WH"=>[4.97331	-8.19730],
"RC"=>[4.89564	-8.39057],
"LP"=>[4.62171	-5.32481],
"ES"=>[4.9219	-8.30289],
"AF"=>[4.76537	-7.61062],
"PP"=>[4.9288	-9.32795],
"MH"=>[4.77951	-9.31743],
"WB"=>[4.97407	-6.78347],
"LM"=>[4.19200	-5.16510],
"LL"=>[4.76537	-7.61062],
"PI"=>[3.20000	-5.00000],
"RM"=>[3.20000	-5.00000],
"PY"=>[4.19200	-5.16510],
"AS"=>[4.44210	-6.54050],
"CO"=>[4.44210	-6.54050],
"MM"=>[4.44210	-6.54050],
"PB"=>[4.44210	-6.54050],
"OH"=>[4.44210	-6.54050],
"OS"=>[4.77951	-9.31743] )

@HeightDub(Wyckoff,FVS_IE,df,:Species,:DBH)
user_eq=UserDefHD("4.5+x^b[1]^b[2]")
@HeightDub(user_eq,FVS_IE,df,:Species,:DBH)
