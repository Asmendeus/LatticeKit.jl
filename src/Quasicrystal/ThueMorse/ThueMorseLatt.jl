"""
    struct ThueMorseLattice{D, first, n, r} <: AbstractQuasicrystalLattice{D}
        sites::Vector{RealSite{D}}
    end

# Constructor
    ThueMorseLattice(first::Int64, n::Int...)
    ThueMorseLattice(first::Int64, n::NTuple{N, Int}, r::Real=Inf)
"""
struct ThueMorseLattice{D, first, n, r} <: AbstractQuasicrystalLattice{D}
    sites::Vector{RealSite{D}}

    function ThueMorseLattice(first::Int64, n::NTuple{N, Int}, r::Real=Inf) where N # Nsite = prod(2 .^ n) / 2
        @assert first in [0, 1] "`first` should be 0 or 1"
        D = length(n)
        sites = _array2latt(_ThueMorseLattice(first, n...), 0)

        coords = [map(c->c.coord[d], sites)*2 .- (2^n[d]+1) for d in 1:D]
        sites = [RealSite(Tuple(map(d->coords[d][i],1:D))) for i in 1:length(sites)]

        sites = filter(x -> sum(x.coord.^2) < r^2, sites)
        return new{D, first, n, r}(sites)
    end
    function ThueMorseLattice(first::Int64, n::Int...) # Nsite = prod(2 .^ n) / 2
        @assert first in [0, 1] "`first` should be 0 or 1"
        D = length(n)
        sites = _array2latt(_ThueMorseLattice(first, n...), 0)
        coords = [map(c->c.coord[d], sites)*2 .- (2^n[d]+1) for d in 1:D]
        sites = [RealSite(Tuple(map(d->coords[d][i],1:D))) for i in 1:length(sites)]
        return new{D, first, n, Inf}(sites)
    end
end
const ThueMorseLatt = ThueMorseLattice

get_first(::ThueMorseLatt{D, first}) where {D, first} = first
get_n(::ThueMorseLatt{D, first, n}) where {D, first, n} = n
get_r(::ThueMorseLatt{D, first, n, r}) where {D, first, n, r} = r

function Base.show(io::IO, latt::ThueMorseLattice{D}) where D
    println(io, "$(typeof(latt)):")

    print(io, "  sites: [")
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

    if D == 2
        println(io, "  graphic:")
        fig = scatterplot(map(x->x.coord[1], latt.sites), map(x->x.coord[2], latt.sites))
        println(io, fig)
    end
end

# ========== tools ==========
function _ThueMorseSequence(first::Int, n::Int) # length = 2 ^ n
    @assert n > 0
    @assert first in [0, 1]
    sequence = [first,]
    for _ in 1:n
        sequence = vcat(sequence, 1 .- sequence)
    end
    return sequence
end
function _ThueMorseLattice(first::Int, n::Int...)::Array{Int64, length(n)}
    D = length(n)
    if D == 1
        return _ThueMorseSequence(first, n[1])
    else
        ThMo = zeros(Int, 2 .^ n)
        ThMo_nolast = _ThueMorseLattice(first, n[1:end-1]...)
        ThMo[ntuple(i -> Colon(), D-1)..., 1] = ThMo_nolast
        for idx_nolast in CartesianIndices(2 .^ n[1:end-1])
            ThMo[Tuple(idx_nolast)..., :] = _ThueMorseSequence(ThMo_nolast[idx_nolast], n[end])
        end
        return ThMo
    end
end
function _array2latt(arr::Array, site_at::Int)
    latt = RealSite{ndims(arr)}[]
    for i in CartesianIndices(arr)
        if arr[i] == site_at
            push!(latt, RealSite(Tuple(i)))
        end
    end
    return latt
end
