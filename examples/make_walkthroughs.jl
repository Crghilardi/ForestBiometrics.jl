#Pkg.add(Weave)
using Weave

#HeightDiameter walkthrough
weave(Pkg.dir("ForestBiometrics.jl","examples/HeightDiameter_walkthrough.jmd"),
informat="markdown", out_path = "../examples/html",
doctype = "md2html")
