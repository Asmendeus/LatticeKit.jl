"""
    struct General3DLattice{L, W, H, C} <: AbstractCrystalLattice{3}
        sites::Vector{BasicSite{3}}
    end

# Constructor
    General3DLattice(L::Int64, W::Int64, H::Int64, C::Int64)

# TODO: Infinite case (L = Inf or W = Inf or H = Inf)
"""
struct General3DLattice{L, W, H, C} <: AbstractCrystalLattice{3}
    sites::Vector{BasicSite{3}}

    function General3DLattice(L::Int64, W::Int64, H::Int64, C::Int64)
        sites = BasicSite{3}[]
        for l in 0:L-1, w in 0:W-1, h in 0:H-1, c in 1:C
            push!(sites, BasicSite((l, w, h), c))
        end
        return new{L, W, H, C}(sites)
    end
end
const G3DLatt = General3DLattice
