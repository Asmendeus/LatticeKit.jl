"""
    struct General2DLattice{L, W, C} <: AbstractCrystalLattice{2}
        sites::Vector{BasicSite{2}}
    end

# Constructor
    General2DLattice(L::Int64, W::Int64, C::Int64)

# TODO: Infinite case (L = Inf or W = Inf)
"""
struct General2DLattice{L, W, C} <: AbstractCrystalLattice{2}
    sites::Vector{BasicSite{2}}

    function General2DLattice(L::Int64, W::Int64, C::Int64)
        sites = BasicSite{2}[]
        for l in 0:L-1, w in 0:W-1, c in 1:C
            push!(sites, BasicSite((l, w), c))
        end
        return new{L, W, C}(sites)
    end
end
const G2DLatt = General2DLattice

Base.size(latt::General2DLattice{L, W}) where {L, W} = (L, W)

function Base.show(io::IO, latt::General2DLattice)
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
end
