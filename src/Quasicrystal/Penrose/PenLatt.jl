"""
    struct PenroseLattice{ns} <: AbstractQuasicrystalLattice{2}
        sites::Vector{RealSite{2}}
    end

Prismatic paved (P3) Penrose quasi-crystal.

# Constructor
    #TODO
"""
struct PenroseLattice <: AbstractQuasicrystalLattice{2}
    sites::Vector{RealSite{2}}
end
const PenLatt = PenroseLattice

function Base.show(io::IO, latt::PenroseLattice)
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

    println(io, "  graphic:")
    fig = scatterplot(map(x->x.coord[1], latt.sites), map(x->x.coord[2], latt.sites))
    println(io, fig)
end

# ========== tools ==========
