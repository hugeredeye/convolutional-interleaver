using Test
include("interleave.jl")  # Подключаем файл с функцией и структурой

# Подготовка тестов для функции interleave
@testset "Interleave Tests" begin
    # Тестовые данные
    testData = collect(2:25)
    regs = 3
    step = 3
    init = 2

    # Создаем параметры
    params = InterleaveParams(testData, regs, step, init)

    # Ожидаемый результат
    expected_output = [2, 2, 2, 5, 2, 2, 8, 2, 2, 11, 3, 2, 14, 6, 2, 17, 9, 2, 20, 12, 4, 23, 15, 7]

    # Проверяем правильность работы функции
    @test interleave(params) == expected_output
end
