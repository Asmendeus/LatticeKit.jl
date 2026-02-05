"""
    struct HexagonalLattice{L, W} <: AbstractCrystalLattice{2}
        sites::Vector{BasicSite{2}}
    end

# Constructor
    HexagonalLattice(L::Int64, W::Int64)

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

Base.size(latt::HexagonalLattice{L, W}) where {L, W} = (L, W)

function Base.show(io::IO, latt::HexagonalLattice)
    println(io, "$(typeof(latt)):")

    print(io, " $(nsites(latt)) sites: [")
    if nsites(latt) == 0
        println(io, "]")
    elseif nsites(latt) ≤ 5
        for i in 1:nsites(latt)-1
            print(io, "$(latt.sites[i]), ")
        end
        println(io, "$(latt.sites[end])]")
    else
        for i in 1:4
            print(io, "$(latt.sites[i]), ")
        end
        println(io, "$(latt.sites[5]), ⋯ ]")
    end

    vec_L = map(x->x.coord[1], latt.sites)
    vec_W = map(x->x.coord[2], latt.sites)
    vec_C = map(x->x.subcell, latt.sites)
    x = sqrt(3) * vec_L + sqrt(3)/2 * vec_W
    y = 3/2 * vec_W + map(c->c==1 ? 0 : 1, vec_C)
    fig = scatterplot(x, y)
    println(io, "  graphic:")
    println(io, fig)
end
