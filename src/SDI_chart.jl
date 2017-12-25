##Reineke SDI chart
#using Gadfly
using Plots; gr()

function sdi_chart(tpa,qmd;max_sdi=450)
sdi=max_sdi
diarng=collect(1:20)
tparng=[1,1200]
maxline=sdi./(((diarng)./10.0).^1.605)
comp_mortline=maxline*0.55
crown_closeline=maxline*0.35

myxticks=[1,5,10,50,100,500,1000]
myyticks=[1,2,5,10,20]

plot(crown_closeline,diarng,color=:green)
plot!(comp_mortline,diarng,color=:orange)
plot!(maxline,diarng,color=:red,
xscale=:log10,
yscale=:log10,
xlabel="Trees Per Acre",
ylabel="Quadratic Mean Diameter",
legend=false)
annotate!([(80, 18, text("35%",10)),
           (160, 18, text("55%",10)),
           (320, 18, text("100%",10))
           ])
scatter!((tpa,qmd))
end #end function
