## Calculating the volume of an individual tree

**This functionality is under active development and may change**

ForestBiometrics has functions to calculate log volumes using a variety of scaling rules

      doyle_volume(small end diameter, log length)

calculates the doyle volume

      scribner_volume(small end diameter, log length)

calculates the scribner volume

      international_volume(small end diameter, log length)

calculates the volume using international rule

In addition, we introduce two abstract types, `VolumeEquation`, and `MerchSpecs`.

MerchSpecs is a super type to allow for merchandizing specifications to be stored and referenced by product and some common ones have been predefined.

      type Sawtimber<:MerchSpecs
      std_length
      trim
      min_length
      max_length
      min_dib
      end
      Sawtimber(16.0,0.5,8.0,20.0,6.0)
