# Сверточный перемежитель на Julia

## Описание
Этот проект реализует тестовое задание компании КПМ Ритм на языке Julia. Он представляет собой сверточный перемежитель, который соответствует блоку **Convolutional Interleaver** в Simulink. Реализация позволяет перемежать данные на основе заданных параметров, таких как число регистров, шаг между регистрами и начальные значения.

## Структура репозитория
- **`interleave.jl`**: Основной файл с реализацией сверточного перемежителя.
- **`test.jl`**: Тесты для проверки корректности реализации.
- **`comparison`**: Инструкции и скрипты для сравнения с результатами Simulink.
- **`README.md`**: Описание проекта и инструкции по использованию.

## Установка
1. Убедитесь, что у вас установлена Julia.
2. Склонируйте репозиторий:
   ```bash
   git clone https://github.com/hugeredeye/convolutional-interleaver.git
   cd convolutional-interleaver
   ```

## Использование
1. Откройте файл `interleave.jl` и настройте параметры перемежения.
2. Запустите скрипт:
   ```bash
   julia interleave.jl
   ```
3. Для запуска тестов выполните:
   ```bash
   julia tests.jl
   ```

## Параметры
- **`data`**: Входной массив данных (например, `[1, 2, 3, ..., 20]`).
- **`numRegs`**: Число регистров (например, `3`).
- **`regStep`**: Шаг между регистрами (например, `2`).
- **`initVal`**: Начальное значение для незаполненных элементов (например, `0`).

## Сравнение с Simulink
### Настройка Simulink
1. Создайте модель Simulink с использованием блока **Convolutional Interleaver**.
2. Задайте параметры:
   - **Number of Registers**: 3
   - **Register Length Step**: 2
   - **Initial Conditions**: 0
3. Используйте источник данных, например, массив `[1, 2, 3, ..., 20]`.
4. Сохраните результаты выполнения блока в переменную MATLAB.

### Код для Julia
```julia
using CSV

# Входные параметры
data = collect(1:20)
numRegs = 3
regStep = 2
initVal = 0

params = InterleaveParams(data, numRegs, regStep, initVal)
julia_result = interleave(params)

# Сохранение результата для сравнения
CSV.write("julia_result.csv", DataFrame(julia_result = julia_result))
println("Результат сохранен в julia_result.csv")
```

### Код для MATLAB
```matlab
% Импорт результата из Julia
julia_result = csvread('julia_result.csv');

% Ваш результат из Simulink
simulink_result = [1, 0, 0, 2, 0, 0, 3, 0, 0, 4, ...]; % Пример данных, заменить на реальный вывод Simulink

% Сравнение
if isequal(julia_result, simulink_result)
    disp('Результаты совпадают!');
else
    disp('Результаты не совпадают.');
    disp('Результат Julia:');
    disp(julia_result);
    disp('Результат Simulink:');
    disp(simulink_result);
end
```

### Результаты
1. **Совпадение**: Если результаты одинаковы, вывод подтвердит, что реализация корректна.
2. **Различия**: Если результаты различаются, проверьте параметры или обратитесь к документации.

## Контакты
- **Байбакова Екатерина Алексеевна**
- Email: eabaibakova@edu.hse.ru
- Telegram: @smallbluenose
- Phone number: +7(996)929-57-33

