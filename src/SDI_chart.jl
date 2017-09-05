##Reineke SDI chart
#using Gadfly
using Plots; PyPlot
function sdi_chart(max_sdi,tpa,qmd)
sdi=max_sdi
diarng=collect(1:20)
tparng=[1,1200]
maxline=sdi./(((diarng)./10.0).^1.605)
comp_mortline=maxline*0.55
crown_closeline=maxline*0.35

myxticks=[1,5,10,50,100,500,1000]
myyticks=[1,2,5,10,20]

plot(comp_mortline,diarng,
xscale=:log10,
yscale=:log10,
xlabel="Trees Per Acre",
ylabel="Quadratic Mean Diameter",
legend=false
)
plot!(crown_closeline,diarng)
plot!(maxline,diarng)
scatter!((tpa,qmd))
end #end function
typeof(sdi_chart(230,500,8))== Plots.Plot{Plots.PyPlotBackend}


##Gadfly version - to be removed
# myplot=plot(
#     layer(x=tpa, y=qmd,Geom.point),
#     layer(x=maxline,y=diarng,Geom.line),
#     layer(x=comp_mortline,y=diarng,Geom.line),
#     layer(x=crown_closeline,y=diarng,Geom.line),
#     Scale.x_log(),
#     Scale.y_log(),
#     Guide.xticks(ticks=myxticks),
#     Guide.yticks(ticks=myyticks),
#     Guide.XLabel("Trees per acre"),
#     Guide.YLabel("Quadratic Mean Diameter")
#     )
