abstract type AbstractBoundaryCondition end

struct OpenBoundaryCondition <: AbstractBoundaryCondition end
const OBC = OpenBoundaryCondition

struct PeriodicBoundaryCondition <: AbstractBoundaryCondition end
const PBC = PeriodicBoundaryCondition

struct MixedBoundaryCondition{D} <: AbstractBoundaryCondition where D
    boundary::NTuple{D, Union{OBC, PBC}}

    function MixedBoundaryCondition{D}(boundary::NTuple{D, AbstractBoundaryCondition}) where D
        return new{D}(convert(NTuple{D, Union{OBC, PBC}}, boundary))
    end
    function MixedBoundaryCondition(boundary::NTuple{D, AbstractBoundaryCondition}) where D
        return MixedBoundaryCondition{D}(boundary)
    end
    function MixedBoundaryCondition(boundary::AbstractBoundaryCondition...)
        return MixedBoundaryCondition{length(boundary)}(boundary)
    end
end
const MBC = MixedBoundaryCondition
