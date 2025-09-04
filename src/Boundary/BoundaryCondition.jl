abstract type AbstractBondaryCondition end

struct OpenBoundaryCondition <: AbstractBondaryCondition end
const OBC = OpenBoundaryCondition

struct PeriodicBoundaryCondition <: AbstractBondaryCondition end
const PBC = PeriodicBoundaryCondition
