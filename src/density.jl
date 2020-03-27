#Reineke SDI calculation
function sdi(s::Stand)
    return s.trees_per_area * ((s.qmd / 10.0) ^ 1.605)
end

function qmd(s::Stand)
    sum_d2 = 0.0
    @simd for i in eachindex(s.treelist)
    @inbounds sum_d2 += (s.treelist[i].diameter ^ 2 * s.treelist[i].expansion)
    end
    qmd = ismissing(s.trees_per_area) ? sqrt(sum_d2 / s.trees_per_area) : sqrt(sum_d2 / trees_per_area(s))
    return qmd
end

function qmd!(s::Stand)
    s.qmd = qmd(s)
end

function basal_area(s::Stand)
    ba = 0.0
    @simd for i in eachindex(s.treelist)
    @inbounds ba += basal_area(s.treelist[i]) * s.treelist[i].expansion
    end
    return ba
end

function basal_area!(s::Stand)
    s.basal_area = basal_area(s)
end

function basal_area!(s::Stand,m::Metric)
    s.basal_area = basal_area(s, metric)
end

function basal_area(t::Tree)
    return ((t.diameter ^ 2) * K)
end

function basal_area(t::Tree,m::Metric)
    return ((t.diameter ^ 2) * KMETRIC)
end

function trees_per_area(s::Stand)
    tpa = 0.0
    @simd for i in eachindex(s.treelist)
    @inbounds tpa += s.treelist[i].expansion
    end
    return tpa
end

function trees_per_area!(s::Stand)
    s.trees_per_area = trees_per_area(s)
end
