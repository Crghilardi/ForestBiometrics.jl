##Named Equations
#2 parameter equations, mainly from the LMFOR R package
#sorted alphabetically
Curtis=(x,b)->4.5+b[1]*((x/1+x)^b[2])
Michailoff=(x,b)->4.5+b[1]*exp(-b[2]*x^(-1))
Meyer=(x,b)->4.5+b[1]*(1-exp(-b[2]*x))
Micment=(x,b)->4.5+b[1]*x/(b[2]+x)
Micment2=(x,b)-> 4.5+x/(b[1]+b[2]*x)
Naslund=(x,b)->4.5+(x^2/(b[1]+b[2]*x)^2)
Naslund2=(x,b)-> 4.5+x^2/(b[1]+exp(b[2])*x)^2
Naslund3=(x,b)-> 4.5+x^2/(exp(b[1]) + b[2]*x)^2
Naslund4=(x,b)-> 4.5+x^2/(exp(b[1]) +exp(b[2])*x)^2
Power=(x,b)-> 4.5+b[1]*x^b[2]
Wyckoff=(x,b)->4.5+exp(b[1]+(b[2]/(x+1)))

#3 parameter equations, mainly from LMFOR R package
#sorted alphabetically
Chapman=(x,b)->4.5+b[1]*(1-exp(-b[2]*x))^b[3]
Gompertz=(x,b)->4.5+b[1]*exp(-b[2]*exp(-b[3]*x))
HossfeldIV=(x,b)->4.5+b[1]/(1+1/(b[2]*x^b[3]))
Korf=(x,b)->4.5+b[1]*exp(-b[2]*x^-b[3])
Logistic=(x,b)->4.5+b[1]/(1+b[2]*exp(-b[3]*x))
Monserud=(x,b)->4.5+exp(b[1]+(b[2]*x*b[3]))
Prodan=(x,b)->4.5+x^2/(b[1]+b[2]*x+b[3]*x^2)
Ratkowsky=(x,b)->4.5+b[1]*exp(-b[2]/(x+b[3]))
Sibbesen=(x,b)->4.5+b[1]*x^(b[2]*x^(-b[3]))
Weibull=(x,b)->4.5+b[1]*(1-exp(-b[2]*x^b[3]))
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

function UserDefHD(x::String)
eval(parse("(x,b)->"*x))
end
UserDefHD("4.5+x^b[1]^b[2]")

export UserDefHD, HeightDub

end #end module
