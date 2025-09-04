"""
    struct BasicSite{D} <: AbstractSite{D}
        coord::NTuple{D, Int64}
        subcell::Int64
    end

Site type for crystal lattice, using basic vector space coordinates.

# Fields
- `coord::NTuple{D, Int64}`: cell coordinate in basic vector space
- `subcell::Int64`: number of sublattice
"""
struct BasicSite{D} <: AbstractSite{D}
    coord::NTuple{D, Int64}
    subcell::Int64
end

Base.:+(site::BasicSite{D}, v::NTuple{D, Int64}) where D = BasicSite(site.coord .+ v, site.subcell)
Base.:+(site::BasicSite{D}, v::Int64) where D = BasicSite(site.coord, site.subcell + v)
Base.:(==)(site1::BasicSite{D}, site2::BasicSite{D}) where D = (site1.coord == site2.coord) && (site1.subcell == site2.subcell)
Base.mod(site::BasicSite{D}, v::NTuple{D, Int64}) where D = BasicSite(Tuple(map(d->mod(site.coord[d], v[d]), 1:D)), site.subcell)
