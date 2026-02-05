function getAllPairs(latt::General2DQuasicrystalLattice, r::Real; tol::Real=1e-4)
    pairs = Tuple{Int64, Int64}[]
    for (idx, site) in enumerate(latt.sites)
        indice = findall(si -> abs((si.coord[1]-site.coord[1])^2 + (si.coord[2]-site.coord[2])^2 - r^2) < tol, latt.sites[idx+1:end]) .+ idx
        for index in indice
            push!(pairs, (idx, index))
        end
    end
    return pairs
end
