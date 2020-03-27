mutable struct Stand
    treelist::Array{Tree,1}
    basal_area::Union{Real,Missing}
    trees_per_area::Union{Real,Missing}
    qmd::Union{Real,Missing}
end

Stand(tl::Array{Tree,1}) = Stand(tl,missing,missing,missing)