using ITensors, ITensorMPS, LinearAlgebra.BLAS
using LatticeKit
using JLD2
BLAS.set_num_threads(1)

L = 16
W = 2
latt = SquaLatt(L, W)

sites = siteinds("tJ", nsites(latt); conserve_qns = true)

t = 1

os = OpSum()
for pair in getAllPairs(latt, 1, OBC())
    os -= t, "Cdagup", pair[1], "Cup", pair[2]
    os -= t, "Cdagup", pair[2], "Cup", pair[1]
    os -= t, "Cdagdn", pair[1], "Cdn", pair[2]
    os -= t, "Cdagdn", pair[2], "Cdn", pair[1]
end
H = MPO(os,sites)

state = ["0", "↑", "↓", "0",
         "0", "↑", "↓", "0",
         "0", "↑", "↓", "0",
         "0", "↑", "↑", "0",
         "0", "↑", "↑", "0",
         "0", "↑", "↑", "0",
         "0", "↑", "↑", "0",
         "0", "↑", "↑", "0"]
psi0 = random_mps(sites, state; linkdims=20)

nsweeps = 20
maxdim = [4000]
cutoff = [1E-8]

energy,psi = dmrg(H, psi0; nsweeps, maxdim, cutoff)
