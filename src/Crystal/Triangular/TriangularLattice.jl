# Triangular lattice:


"""
    struct TriangularLattice{L, W} <: AbstractCrystalLattice{2}
        sites::Vector{BasicSite{2}}
    end

# Constructor
    TriangularLattice(L::Int64, W::Int64)

# Graphical representation

          A — A — A — A
         ╱ ╲ ╱ ╲ ╱ ╲ ╱
        A — A — A — A
       ╱ ╲ ╱ ╲ ╱ ╲ ╱
      A — A — A — A
     ╱ ╲ ╱ ╲ ╱ ╲ ╱
    A — A — A — A

# TODO: Infinite case (L = Inf or W = Inf)
"""
struct TriangularLattice{L, W} <: AbstractCrystalLattice{2}
    sites::Vector{BasicSite{2}}

    function TriangularLattice(L::Int64, W::Int64)
        sites = BasicSite{2}[]
        for l in 0:L-1, w in 0:W-1
            push!(sites, BasicSite((l, w), 1))
        end
        return new{L, W}(sites)
    end
end
const TriaLatt = TriangularLattice

Base.size(latt::TriangularLattice{L, W}) where {L, W} = (L, W)

function Base.show(io::IO, latt::TriangularLattice)
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
    x = 1.0 * vec_L + 1/2 * vec_W
    y = sqrt(3)/2 * vec_W
    fig = scatterplot(x, y)
    println(io, "  graphic:")
    println(io, fig)
end
