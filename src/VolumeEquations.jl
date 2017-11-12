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

#introduce abstract super types
 abstract type VolumeEquation end
 abstract type MerchSpecs end

type Sawtimber<:MerchSpecs
std_length
trim
min_length
max_length
min_dib
end
#Sawtimber(16.0,0.5,8.0,20.0,6.0)

type Fiber<:MerchSpecs
min_length
std_length
min_dib
min_dbh
end
#Fiber(8.0,20.0,2.6,4.6)

type Pulp<:MerchSpecs
min_live_dib #pulp sawlogs
min_dead_dib #pulp sawlogs
end
#Pulp(6.0,6.0)

#K = 0.005454 - converts diameter squared in square inches to square feet.
#0.00007854 converts diamter square centimeters to square meters
const K = 0.005454154
const KMETRIC = 0.00007854

#PREDICT CUBIC FOOT VOLUME FOR A CONIC SEGMENT SUCH AS A STEM TIP
function conic_cf(lower_diameter,length)
    cubic_ft=(K*lower_diameter^2.0)/3.0*length
    return cubic_ft
end

#PREDICT CUBIC FOOT VOLUME FOR A LOG SEGMENT USING NEWTON'S FORMULA
function newton_cf(lower_diameter,midpoint_diameter,upper_diameter,length)
    cubic_ft = (K*length^2.0 + 4.0*K*midpoint_diameter^2.0 + K*upper_diameter^2.0)*length/6.0
    return cubic_ft
end


####work in progress


#PREDICT DIAMETER INSIDE BARK AT ANY LOGICAL HEIGHT
function get_dib(species,dbh,tht,ht)
end

#PREDICT THE HEIGHT AT WHICH A SPECIFIED DIAMETER INSIDE BARK OCCURS
function get_height_to_dib(species,dbh,tht,dib)
 end

#PREDICT THE CUBIC-FOOT VOLUME IN A TREE BETWEEN TWO HEIGHTS
function get_segment_cf()
end

#TO BREAK A SAWTIMBER BOLE INTO LOGS AND POPULATE THE SEGMENT LENGTH
function stem_buck()
end

#TO ASSIGN PRODUCT CLASSES TO EACH LOG SEGMENT IN A SINGLE TREE
function prod_classify()
end

#TO MERCHANDIZE AN INDIVIDUAL TREE WITH PREVIOUSLY BUCKED LOGS AND
#PRODUCTS ASSIGNED TO INDIVIDUAL LOGS INTO PIECES, AND DEVELOP THE NECESSARY PIECE INFORMATION (DIB,LEN,GRS,NET,NPCS)
function merchandize_tree() end
