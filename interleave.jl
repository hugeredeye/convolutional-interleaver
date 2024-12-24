# Блок сверточного перемежения

# Структура параметров
struct InterleaveParams
    data::Vector{Int}       # Входные данные
    numRegs::Int            # Число регистров
    regStep::Int            # Шаг регистра
    initVal::Int            # Начальные значения
end

# Функция сверточного перемежения
function interleave(params::InterleaveParams)
    if params.numRegs < 1 || params.regStep < 1
        error("numRegs and regStep must be positive.")
    end
    
    if params.numRegs == 1
        return params.data
    end

    n = length(params.data)
    result = fill(params.initVal, n)

    for (i, val) in enumerate(params.data)
        newIdx = i + params.numRegs * params.regStep * ((i - 1) % params.numRegs)
        if newIdx <= n
            result[newIdx] = val
        end
    end

    return result
end

# Пример использования
if abspath(PROGRAM_FILE) == @__FILE__
    testData = collect(2:25)
    regs = 3
    step = 3
    init = 2

    params = InterleaveParams(testData, regs, step, init)

    println(interleave(params))
end

using CSV
using DataFrames

# Вычисление результата
result = interleave(params)

# Создание DataFrame для сохранения
df = DataFrame(index=1:length(result), value=result)

# Экспорт результата в CSV
CSV.write("interleaved_data.csv", df)
println("Данные сохранены в interleaved_data.csv")
