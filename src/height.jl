struct HeightModel <: Function
    formula::Function
    b
end
    
##named equations
#2 parameter equations, mainly from the LMFOR R package
#sorted alphabetically
curtis=(x,b)->4.5+b[1]*((x/1+x)^b[2])
michailoff=(x,b)->4.5+b[1]*exp(-b[2]*x^(-1))
meyer=(x,b)->4.5+b[1]*(1-exp(-b[2]*x))
micment=(x,b)->4.5+b[1]*x/(b[2]+x)
micment2=(x,b)-> 4.5+x/(b[1]+b[2]*x)
naslund=(x,b)->4.5+(x^2/(b[1]+b[2]*x)^2)
naslund2=(x,b)-> 4.5+x^2/(b[1]+exp(b[2])*x)^2
naslund3=(x,b)-> 4.5+x^2/(exp(b[1]) + b[2]*x)^2
naslund4=(x,b)-> 4.5+x^2/(exp(b[1]) +exp(b[2])*x)^2
power=(x,b)-> 4.5+b[1]*x^b[2]
wyckoff=(x,b)->4.5+exp(b[1]+(b[2]/(x+1)))

#3 parameter equations, mainly from LMFOR R package
#sorted alphabetically
chapman=(x,b)->4.5+b[1]*(1-exp(-b[2]*x))^b[3]
gompertz=(x,b)->4.5+b[1]*exp(-b[2]*exp(-b[3]*x))
hossfeldIV=(x,b)->4.5+b[1]/(1+1/(b[2]*x^b[3]))
korf=(x,b)->4.5+b[1]*exp(-b[2]*x^-b[3])
logistic=(x,b)->4.5+b[1]/(1+b[2]*exp(-b[3]*x))
monserud=(x,b)->4.5+exp(b[1]+(b[2]*x*b[3]))
prodan=(x,b)->4.5+x^2/(b[1]+b[2]*x+b[3]*x^2)
ratkowsky=(x,b)->4.5+b[1]*exp(-b[2]/(x+b[3]))
sibbesen=(x,b)->4.5+b[1]*x^(b[2]*x^(-b[3]))
weibull=(x,b)->4.5+b[1]*(1-exp(-b[2]*x^b[3]))

function estimate_height(t::Tree,hd::HeightModel)
    hd.formula(t.diameter, hd.b[t.species])
end

function estimate_height!(t::Tree,hd::HeightModel)
    t.height = ismissing(t.height) ? hd.formula(t.diameter, hd.b[t.species]) : t.height
end

    