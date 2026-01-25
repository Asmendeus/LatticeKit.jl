# LatticeKit.jl

A Julia package for generating crystal and quasicrystal lattices.

`LatticeKit.jl` uses the constructor functions to generate all the sites in the lattice and stores them in order, with the index of each site being its own number, as the output interface of a range of functions.

WARNING: This package is not yet officially open, and some features may be added, removed, or modified at any time.

## Crystal Lattice

The sites in a D-dimension crystal lattice are represented in D-dimension basic vector space coordinates.

Available crystal lattice types:

```
SquareLattice(SquaLatt)
TriangularLattice(TriaLatt)
HexagonalLattice(HexaLatt)
KagomeLattice(KagoLatt)

General1DLattice(G1DLatt)
General2DLattice(G2DLatt)
General3DLattice(G3DLatt)
```

## Quasicrystal Lattice

The sites in a D-dimension quasicrystal lattice are represented in D-dimension space coordinates.

Available quasicrystal lattice types:

```
ThueMorseLattice(ThueMorseLatt)
```

## Functions

```julia
dim(latt)	# return spatial dimension of lattice
nsites(latt)	# return number of sites

getSite(latt, site)	# return the number of the site
getAllSites(latt)	# return the numbers of all sites
getAllPairs(latt, v, which_from, which_to)	# [for crystal] return the number pairs of all site pairs, where sites with sublattice `which_from` points to sites with sublattice `which_to` by vector difference `v`
getAllPairs(latt, v)	# [for quasicrystal] return the number pairs of all site pairs, whose vector difference is `v`
getAllPairs(latt, r)	# return the number pairs of all r-th nearest site pairs, e.g., `r = 1` means the nearest neighbor
```
