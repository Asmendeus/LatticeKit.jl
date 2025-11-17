"""
    struct General1DLattice{L, C} <: AbstractCrystalLattice{1}
        sites::Vector{BasicSite{1}}
    end

# Constructor
    General1DLattice(L::Int64, C::Int64)

# TODO: Infinite case (L = Inf)
"""
struct General1DLattice{L, C} <: AbstractCrystalLattice{1}
    sites::Vector{BasicSite{1}}

    function General1DLattice(L::Int64, C::Int64)
        sites = BasicSite{1}[]
        for l in 0:L-1, c in 1:C
            push!(sites, BasicSite((l,), c))
        end
        return new{L, C}(sites)
    end
end
const G1DLatt = General1DLattice

Base.size(latt::General1DLattice{L}) where L = (L,)

function Base.show(io::IO, latt::General1DLattice)
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
