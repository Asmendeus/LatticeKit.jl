"""
    struct CubicLattice{L, W, H} <: AbstractCrystalLattice{3}
        sites::Vector{BasicSite{3}}
    end

# Constructor
    CubicLattice(L::Int64, W::Int64, H::Int64)
"""
struct CubicLattice{L, W, H} <: AbstractCrystalLattice{3}
    sites::Vector{BasicSite{3}}

    function CubicLattice(L::Int64, W::Int64, H::Int64)
        sites = BasicSite{3}[]
        for l in 0:L-1, w in 0:W-1, h in 0:H-1
            push!(sites, BasicSite((l, w, h), 1))
        end
        return new{L, W, H}(sites)
    end
end
const CubiLatt = CubicLattice

Base.size(latt::CubicLattice{L, W, H}) where {L, W, H} = (L, W, H)

function Base.show(io::IO, latt::CubicLattice)
    println(io, "$(typeof(latt)):")

    print(io, "  sites: [")
    for i in 1:4
        print(io, "$(latt.sites[i]), ")
    end
    if nsites(latt) ≤ 5
        println(io, "$(latt.sites[5])]")
    else
        println(io, "$(latt.sites[5]), ⋯ ]")
    end
end
