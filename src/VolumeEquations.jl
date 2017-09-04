# Functions to calculate the Doyle Board foot volume,scribner volume,
# or international volume from small end diameter and log length

#TO DO: add cubic volume?
#http://oak.snr.missouri.edu/forestry_functions/cubicvolume.php


#Function to calculate the Doyle scale volume
#for more info see: http://oak.snr.missouri.edu/forestry_functions/doylebfvolume.php
function doyle_volume(small_end_diam::Float64,length::Int)
  volume=((small_end_diam-4.0)/4.0)^2*length
    return volume
  end

#Function to calculate the Scribner scale volume
#for more info see: http://oak.snr.missouri.edu/forestry_functions/scribnerbfvolume.php
function scribner_volume(small_end_diam::Float64,length::Int)
  volume=(0.79*small_end_diam^2-2*small_end_diam-4)*(length/16)
    return volume
  end

#Function to calculate the International scale volume
#for more info see: http://oak.snr.missouri.edu/forestry_functions/int14bfvolume.php
function international_volume(small_end_diam::Float64,length::Int)
  if length == 4
      volume = 0.22*small_end_diam^2-0.71*small_end_diam
    elseif length == 8
      volume = 0.44*small_end_diam^2-1.20*small_end_diam-0.30
    elseif length == 12
      volume = 0.66*small_end_diam^2 - 1.47 * small_end_diam - 0.79
    elseif length == 16
      volume = 0.88 * small_end_diam^2 - 1.52 * small_end_diam - 1.36
    elseif length == 20
      volume = 1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90
    elseif length == 24
      volume = 1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90 + 0.22 * small_end_diam^2 - 0.71 * small_end_diam
    elseif length == 28
      volume = 1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90 + 0.44 * small_end_diam^2 - 1.20 * small_end_diam - 0.30
    elseif length == 32
      volume = 1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90 + 0.66 * small_end_diam^2 - 1.47 * small_end_diam - 0.79
    elseif length == 36
      volume = 1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90 + 0.88 * small_end_diam^2 - 1.52 * small_end_diam - 1.36
    elseif length == 40
      volume = (1.10 * small_end_diam^2 - 1.35 * small_end_diam - 1.90 )*2
      return volume
    end
  end
