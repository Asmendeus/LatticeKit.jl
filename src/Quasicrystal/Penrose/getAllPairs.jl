function getAllPairs(latt::PenroseLattice, r::Int64)
    if r == 1
        pairs = Tuple{Int64, Int64}[]
        for (idx, site) in enumerate(latt.sites)
            indice = findall(si -> abs((si.coord[1]-site.coord[1])^2 + (si.coord[2]-site.coord[2])^2 - 1) < 1e-3, latt.sites[idx+1:end]) .+ idx
            for index in indice
                push!(pairs, (idx, index))
            end
        end
        return pairs
    else
        throw(ArgumentError("Undefined behavior of `getAllPairs` for `r = $r`"))
    end
end
