function getAllPairs(latt::ThueMorseLattice{D}, v::NTuple{D, Int64}) where D
    for site in latt.sites
        site_v = site + v
        if site_v in latt.sites
            push!(pairs, (getSite(latt, site), getSite(latt, site_v)))
        end
    end
end

function getAllPairs(latt::ThueMorseLattice{2}, r::Int64)
    if r == 1
        pairs = Tuple{Int64, Int64}[]
        for site in latt.sites

            site_up = site + (1, 0)
            site_right = site + (0, 1)

            if site_up in latt.sites
                push!(pairs, (getSite(latt, site), getSite(latt, site_up)))
            end
            if site_right in latt.sites
                push!(pairs, (getSite(latt, site), getSite(latt, site_right)))
            end

        end
        return pairs
    elseif r == 2
        pairs = Tuple{Int64, Int64}[]
        for site in latt.sites

            site_down = site + (-1, 0)
            site_up = site + (1, 0)
            site_right = site + (0, 1)
            site_right_up = site + (1, 1)
            site_right_down = site + (-1, 1)

            if (site_right_down in latt.sites) && (!(site_down in latt.sites) || !(site_right in latt.sites))
                push!(pairs, (getSite(latt, site), getSite(latt, site_right_down)))
            end
            if (site_right_up in latt.sites) && (!(site_up in latt.sites) || !(site_right in latt.sites))
                push!(pairs, (getSite(latt, site), getSite(latt, site_right_up)))
            end

        end
        return pairs
    else
        throw(ArgumentError("Undefined behavior of `getAllPairs` for `r = $r`"))
    end
end
