"""
    abstract type AbstractCrystalLattice{D}

Wrapper type for D-dimension crystal lattice in D-dimension basic vector space coordinates.

Note each concrete subtype must have a field `sites::Vector{BasicSite{D}}` to save the cell locations and subcells of sites.
"""
abstract type AbstractCrystalLattice{D} end


"""
    dim(::AbstractCrystalLattice{D})

Return spatial dimension of lattice.
"""
dim(::AbstractCrystalLattice{D}) where D = D

"""
    nsites(latt::AbstractCrystalLattice)

Return number of sites.
"""
nsites(latt::AbstractCrystalLattice) = length(latt.sites)

"""
    getSite(latt::AbstractCrystalLattice{D}, site::BasicSite{D})

Return the number of the site
"""
getSite(latt::AbstractCrystalLattice{D}, site::BasicSite{D}) where D = findfirst(x -> x == site, latt.sites)

"""
    getAllSites(latt::AbstractCrystalLattice)

Return the numbers of all sites
"""
getAllSites(latt::AbstractCrystalLattice) = collect(1:nsites(latt))

"""
    getAllPairs(latt::AbstractCrystalLattice, v::NTuple{D, Int64}, which_from::Int64, which_to::Int64, boundary::AbstractBondaryCondition=PBC())

Return the number pairs of all site pairs, whose vector differences are `v`.
"""
function getAllPairs(latt::AbstractCrystalLattice{D}, v::NTuple{D, Int64}, which_from::Int64, which_to::Int64, boundary::AbstractBondaryCondition=PBC()) where D
    throw(MethodError(getAllPairs, (latt, v, which_from, which_to, boundary)))
end

"""
    getAllPairs(latt::AbstractCrystalLattice, r::Int64, boundary::AbstractBondaryCondition=PBC())

Return the number pairs of all r-nearest site pairs, e.g., `r = 1` means nearest neighbor.
"""
function getAllPairs(latt::AbstractCrystalLattice, r::Int64, boundary::AbstractBondaryCondition=PBC())
    throw(MethodError(getAllPairs, (latt, r, boundary)))
end
