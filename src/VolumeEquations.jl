# Functions to calculate the Doyle Board foot volume,scribner volume,
# or international volume from small end diameter and log length

#Function to calculate the Doyle scale volume
function doyle_volume(small_end_diam::Float64,length::Int)
  value=((small_end_diam-4.0)/4.0)^2*length
    return value
  end

#Function to calculate the Scribner scale volume
function scribner_volume(small_end_diam::Float64,length::Int)
  value=(0.79*small_end_diam^2-2*small_end_diam-4)*(length/16)
    return value
  end

#Function to calculate the International scale volume
function international_volume(small_end_diam::Float64,length::Int)
  if length == 4
      value = 0.22*small_end_diam^2-0.71*small_end_diam
    elseif length == 8
      value = 0.44*small_end_diam^2-1.20*small_end_diam-0.30
    elseif length == 12
      value = 0.66*small_end_diam^2 - 1.47 * small_end_diam - 0.79
    elseif length == 16
      value = 0.88 * small_end_diam^2 - 1.52 * small_end_diam - 1.36
    elseif length == 20
      value = 1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90
    elseif length == 24
      value = 1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90 + 0.22 * small_end_diam^2 - 0.71 * small_end_diam
    elseif length == 28
      value = 1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90 + 0.44 * small_end_diam^2 - 1.20 * small_end_diam - 0.30
    elseif length == 32
      value = 1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90 + 0.66 * small_end_diam^2 - 1.47 * small_end_diam - 0.79
    elseif length == 36
      value = 1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90 + 0.88 * small_end_diam^2 - 1.52 * small_end_diam - 1.36
    elseif length == 40
      value = (1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90 )*2
      return value
    end
  end
