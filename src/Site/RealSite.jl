"""
    struct RealSite{D} <: AbstractSite{D}
        coord::NTuple{D, Real}
    end

Site type for quasicrystal lattice, using real space coordinates.
"""
struct RealSite{D} <: AbstractSite{D}
    coord::NTuple{D, Real}
end

Base.:+(site::RealSite{D}, v::NTuple{D, Real}) where D = RealSite(site.coord .+ v)
