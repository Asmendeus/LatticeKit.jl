using Test, LatticeKit

@testset "Square Lattice" begin
    latt = SquaLatt(4, 4)

    @test dim(latt) == 2
    @test nsites(latt) == 16

    @test length(getAllSites(latt)) == 16

    @test length(getAllPairs(latt, 1, PBC())) == 32
    @test length(getAllPairs(latt, 2, PBC())) == 32
    @test length(getAllPairs(latt, 3, PBC())) == 32

    @test length(getAllPairs(latt, 1, OBC())) == 24
    @test length(getAllPairs(latt, 2, OBC())) == 18
    @test length(getAllPairs(latt, 3, OBC())) == 16

    @test all(x -> x in getAllPairs(latt, 1, PBC()), getAllPairs(latt, 1, OBC()))
    @test all(x -> x in getAllPairs(latt, 2, PBC()), getAllPairs(latt, 2, OBC()))
    @test all(x -> x in getAllPairs(latt, 3, PBC()), getAllPairs(latt, 3, OBC()))

    @test Set(getAllPairs(SquaLatt(2, 2), 1, OBC())) == Set([(1, 2), (1, 3), (2, 4), (3, 4)])
    @test Set(getAllPairs(SquaLatt(2, 2), 2, OBC())) == Set([(1, 4), (2, 3)])
    @test Set(getAllPairs(SquaLatt(3, 3), 3, OBC())) == Set([(1, 3), (4, 6), (7, 9), (1, 7), (2, 8), (3, 9)])
end

@testset "Triangular Lattice" begin
    latt = TriaLatt(4, 4)

    @test dim(latt) == 2
    @test nsites(latt) == 16

    @test length(getAllSites(latt)) == 16

    @test length(getAllPairs(latt, 1, PBC())) == 48
    @test length(getAllPairs(latt, 2, PBC())) == 48
    @test length(getAllPairs(latt, 3, PBC())) == 48

    @test length(getAllPairs(latt, 1, OBC())) == 33
    @test length(getAllPairs(latt, 2, OBC())) == 21
    @test length(getAllPairs(latt, 3, OBC())) == 20

    @test all(x -> x in getAllPairs(latt, 1, PBC()), getAllPairs(latt, 1, OBC()))
    @test all(x -> x in getAllPairs(latt, 2, PBC()), getAllPairs(latt, 2, OBC()))
    @test all(x -> x in getAllPairs(latt, 3, PBC()), getAllPairs(latt, 3, OBC()))

    @test Set(getAllPairs(TriaLatt(2, 2), 1, OBC())) == Set([(1, 2), (3, 4), (1, 3), (2, 4), (3, 2)])
    @test Set(getAllPairs(TriaLatt(2, 2), 2, OBC())) == Set([(1, 4), ])
    @test Set(getAllPairs(TriaLatt(3, 3), 3, OBC())) == Set([(1, 3), (4, 6), (7, 9), (1, 7), (2, 8), (3, 9), (7, 3)])
end

@testset "Hexagonal Lattice" begin
    latt = HexaLatt(4, 4)

    @test dim(latt) == 2
    @test nsites(latt) == 32

    @test length(getAllSites(latt)) == 32

    @test length(getAllPairs(latt, 1, PBC())) == 48
    @test length(getAllPairs(latt, 2, PBC())) == 96
    @test length(getAllPairs(latt, 3, PBC())) == 48

    @test length(getAllPairs(latt, 1, OBC())) == 37
    @test length(getAllPairs(latt, 2, OBC())) == 66
    @test length(getAllPairs(latt, 3, OBC())) == 30

    @test all(x -> x in getAllPairs(latt, 1, PBC()), getAllPairs(latt, 1, OBC()))
    @test all(x -> x in getAllPairs(latt, 2, PBC()), getAllPairs(latt, 2, OBC()))
    @test all(x -> x in getAllPairs(latt, 3, PBC()), getAllPairs(latt, 3, OBC()))

    @test Set(getAllPairs(HexaLatt(2, 2), 1, OBC())) == Set([(1, 2), (3, 2), (3, 4), (5, 6), (7, 6), (7, 8), (3, 6)])
    @test Set(getAllPairs(HexaLatt(2, 2), 2, OBC())) == Set([(1, 5), (2, 6), (3, 7), (4, 8), (1, 3), (2, 4), (5, 7), (6, 8), (5, 3), (6, 4)])
    @test Set(getAllPairs(HexaLatt(2, 2), 3, OBC())) == Set([(1, 6), (3, 8), (5, 2), (7, 4)])
end

@testset "Kagome Lattice" begin
    latt = KagoLatt(4, 4)

    @test dim(latt) == 2
    @test nsites(latt) == 48

    @test length(getAllSites(latt)) == 48

    @test length(getAllPairs(latt, 1, PBC())) == 96
    @test length(getAllPairs(latt, 2, PBC())) == 96
    @test length(getAllPairs(latt, 3, PBC())) == 144

    @test length(getAllPairs(latt, 1, OBC())) == 81
    @test length(getAllPairs(latt, 2, OBC())) == 66
    @test length(getAllPairs(latt, 3, OBC())) == 99

    @test all(x -> x in getAllPairs(latt, 1, PBC()), getAllPairs(latt, 1, OBC()))
    @test all(x -> x in getAllPairs(latt, 2, PBC()), getAllPairs(latt, 2, OBC()))
    @test all(x -> x in getAllPairs(latt, 3, PBC()), getAllPairs(latt, 3, OBC()))

    @test Set(getAllPairs(KagoLatt(2, 1), 1, OBC())) == Set([(1, 2), (1, 3), (2, 3), (4, 5), (5, 6), (4, 6), (3, 4)])
    @test Set(getAllPairs(KagoLatt(2, 1), 2, OBC())) == Set([(4, 2), (3, 5)])
    @test Set(getAllPairs(KagoLatt(2, 1), 3, OBC())) == Set([(1, 4), (2, 5), (3, 6)])
end

@testset "2D Thue-Morse Lattice" begin
    latt = ThueMorseLatt(1, 2, 2)

    @test dim(latt) == 2
    @test nsites(latt) == 8

    @test length(getAllSites(latt)) == 8
    @test length(getAllPairs(latt, 1)) == 4
    @test length(getAllPairs(latt, 2)) == 4
end
