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

function Base.show(io::IO, latt::KagomeLattice)
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

    vec_L = map(x->x.coord[1], latt.sites)
    vec_W = map(x->x.coord[2], latt.sites)
    vec_C = map(x->x.subcell, latt.sites)
    x = 2.0 * vec_L + 1.0 * vec_W + map(c->c==1 ? 0 : c==2 ? 1/2 : 1, vec_C)
    y = sqrt(3) * vec_W + map(c->c in [1, 3] ? 0 : sqrt(3)/2, vec_C)
    fig = scatterplot(x, y)
    println(io, "  graphic:")
    println(io, fig)
end
