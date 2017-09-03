function sdi(tpa,qmd)
    sdi=tpa*(qmd/10.0)^1.605
end


###FIX EVERYTHING BELOW THIS LINE###
# Function to calculate percent stocking
# from basal area per acre and tree per acre
function stock_pct(ba::Float64,tpa::Float64,spp::String="upland.oak")
  if spp == "upland.oak"
     value = [-0.00507,0.01698,0.00307]
  elseif spp == "northern.red.oak"
     value = [0.02476,0.006272,0.00469]
  else
     value = [-0.00507,0.01698,0.00307]
  end

qmd=sqrt((ba/tpa)/0.005454154)
amd = -0.259 + 0.973 * qmd
percent = (value[1] + value[2] * amd + value[3] * qmd.^2 ) * tpa
  if percent < 0.0
    percent=0.0
  end
return percent
end

stock_pct(100.0,200.0)


# Function to calculate the percent stocking from treelist
#NOT WORKING, passing a data frame throws method call error
# by Casey R Ghilardi, Copyright April 3, 2016
using DataFrames

df=DataFrame()
df[:treenum]=collect(1:20)
df[:dbh]=[10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0,10.0]

sum(df[:dbh])

#using upland oak parms
function stocking(data::DataFrame, expfac::Int=0, parms::Float64=[-0.00507,0.01698,0.00317],b::Float64=0.4)
  sumd= sum(data[:dbh])
  sumd2=sum(data[:dbh] .^2)

  if expfac == 0
     tpa = length(data[:dbh])
     ba = sum(0.005454154 .* data[:dbh] .^2)
     dq = sqrt(sumd2/tpa)
  else
    tpa = length(data[:dbh]) * expfac
    ba = sum(0.005454154.*data[:dbh].^2) * expfac
    dq = sqrt(sumd2*expfac/tpa)
    sumd = sumd * expfac
    sumd2 = sumd2 * expfac
  end
sp = parms[1].*tpa .+ parms[2]*sumd + parms[3].*ba/0.005454154
sdi = tpa.*(dq/10)^(1.605)
rd = sum(ba)/(dq^b)
return [sp,sdi,rd]
end

stocking(data=df)
