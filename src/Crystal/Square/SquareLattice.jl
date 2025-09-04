"""
    struct SquareLattice{L, W} <: AbstractCrystalLattice{2}
        sites::Vector{BasicSite{2}}
    end

# Constructor
    SquareLattice(L::Int, W::Int)

# Graphical representation

    A —— A —— A —— A
    |    |    |    |
    A —— A —— A —— A
    |    |    |    |
    A —— A —— A —— A
    |    |    |    |
    A —— A —— A —— A

# TODO: Infinite case (L = Inf or W = Inf)
"""
struct SquareLattice{L, W} <: AbstractCrystalLattice{2}
    sites::Vector{BasicSite{2}}

    function SquareLattice(L::Int64, W::Int64)
        sites = BasicSite{2}[]
        for l in 0:L-1, w in 0:W-1
            push!(sites, BasicSite((l, w), 1))
        end
        return new{L, W}(sites)
    end
end
const SquaLatt = SquareLattice
