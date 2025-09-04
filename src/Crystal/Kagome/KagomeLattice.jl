"""
    struct KagomeLattice{L, W} <: AbstractCrystalLattice{2}
        sites::Vector{BasicSite{2}}
    end

# Constructor
    KagomeLattice(L::Int, W::Int)

# Graphical representation

                  B       B       B       B
                 ╱ ╲     ╱ ╲     ╱ ╲     ╱ ╲
                A — C — A — C — A — C — A — C
               ╱     ╲ ╱     ╲ ╱     ╲ ╱
              B       B       B       B
             ╱ ╲     ╱ ╲     ╱ ╲     ╱ ╲
            A — C — A — C — A — C — A — C
           ╱     ╲ ╱     ╲ ╱     ╲ ╱
          B       B       B       B
         ╱ ╲     ╱ ╲     ╱ ╲     ╱ ╲
        A — C — A — C — A — C — A — C
       ╱     ╲ ╱     ╲ ╱     ╲ ╱
      B       B       B       B
     ╱ ╲     ╱ ╲     ╱ ╲     ╱ ╲
    A — C — A — C — A — C — A — C

# TODO: Infinite case (L = Inf or W = Inf)
"""
struct KagomeLattice{L, W} <: AbstractCrystalLattice{2}
    sites::Vector{BasicSite{2}}

    function KagomeLattice(L::Int64, W::Int64)
        sites = BasicSite{2}[]
        for l in 0:L-1, w in 0:W-1, c in 1:3
            push!(sites, BasicSite((l, w), c))
        end
        return new{L, W}(sites)
    end
end
const KagoLatt = KagomeLattice
