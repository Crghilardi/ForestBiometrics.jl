using IterTools

#functions to collapse multiple tree records into a single tree record with sum of expansions
Base.isless(lhs::Tree, rhs::Tree) = isless((lhs.diameter, lhs.height, lhs.species), (rhs.diameter, rhs.height, rhs.species))

function collapse(ta::Array{Tree,1})
    !issorted(ta) && sort(ta)
    #group by diameter,height,species-  needs to be sorted
    tgroups = groupby(s -> (s.diameter,s.height,s.species),sort(ta))
    # Extract the diameter,height,species from the group members
    trees = imap(s ->(s[1].diameter,s[1].height,s[1].species), tgroups)
    # Compute the sum of expansion
    expans = sum.(imap(x -> getfield.(x, :expansion), tgroups))
    #combine to new Array{Tree}
    return [Tree((t...,s)...) for (t,s) in zip(trees,expans)]
end

function collapse!(s::Stand)
    s.treelist = collapse(s.treelist)
end
#functions to split a single Tree instance into many depending on its expansion
function expand(t::Tree; min_exp = 1.0)
    ch = Channel() do c
        cnt = t.expansion
        while cnt > 0.0
            new_exp = cnt % min_exp != 0.0 ?  cnt % min_exp : min_exp
            put!(c, Tree(t.diameter, t.height, t.species, new_exp))
        cnt -= new_exp
        end
    end
    collect(ch)
end

function expand(ta::Array{Tree,1}; min_exp = 1.0)
    ch = Channel() do c
        for t in ta
        cnt = t.expansion
        while cnt > 0.0
            new_exp = cnt % min_exp != 0.0 ?  cnt % min_exp : min_exp
            put!(c, Tree(t.diameter, t.height, t.species, new_exp))
        cnt -= new_exp
        end
        end
    end
    collect(ch)
end

function expand!(s::Stand)
    s.treelist= expand(s.treelist)
end

function Base.:/(t1::Tree, denom::Number)
    expand(t1, min_exp =(t1.expansion/denom))
end
