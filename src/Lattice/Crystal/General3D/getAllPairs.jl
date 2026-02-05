function getAllPairs(latt::General3DLattice{L, W, H, C}, v::NTuple{3, Int64}, which_from::Int64, which_to::Int64, boundary::AbstractBoundaryCondition=PBC()) where {L, W, H, C}
    @assert which_from in 1:C "Out of the range of subcell: `which_from = $which_from`"
    @assert which_to in 1:C "Out of the range of subcell: `which_to = $which_to`"

    pairs = NTuple{2, Int64}[]
    if boundary isa PBC
        for site in latt.sites
            site.subcell == which_from || continue
            site_v = mod(site + v, (L, W, H)) + (which_to - which_from)
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
