function getAllPairs(latt::KagomeLattice{L, W}, v::NTuple{2, Int64}, which_from::Int64, which_to::Int64, boundary::AbstractBoundaryCondition=PBC()) where {L, W}
    @assert which_from in (1, 2, 3) "Out of the range of subcell: `which_from = $which_from`"
    @assert which_to in (1, 2, 3) "Out of the range of subcell: `which_to = $which_to`"

    pairs = NTuple{2, Int64}[]
    if boundary isa PBC
        for site in latt.sites
            site.subcell == which_from || continue
            site_v = mod(site + v, (L, W)) + (which_to - which_from)
            if site_v in latt.sites
                push!(pairs, (getSite(latt, site), getSite(latt, site_v)))
            end
        end
    elseif boundary isa OBC
        for site in latt.sites
            site.subcell == which_from || continue
            site_v = site + v + (which_to - which_from)
            if site_v in latt.sites
                push!(pairs, (getSite(latt, site), getSite(latt, site_v)))
            end
        end
    else
        throw(ArgumentError("Undefined behavior of `boundary = $boundary`"))
    end
    return pairs
end

function getAllPairs(latt::KagomeLattice, r::Int64, boundary::AbstractBoundaryCondition=PBC())
    if r == 1
        return vcat(getAllPairs(latt, (0, 0), 1, 2, boundary),
                    getAllPairs(latt, (0, 0), 1, 3, boundary),
                    getAllPairs(latt, (0, 0), 2, 3, boundary),
                    getAllPairs(latt, (1, 0), 3, 1, boundary),
                    getAllPairs(latt, (0, 1), 2, 1, boundary),
                    getAllPairs(latt, (-1, 1), 2, 3, boundary))
    elseif r == 2
        return vcat(getAllPairs(latt, (-1, 0), 1, 2, boundary),
                    getAllPairs(latt, (-1, 1), 1, 3, boundary),
                    getAllPairs(latt, (-1, 1), 2, 1, boundary),
                    getAllPairs(latt, (0, 1), 2, 3, boundary),
                    getAllPairs(latt, (0, 1), 3, 1, boundary),
                    getAllPairs(latt, (1, 0), 3, 2, boundary))
    elseif r == 3
        return vcat(getAllPairs(latt, (1, 0), 1, 1, boundary),
                    getAllPairs(latt, (0, 1), 1, 1, boundary),
                    getAllPairs(latt, (-1, 1), 1, 1, boundary),
                    getAllPairs(latt, (1, 0), 2, 2, boundary),
                    getAllPairs(latt, (0, 1), 2, 2, boundary),
                    getAllPairs(latt, (-1, 1), 2, 2, boundary),
                    getAllPairs(latt, (1, 0), 3, 3, boundary),
                    getAllPairs(latt, (0, 1), 3, 3, boundary),
                    getAllPairs(latt, (-1, 1), 3, 3, boundary))
    else
        throw(ArgumentError("Undefined behavior of `getAllPairs` for `r = $r`"))
    end
end
