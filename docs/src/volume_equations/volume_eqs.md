# Volume Equations
## Calculating the volume of an individual tree

**This functionality is under active development and may change**

ForestBiometrics has functions to calculate log volumes using a variety of scaling rules


## Doyle Rule

      doyle_volume(small end diameter, log length)

calculates the doyle volume

## Scribner

      scribner_volume(small end diameter, log length; decimal_C=false)

calculates the scribner volume calculated using the formula

```math
V = (0.79D^2 - 2D - 4)\frac{L}{16}
```

where V is the Scribner board foot volume, D is the small end diameter in inches and L is the log length in feet.

 `decimal_C=true` will return the board feet in the standard Scribner Decimal C lookup table for trees dib >5" and log lengths <20'. Oversize logs are calculated using the formula above.


## International

      international_volume(small end diameter, log length)

calculates the volume using international rule

## Types

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


There are also other Types including Log and LogSegment defined in the source but not exported yet, but I haven't fully fleshed out what a Julia-esque volume equations API looks like. Suggestions and issues are welcome.
