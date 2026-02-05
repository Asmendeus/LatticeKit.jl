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
export AbstractBoundaryCondition
export OpenBoundaryCondition, OBC
export PeriodicBoundaryCondition, PBC
export MixedBoundaryCondition, MBC
include("Boundary/BoundaryCondition.jl")

# Lattice
export AbstractLattice
include("Lattice/AbstractLattice.jl")

## Crystal
export dim, nsites, getSite, getAllSites, getAllPairs
export AbstractCrystalLattice
include("Lattice/Crystal/AbstractCrystalLattice.jl")

### 1D
export General1DLattice, G1DLatt
include("Lattice/Crystal/General1D/General1DLattice.jl")
include("Lattice/Crystal/General1D/getAllPairs.jl")

### 2D
export General2DLattice, G2DLatt
include("Lattice/Crystal/General2D/General2DLattice.jl")
include("Lattice/Crystal/General2D/getAllPairs.jl")

export SquareLattice, SquaLatt
include("Lattice/Crystal/Square/SquareLattice.jl")
include("Lattice/Crystal/Square/getAllPairs.jl")

export TriangularLattice, TriaLatt
include("Lattice/Crystal/Triangular/TriangularLattice.jl")
include("Lattice/Crystal/Triangular/getAllPairs.jl")

export HexagonalLattice, HexaLatt
include("Lattice/Crystal/Hexagonal/HexagonalLattice.jl")
include("Lattice/Crystal/Hexagonal/getAllPairs.jl")

export KagomeLattice, KagoLatt
include("Lattice/Crystal/Kagome/KagomeLattice.jl")
include("Lattice/Crystal/Kagome/getAllPairs.jl")

### 3D
export General3DLattice, G3DLatt
include("Lattice/Crystal/General3D/General3DLattice.jl")
include("Lattice/Crystal/General3D/getAllPairs.jl")

export CubicLattice, CubiLatt
include("Lattice/Crystal/Cubic/CubicLattice.jl")
include("Lattice/Crystal/Cubic/getAllPairs.jl")


## Quasicrystal
export AbstractQuasicrystalLattice
include("Lattice/Quasicrystal/AbstractQuasicrystalLattice.jl")

export ThueMorseLattice, ThueMorseLatt, get_first, get_n, get_r
include("Lattice/Quasicrystal/ThueMorse/ThueMorseLatt.jl")
include("Lattice/Quasicrystal/ThueMorse/getAllPairs.jl")

export General2DQuasicrystalLattice, G2DQLatt
include("Lattice/Quasicrystal/General2D/General2DQuasicrystal.jl")
include("Lattice/Quasicrystal/General2D/getAllPairs.jl")

end # module LatticeKit
