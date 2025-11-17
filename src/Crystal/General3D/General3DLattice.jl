"""
    struct General3DLattice{L, W, H, C} <: AbstractCrystalLattice{3}
        sites::Vector{BasicSite{3}}
    end

# Constructor
    General3DLattice(L::Int64, W::Int64, H::Int64, C::Int64)

# TODO: Infinite case (L = Inf or W = Inf or H = Inf)
"""
struct General3DLattice{L, W, H, C} <: AbstractCrystalLattice{3}
    sites::Vector{BasicSite{3}}

    function General3DLattice(L::Int64, W::Int64, H::Int64, C::Int64)
        sites = BasicSite{3}[]
        for l in 0:L-1, w in 0:W-1, h in 0:H-1, c in 1:C
            push!(sites, BasicSite((l, w, h), c))
        end
        return new{L, W, H, C}(sites)
    end
end
const G3DLatt = General3DLattice

Base.size(latt::General3DLattice{L, W, H}) where {L, W, H} = (L, W, H)

function Base.show(io::IO, latt::General3DLattice)
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
end
