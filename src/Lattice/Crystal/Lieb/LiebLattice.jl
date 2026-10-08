"""
    struct LiebLattice{L, W} <: AbstractCrystalLattice{2}
        sites::Vector{BasicSite{2}}
    end

# Constructor
    LiebLattice(L::Int64, W::Int64)

# Graphical representation

    A —— B —— A —— B —— A —— B —— A
    |         |         |         |
    C         C         C         C
    |         |         |         |
    A —— B —— A —— B —— A —— B —— A
    |         |         |         |
    C         C         C         C
    |         |         |         |
    A —— B —— A —— B —— A —— B —— A
    |         |         |         |
    C         C         C         C
    |         |         |         |
    A —— B —— A —— B —— A —— B —— A

# TODO: Infinite case (L = Inf or W = Inf)
"""
struct LiebLattice{L, W} <: AbstractCrystalLattice{2}
    sites::Vector{BasicSite{2}}

    function LiebLattice(L::Int64, W::Int64)
        sites = BasicSite{2}[]
        for l in 0:L-1, w in 0:W-1, c in 1:3
            push!(sites, BasicSite((l, w), c))
        end
        return new{L, W}(sites)
    end
end
const LiebLatt = LiebLattice

function Base.show(io::IO, latt::LiebLattice)
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

    vec_L = map(x -> 2 * x.coord[1] + (x.subcell == 2 ? 1 : 0), latt.sites)
    vec_W = map(x -> 2 * x.coord[2] + (x.subcell == 3 ? 1 : 0), latt.sites)
    x = 1.0 * vec_L
    y = 1.0 * vec_W
    fig = scatterplot(x, y)
    println(io, "  graphic:")
    println(io, fig)
end
