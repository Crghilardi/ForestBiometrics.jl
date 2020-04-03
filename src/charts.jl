#Gingrich stocking chart calculated using the original upland oak parameters
#for more information see:http://oak.snr.missouri.edu/silviculture/tools/gingrich.html

using RecipesBase
## eqs for gingrich chart
amd_convert(qmd) = -0.259 + 0.973qmd
get_tpa(j, i, a) = (1*j*10)/(a[1]+a[2]*amd_convert(i)+a[3]*i^2)

function stklines(stk, dia, a)
  tpa = get_tpa.(stk', dia, Ref(a))
  ba = pi * (dia ./ 24).^2 .* tpa
  tpa, ba
end

@userplot gingrich_chart
@recipe function f(dat::gingrich_chart)
    
  #define parameters
  a = [-0.0507, 0.1698, 0.0317]
  b = [0.175, 0.205, 0.06]
  #QMD lines
  dia = [7, 8, 10, 12, 14, 16, 18, 20, 22]
  #stocking percent horizontal lines
  stk_percent= 20:10:110

  # plot attributes
  xlabel --> "Trees Per Acre"
  ylabel --> "Basal Area (sq ft./acre)"
  xticks --> 0:50:450
  yticks --> 0:20:200
  legend := false
  primary := false

  tpa, ba = stklines(stk_percent, dia, a)

  # horizontal lines
  @series begin
    linecolor := :black
    tpa, ba
  end

  # vertical lines
  @series begin
    linecolor := :black
    tpa', ba'
  end

  # upper red line
  @series begin
    linecolor := :red
    stklines([100], dia, a)
  end

  # lower red line
  @series begin
    linecolor := :red
    stklines([100], dia, b)
  end

  # the point and the annotations
  @series begin
    primary := true
    seriestype := :scatter
    annotations := (100:38:442, 20:10:110, ["$i%" for i in 20:10:110])
    
    x,y = dat.args
    [x], [y]

  end
end

function gingrich_chart(s::Stand)
    gingrich_chart(s.trees_per_area,s.basal_area)
end

##Reineke SDI chart 
@userplot reineke_chart
@recipe function f(dat::reineke_chart ; maxsdi=450)
diarng = 1:1:50
#tparng = [1,1200] #unusued for now, TODO: figure out how to autoscale plot?
maxline() = maxsdi ./ (diarng ./ 10.0).^1.605

  # plot attributes
  xlabel --> "Trees Per Acre"
  ylabel --> "Quadratic Mean Diameter"
  
  xticks --> [1,5,10,50,100,500,1000]
  yticks --> [1,2,5,10,20]

  xscale --> :log10
  yscale --> :log10

  legend := false
  primary := false
  formatter --> x -> string(convert(Int,round(x,digits=2)))

  title --> "Maximum SDI of $maxsdi"

#max SDI line
@series begin
    linecolor := :black
    maxline(), diarng
end

#competition induced mortality SDI line
@series begin
    linecolor := :orange
    maxline() * 0.55, diarng
end

#crown closure SDI line
@series begin
    linecolor := :red
    maxline() * 0.35, diarng
end

 # the point and the annotations
 @series begin
    primary := true
    seriestype := :scatter
    #annotations := (100:38:442, 20:10:110, ["$i%" for i in 20:10:110])
    x,y = dat.args
    [x], [y]
 end
end

function reineke_chart(s::Stand)
    reineke_chart(s.trees_per_area, s.qmd)
end
