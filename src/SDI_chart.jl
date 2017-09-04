##Reineke SDI graph
function sdi_chart(sdi::Int64)
using Gadfly
using Formatting
sdi=sdi
diarng=collect(1:20)
tparng=[1,1200]
maxline=sdi./(((diarng)./10.0).^1.605)
comp_mortline=maxline*0.55
crown_closeline=maxline*0.35

myxticks=log.([1,5,10,50,100,500,1000])
myyticks=log.([1,2,5,10,20])
labels=d->@sprintf("%d",e^d)
1.6094379124341003

using Formatting
fmt = "%d"

sprintf1( fmt,e^1.6094379124341003)

d-> sprintf1( fmt,e^d)
myplot=plot(
    layer(x=[25], y=[4],Geom.point),
    layer(x=maxline,y=diarng,Geom.line),
    layer(x=comp_mortline,y=diarng,Geom.line),
    layer(x=crown_closeline,y=diarng,Geom.line),
    Scale.x_log(labels=d-> sprintf1( fmt,e^d)),
    Scale.y_log(),
    Guide.xticks(ticks=myxticks),
    Guide.yticks(ticks=myyticks),
    Guide.XLabel("Trees per acre"),
    Guide.YLabel("Quadratic Mean Diameter")
    )

end #end function

using Cairo

draw(PNG("RDI_chart_example.png", 6.5inch, 9inch), myplot)
