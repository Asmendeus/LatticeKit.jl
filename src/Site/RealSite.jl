"""
    struct RealSite{D} <: AbstractSite{D}
        coord::NTuple{D, Real}
    end

Site type for quasicrystal lattice, using real space coordinates.

# Field
- `coord::NTuple{D, Real}`: site coordinate in real space
"""
struct RealSite{D} <: AbstractSite{D}
    coord::NTuple{D, Real}
end

Base.:+(site::RealSite{D}, v::NTuple{D, Real}) where D = RealSite(site.coord .+ v)
