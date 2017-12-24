#Gingrich stocking chart calculated using the original upland oak parameters
#for more information see:http://oak.snr.missouri.edu/silviculture/tools/gingrich.html

using Plots
using StatPlots; gr()
using DataFrames

function gingrich_chart(tpa_in,basal_area_in)
#define parameters
a =[-0.0507, 0.1698, 0.0317]
b =[0.175, 0.205, 0.06]

ba_ticks=collect(0:20:160)
tpa_ticks=collect(0:50:450)

#QMD lines
dia = [7, 8, 10, 12, 14, 16, 18, 20, 22]
#stocking percent horizontal lines
stk_percent=collect(20:10:110)

#function to convert between artihmetic and quadratic mean
#need to add this to test?
function amd_convert(qmd)
  amd=-0.259+0.973*qmd
end

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
return DataFrame(TPA=TPA,BA=BA,STK=STK)
end

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

stk_percent
function make_bline(qmd)
  STK=Int64[]
  BA=Float64[]
  TPA=Float64[]
  QMD=Int[]
  for i in stk_percent
    tpa= 1*(i*10)/(b[1]+b[2]*amd_convert(qmd)+b[3]*qmd^2)
    ba=pi*(qmd/24)^2*tpa
    push!(STK,i)
    push!(TPA,tpa)
    push!(BA,ba)
    push!(QMD,qmd)
  end
return DataFrame(STK=STK,TPA=TPA,BA=BA,QMD=QMD)
end

df3=DataFrame(STK=Int64[],TPA=Float64[],BA=Float64[],QMD=Int[])
for i in dia
  append!(df3,make_bline(i))
end
df3
B_line=df3[df3[:STK] .== 100,:] # super hacky work around for now...


@df df plot(:TPA,:BA,group=:QMD,color=:black,legend=false)
@df df2 plot!(:TPA,:BA,group=:STK,color=:black,legend=false)
@df A_line plot!(:TPA,:BA,group=:STK,color=:red,legend=false)
@df B_line plot!(:TPA,:BA,group=:STK,color=:red,
xlabel="Trees Per Acre",
ylabel="Basal Area (sq ft./acre)",
xticks=collect(0:50:450),
yticks=collect(0:20:200),
legend=false)
#text coords approximated, text() is a plot thing that wraps into type, so you can passs font and text parameters
annotate!([(100, 19, text("20%",10)),
           (138, 29, text("30%",10)),
           (174, 38, text("40%",10)),
           (214, 49, text("50%",10)),
           (254, 60, text("60%",10)),
           (290, 69, text("70%",10)),
           (324, 79, text("80%",10)),
           (364, 89, text("90%",10)),
           (404, 99, text("100%",10)),
           (440, 112, text("110%",10))
           ])
scatter!((tpa_in,basal_area_in))

#####################
#deprecated when dataframes reboot came out? had to switch to @df syntax
# plot(df,:TPA,:BA,group=:QMD,color=:black)
# plot!(df2,:TPA,:BA,group=:STK,color=:black,
# xlabel="Trees Per Acre",
# ylabel="Basal Area (sq ft./acre)",
# xticks=collect(0:50:450),
# yticks=collect(0:20:200),
# legend=false)
# scatter!((tpa_in,basal_area_in))
#####################

end #end function

gingrich_chart(400,80)
