using CSV
using DataFrames
using Plots

# Загрузка данных из Julia
julia_data = CSV.read("interleaved_data.csv", DataFrame)

# Загрузка данных из Simulink без заголовков
simulink_data = CSV.read("simulink_data.csv", DataFrame, header=false)

# Сравнение значений
julia_values = julia_data.value
simulink_values = simulink_data[:, 1]  # Извлечение данных из первого столбца

# Проверка совпадения
if julia_values == simulink_values
    println("Результаты полностью совпадают!")
else
    println("Результаты различаются:")
    println("Julia: ", julia_values)
    println("Simulink: ", simulink_values)
end

# Построение графика
plot(julia_values, label="Julia Output", linewidth=2, color=:blue)
plot!(simulink_values, label="Simulink Output", linewidth=2, linestyle=:dash, color=:red)
savefig("comparison_plot.png")
println("График сохранен в comparison_plot.png")