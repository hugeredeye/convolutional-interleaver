using CSV
using DataFrames
using Plots

using Test
include("interleave.jl")

# Тесты для функции сверточного перемежения
@testset "Interleaver Tests" begin
    testData = collect(2:25)
    regs = 3
    step = 3
    init = 2
    params = InterleaveParams(testData, regs, step, init)

    expected_output = [2, 2, 2, 5, 2, 2, 8, 2, 2, 11, 3, 2, 14, 6, 2, 17, 9, 2, 20, 12, 4, 23, 15, 7]
    @test interleave(params) == expected_output
end
