#Written by: Casey Ghilardi
#Github: crghilardi
#Gingrich stocking chart

using Gadfly
using DataFrames

a =[-0.0507, 0.1698, 0.0317]
b =[0.0175, 0.205, 0.06]

ba_ticks=collect(0:20:160)
tpa_ticks=collect(0:50:450)

#QMD
dia = [7, 8, 10, 12, 14, 16, 18, 20, 22]
#stocking percent horizontal lines
stk_percent=collect(20:10:110)

function amd_convert(qmd)
  amd=-0.259+0.973*qmd
end

#test - should return 6.552
#amd_convert(7)

#function to draw stocking lines...needs work
function make_stklines(stk,dia)
  BA=Float64[]
  TPA=Float64[]
  STK=Int64[]
  for j in stk
    for i in dia
      tpa=(1*j*10)/(a[1]+a[2]*amd_convert(i)+a[3]*i^2)
      ba=pi*(i/24)^2*tpa
      push!(TPA,tpa)
      push!(BA,ba)
      push!(STK,j)
    end
  end
return DataFrame(TPA=TPA,BA=BA,STK=STK)  #,QMD=QMD
end

#try map?
#map((stk,dia,a)->(1*stk*10)/(a[1]+a[2]*amd_convert(dia)+a[3]*dia^2),)

df2=make_stklines(stk_percent,dia)

#function to draw QMD lines
function make_lines(qmd)
  BA=Float64[]
  TPA=Float64[]
  QMD=Int[]
  for i in stk_percent
    tpa= 1*(i*10)/(a[1]+a[2]*amd_convert(qmd)+a[3]*qmd^2)
    ba=pi*(qmd/24)^2*tpa
    push!(TPA,tpa)
    push!(BA,ba)
    push!(QMD,qmd)
  end
return DataFrame(TPA=TPA,BA=BA,QMD=QMD)
end

#from stack overflow, make dataframe containing all QMD lines
df=DataFrame(TPA=Float64[],BA=Float64[],QMD=Int[])
for i in dia
  append!(df,make_lines(i))
end


#equation for A-line
A_line=make_stklines(100,dia)


function make_bline(qmd)
  BA=Float64[]
  TPA=Float64[]
  QMD=Int[]
  for i in stk_percent
    tpa= 1*(i*10)/(b[1]+b[2]*amd_convert(qmd)+b[3]*qmd^2)
    ba=pi*(qmd/24)^2*tpa
    push!(TPA,tpa)
    push!(BA,ba)
    push!(QMD,qmd)
  end
return DataFrame(TPA=TPA,BA=BA,QMD=QMD)
end

df3=DataFrame(TPA=Float64[],BA=Float64[],QMD=Int[])
for i in dia
  append!(df3,make_bline(i))
end



#base plot with axes
#using color=:QMD works, but group=:QMD throws error
myplot=plot(
layer(x=[0],y=[0],Geom.point),
layer(df,x=:TPA,y=:BA,color=:QMD,Geom.line),
layer(df2,x=:TPA,y=:BA,color=:STK,Geom.line),
#layer(df3,x=:TPA,y=:BA,color=:QMD,Geom.line),
    Guide.yticks(ticks=ba_ticks),
    Guide.xticks(ticks=tpa_ticks),
    Guide.xlabel("Trees per acre"),
    Guide.ylabel("Basal Area (sq. ft./acre)",orientation=:vertical),
    Theme(key_position = :none) # remove legend
    )


pwd()
homedir()

cd("$(homedir())/Desktop")

draw(PDF("myplot.pdf", 9inch, 6.5inch), myplot)
