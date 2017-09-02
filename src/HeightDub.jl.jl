
# 2 parameter Wyckoff coefficients. Default values for IE variant of FVS
Coeffs=Dict{String,Array{Float64}}(
"WP"=> [5.19988	-9.26718],
"WL"=>[4.97407	-6.78347],
"DF"=>[4.81519	-7.29306],
"GF"=>[5.00233	-8.19365],
"WH"=>[4.97331	-8.1973],
"RC"=>[4.89564	-8.39057],
"LP"=>[4.62171	-5.32481],
"ES"=>[4.9219	-8.30289],
"AF"=>[4.76537	-7.61062],
"PP"=>[4.9288	-9.32795],
"MH"=>[4.77951	-9.31743],
"WB"=>[4.97407	-6.78347],
"LM"=>[4.192	-5.1651],
"LL"=>[4.76537	-7.61062],
"PI"=>[3.2	-5.0],
"RM"=>[3.2	-5.0],
"PY"=>[4.192	-5.1651],
"AS"=>[4.4421	-6.5405],
"CO"=>[4.4421	-6.5405],
"MM"=>[4.4421	-6.5405],
"PB"=>[4.4421	-6.5405],
"OH"=>[4.4421	-6.5405],
"OS"=>[4.77951	-9.31743] )

#2 parameter equations
#mainly from the LMFOR R package
Wyckoff=(x,b)->4.5+exp(b[1]+(b[2]/(x+1)))
Naslund=(x,b)->4.5+(x^2/(b[1]+b[2]*x)^2)
Curtis=(x,b)->4.5+b[1]*(x/1+x)^b[2])
Michailoff=(x,b)-> 4.5+b[1]*exp(-b[2]*x^(-1))
Meyer=(x,b)->4.5+b[1]*(1-exp(-b[2]*x))
Power=(x,b)-> 4.5+b[1]*x^b[2]
Naslund2=(x,b)-> 4.5+x^2/(b[1]+exp(b[2])*x)^2
Naslund3=(x,b)-> 4.5+x^2/(exp(b[1]) + b[2]*x)^2
Naslund4=(x,b)-> 4.5+x^2/(exp(b[1]) +exp(b[2])*x)^2
Mmicment=(x,b)-> 4.5 b[1]*x/(b[2]+x)
Micment2=(x,b)-> 4.5+x/(b[1]+b[2]*x)


#3 parameter equations from LMFOR R package
Prodan=(x,b)->4.5+x^2/(b[1]+b[2]*x+b[3]*x^2)
Logistic=(x,b)->4.5+b[1]/(1+b[2]*exp(-b[3]*x))
Chapman=(x,b)->4.5+b[1]*(1-exp(-b[2]*x))^b[3]
Weibull=(x,b)->4.5+b[1]*(1-exp(-b[2]*x^b[3]))
Gomperz=(x,b)->4.5+b[1]*exp(-b[2]*exp(-b[3]*x))
Sibbesen=(x,b)->4.5+b[1]*x^(b[2]*x^(-b[3]))
Korf=(x,b)->4.5+b[1]*exp(-b[2]*x^(-b[3]))
Ratkowsky=(x,b)->4.5+b[1]*exp(-b[2]/(x+b[3]))
HossfeldIV=(x,b)->4.5+b[1]/(1+1/(b[2]*x^b[3]))
###

macro HeightDub(func,lookup_table,df,species,diameter)
  quote
    out=Float64[]
    #out2=[]
    for i in 1:size($df,1)
      diam=$df[$diameter][i]
      coeff=get($lookup_table,$df[$species][i],0)
      #push!(out,diam)
      #push!(out2,[diam,coeff])
      y=($func)(diam,coeff)
      push!(out,y)
    end
    return out
    #return out2
  end
end

#example usage
#@HeightDub(Wyckoff,Coeffs,df)

function UserDefHD(x::String)
parse("(x,b)->"*x)
end

#example usage
#UserDefHD("x^2+4.5")



using DataFrames
df=readtable("FVS_Data_IEsubset.csv")

@macroexpand

@HeightDub(Naslund,Coeffs,df,:Species,:DBH)
