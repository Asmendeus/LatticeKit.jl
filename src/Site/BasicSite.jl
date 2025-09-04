"""
    struct BasicSite{D} <: AbstractSite{D}
        cell::NTuple{D, Int64}
        subcell::Int64
    end

Site type for crystal lattice, using basic vector space coordinates.
"""
struct BasicSite{D} <: AbstractSite{D}
    cell::NTuple{D, Int64}
    subcell::Int64
end

Base.:+(site::BasicSite{D}, v::NTuple{D, Int64}) where D = BasicSite(site.cell .+ v, site.subcell)
Base.:+(site::BasicSite{D}, v::Int64) where D = BasicSite(site.cell, site.subcell + v)
Base.:(==)(site1::BasicSite{D}, site2::BasicSite{D}) where D = (site1.cell == site2.cell) && (site1.subcell == site2.subcell)
Base.mod(site::BasicSite{D}, v::NTuple{D, Int64}) where D = BasicSite(Tuple(map(d->mod(site.cell[d], v[d]), 1:D)), site.subcell)
