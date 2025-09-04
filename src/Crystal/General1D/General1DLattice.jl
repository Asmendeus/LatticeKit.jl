"""
    struct General1DLattice{L, C} <: AbstractCrystalLattice{1}
        sites::Vector{BasicSite{1}}
    end

# Constructor
    General1DLattice(L::Int64, C::Int64)

# TODO: Infinite case (L = Inf)
"""
struct General1DLattice{L, C} <: AbstractCrystalLattice{1}
    sites::Vector{BasicSite{1}}

    function General1DLattice(L::Int64, C::Int64)
        sites = BasicSite{1}[]
        for l in 0:L-1, c in 1:C
            push!(sites, BasicSite((l,), c))
        end
        return new{L, C}(sites)
    end
end
const G1DLatt = General1DLattice
