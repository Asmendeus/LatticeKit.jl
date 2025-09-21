module LatticeKit
using UnicodePlots

# Site
export AbstractSite
include("Site/AbstractSite.jl")
export BasicSite
include("Site/BasicSite.jl")
export RealSite
include("Site/RealSite.jl")


# Boundary Condition
export AbstractBondaryCondition
export OpenBoundaryCondition, OBC
export PeriodicBoundaryCondition, PBC
include("Boundary/BoundaryCondition.jl")


# Crystal
export dim, nsites, getSite, getAllSites, getAllPairs
export AbstractCrystalLattice
include("Crystal/AbstractCrystalLattice.jl")

## 1D
export General1DLattice, G1DLatt
include("Crystal/General1D/General1DLattice.jl")
include("Crystal/General1D/getAllPairs.jl")

## 2D
export General2DLattice, G2DLatt
include("Crystal/General2D/General2DLattice.jl")
include("Crystal/General2D/getAllPairs.jl")

export SquareLattice, SquaLatt
include("Crystal/Square/SquareLattice.jl")
include("Crystal/Square/getAllPairs.jl")

export TriangularLattice, TriaLatt
include("Crystal/Triangular/TriangularLattice.jl")
include("Crystal/Triangular/getAllPairs.jl")

export HexagonalLattice, HexaLatt
include("Crystal/Hexagonal/HexagonalLattice.jl")
include("Crystal/Hexagonal/getAllPairs.jl")

export KagomeLattice, KagoLatt
include("Crystal/Kagome/KagomeLattice.jl")
include("Crystal/Kagome/getAllPairs.jl")

## 3D
export General3DLattice, G3DLatt
include("Crystal/General3D/General3DLattice.jl")
include("Crystal/General3D/getAllPairs.jl")


# Quasicrystal
export AbstractQuasicrystalLattice
include("Quasicrystal/AbstractQuasicrystalLattice.jl")

export ThueMorseLattice, ThueMorseLatt
include("Quasicrystal/ThueMorse/ThueMorseLatt.jl")
include("Quasicrystal/ThueMorse/getAllPairs.jl")

export PenroseLattice, PenLatt
include("Quasicrystal/Penrose/PenLatt.jl")
include("Quasicrystal/Penrose/getAllPairs.jl")

end # module LatticeKit
