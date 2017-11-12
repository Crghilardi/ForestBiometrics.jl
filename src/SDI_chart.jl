##Reineke SDI chart
#using Gadfly
using Plots; gr()

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

sdi_chart(230,500,8)
