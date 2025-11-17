"""
    struct General2DQuasicrystalLattice{ns} <: AbstractQuasicrystalLattice{2}
        sites::Vector{RealSite{2}}
    end

# Constructor
    #TODO
"""
struct General2DQuasicrystalLattice <: AbstractQuasicrystalLattice{2}
    sites::Vector{RealSite{2}}
end
const G2DQLatt = General2DQuasicrystalLattice

function Base.show(io::IO, latt::General2DQuasicrystalLattice)
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

    println(io, "  graphic:")
    fig = scatterplot(map(x->x.coord[1], latt.sites), map(x->x.coord[2], latt.sites))
    println(io, fig)
end
