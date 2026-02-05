"""
    abstract type AbstractQuasicrystalLattice{D} <: AbstractLattice{D}

Wrapper type for D-dimension quasicrystal lattice in D-dimension real space coordinates.

Note each concrete subtype must have a field `sites::Vector{RealSite{D}}` to save the site coordinates.
"""
abstract type AbstractQuasicrystalLattice{D} <: AbstractLattice{D} end


"""
    dim(::AbstractQuasicrystalLattice{D})

Return spatial dimension of lattice.
"""
dim(::AbstractQuasicrystalLattice{D}) where D = D

"""
    nsites(latt::AbstractQuasicrystalLattice)

Return number of sites.
"""
nsites(latt::AbstractQuasicrystalLattice) = length(latt.sites)

"""
    getSite(latt::AbstractQuasicrystalLattice{D}, site::RealSite{D}; tol::Float64=1e-4)

Return the number of the site.
"""
getSite(latt::AbstractQuasicrystalLattice{D}, site::RealSite{D}; tol::Float64=1e-4) where D = findfirst(x -> maximum(abs.(x.coord .- site.coord)) < tol, latt.sites)

"""
    getAllSites(latt::AbstractQuasicrystalLattice)

Return the numbers of all sites.
"""
getAllSites(latt::AbstractQuasicrystalLattice) = collect(1:nsites(latt))

"""
    getAllPairs(latt::AbstractQuasicrystalLattice{D}, v::NTuple{D, Real})

Return the number pairs of all site pairs, whose vector differences are `v`.
"""
function getAllPairs(latt::AbstractQuasicrystalLattice{D}, v::NTuple{D, Real}) where D
    throw(MethodError(getAllPairs, (latt, v)))
end

"""
    getAllPairs(latt::AbstractQuasicrystalLattice, r::Int64)

Return the number pairs of all r-nearest site pairs, e.g., `r = 1` means nearest neighbor.
"""
function getAllPairs(latt::AbstractQuasicrystalLattice, r::Int64)
    throw(MethodError(getAllPairs, (latt, r)))
end
