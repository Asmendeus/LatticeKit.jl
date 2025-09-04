"""
    struct HexagonalLattice{L, W} <: AbstractCrystalLattice{2}
        sites::Vector{BasicSite{2}}
    end

# Constructor
    HexagonalLattice(L::Int, W::Int)

# Graphical representation

                B       B       B       B
                |       |       |       |
                A       A       A       A
              ╱   ╲   ╱   ╲   ╱   ╲   ╱
            B       B       B       B
            |       |       |       |
            A       A       A       A
          ╱   ╲   ╱   ╲   ╱   ╲   ╱
        B       B       B       B
        |       |       |       |
        A       A       A       A
      ╱   ╲   ╱   ╲   ╱   ╲   ╱
    B       B       B       B
    |       |       |       |
    A       A       A       A

# TODO: Infinite case (L = Inf or W = Inf)
"""
struct HexagonalLattice{L, W} <: AbstractCrystalLattice{2}
    sites::Vector{BasicSite{2}}

    function HexagonalLattice(L::Int64, W::Int64)
        sites = BasicSite{2}[]
        for l in 0:L-1, w in 0:W-1, c in 1:2
            push!(sites, BasicSite((l, w), c))
        end
        return new{L, W}(sites)
    end
end
const HexaLatt = HexagonalLattice
