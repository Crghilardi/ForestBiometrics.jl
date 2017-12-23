# Forestry charts

ForestBiometrics.jl has some graphing functionality including:

## Gingrich stocking chart

      gingrich_chart(tpa_in,basal_area_in)

will return a gingrich style stocking chart with a point (See example on Readme.md on project Github)

## Reineke SDI chart

      sdi_chart(max_sdi,tpa,qmd)

will return a stand density index chart, where max is the upper bound and a point will be placed on tpa and qmd (See example on Readme.md on project Github)
