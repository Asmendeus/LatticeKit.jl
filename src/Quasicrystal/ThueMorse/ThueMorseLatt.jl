"""
    struct ThueMorseLattice{D, n} <: AbstractQuasicrystalLattice{D}
        sites::Vector{RealSite{D}}
    end

# Constructor
    ThueMorseLattice(first::Int64, n::Int...)
"""
struct ThueMorseLattice{D, n} <: AbstractQuasicrystalLattice{D}
    sites::Vector{RealSite{D}}

    function ThueMorseLattice(first::Int64, n::Int...) # Nsite = prod(2 .^ n) / 2
        @assert first in [0, 1] "`first` should be 0 or 1"
        return new{length(n), n}(_array2latt(_ThueMorseLattice(first, n...), 0))
    end
end
const ThueMorseLatt = ThueMorseLattice

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
