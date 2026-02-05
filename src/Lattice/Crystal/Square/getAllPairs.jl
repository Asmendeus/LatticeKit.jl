function getAllPairs(latt::SquareLattice{L, W}, v::NTuple{2, Int64}, which_from::Int64, which_to::Int64, boundary::AbstractBoundaryCondition=PBC()) where {L, W}
    @assert which_from == 1 "Out of the range of subcell: `which_from = $which_from`"
    @assert which_to == 1 "Out of the range of subcell: `which_to = $which_to`"

    pairs = NTuple{2, Int64}[]
    if (boundary isa PBC) || (boundary isa MBC && boundary == MBC((PBC(), PBC())))
        for site in latt.sites
            site_v = mod(site + v, (L, W))
            if site_v in latt.sites
                push!(pairs, (getSite(latt, site), getSite(latt, site_v)))
            end
        end
    elseif (boundary isa OBC) || (boundary isa MBC && boundary == MBC((OBC(), OBC())))
        for site in latt.sites
            site_v = site + v
            if site_v in latt.sites
                push!(pairs, (getSite(latt, site), getSite(latt, site_v)))
            end
        end
    elseif boundary isa MBC
        if boundary == MBC((PBC(), OBC()))
            for site in latt.sites
                site_v = mod(site + v, (L, Inf))
                if site_v in latt.sites
                    push!(pairs, (getSite(latt, site), getSite(latt, site_v)))
                end
            end
        elseif boundary == MBC((OBC(), PBC()))
            for site in latt.sites
                site_v = mod(site + v, (Inf, W))
                if site_v in latt.sites
                    push!(pairs, (getSite(latt, site), getSite(latt, site_v)))
                end
            end
        else
            throw(ArgumentError("Undefined behavior of `boundary = $boundary`"))
        end
    else
        throw(ArgumentError("Undefined behavior of `boundary = $boundary`"))
    end
    return pairs
end
function getAllPairs(latt::SquareLattice{L, W}, v::NTuple{2, Int64}, boundary::AbstractBoundaryCondition=PBC()) where {L, W}
    return getAllPairs(latt, v, 1, 1, boundary)
end

function getAllPairs(latt::SquareLattice, r::Int64, boundary::AbstractBoundaryCondition=PBC())
    if r == 1
        return vcat(getAllPairs(latt, (0, 1), boundary),
                    getAllPairs(latt, (1, 0), boundary))
    elseif r == 2
        return vcat(getAllPairs(latt, (1, -1), boundary),
                    getAllPairs(latt, (1, 1), boundary))
    elseif r == 3
        return vcat(getAllPairs(latt, (0, 2), boundary),
                    getAllPairs(latt, (2, 0), boundary))
    else
        throw(ArgumentError("Undefined behavior of `getAllPairs` for `r = $r`"))
    end
end
