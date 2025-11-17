abstract type AbstractBondaryCondition end

struct OpenBoundaryCondition <: AbstractBondaryCondition end
const OBC = OpenBoundaryCondition

struct PeriodicBoundaryCondition <: AbstractBondaryCondition end
const PBC = PeriodicBoundaryCondition

struct MixedBoundaryCondition{D} <: AbstractBondaryCondition where D
    boundary::NTuple{D, Union{OBC, PBC}}

    function MixedBoundaryCondition{D}(boundary::NTuple{D, AbstractBondaryCondition}) where D
        return new{D}(convert(NTuple{D, Union{OBC, PBC}}, boundary))
    end
    function MixedBoundaryCondition(boundary::NTuple{D, AbstractBondaryCondition}) where D
        return MixedBoundaryCondition{D}(boundary)
    end
end
const MBC = MixedBoundaryCondition
