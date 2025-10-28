using LatticeKit, Plots

L = W = 10
latt = SquaLatt(L, W)

nnpairs = getAllPairs(latt, 1, OBC())
nnnpairs = getAllPairs(latt, 2, OBC())

x = map(c->c.coord[1], latt.sites)
y = map(c->c.coord[2], latt.sites)

scatter(x, y,
        title="Square Lattice", label="",
        xlabel="X", xlims=(-0.5, L-0.5), xtickfont=16,
        ylabel="Y", ylims=(-0.5, L-0.5), ytickfont=16,
        marker=:circle, markersize=8, markerstrokewidth=0, markercolor=:black,
        grid=false, framestyle=:box, size=(800, 800), thickness_scaling=1)
for pair in nnpairs
    plot!(x[[pair...]], y[[pair...]], label="", linewidth=3, color=:black)
end
for pair in nnnpairs
    plot!(x[[pair...]], y[[pair...]], label="", linewidth=1.5, linestyle=:dot, alpha=0.6, color=:black)
end
savefig(joinpath(pwd(), "SquaLatt.png"))
