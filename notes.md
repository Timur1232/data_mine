# Лабораторная 2

## Часть 1

> [!IMPORTANT]
> Сделать к следующему занятию

> [!TODO]
> - [x] Нужно выполнить код и добавить картинки
> - [x] А также перепроверить перед сдачей

ГОТОВО

## Часть 2

> [!TODO]
> - [x] Добавить информацию

Для эксперементальных данных взять что угодно

Вроде готово

## Часть 3

> [!TODO]
> - [x] Спросить какие переменные брать

Что делать:
- матрица
- графики зависимостей
- для каждой пары построить линейную регрессию
- графики остатков

Нужно описать, что за данные я взял.
Брать для анализа столбцы с хорошей корреляцией (>0.65) - у меня есть несколько хороших

### Корреляция моих данных

> [!IMPORTANT]
> Берем корреляцию Пирсона

Пирсон:

- Electricity.from.renewables       -> Electricity.from.fossil.fuels (0.94013034)
- Value_co2_emissions_kt_by_country -> Electricity.from.fossil.fuels (0.99694881)
- Value_co2_emissions_kt_by_country -> Electricity.from.renewables   (0.957378793)
- Renewables                        -> Low.carbon.electricity        (0.80162385)

Спирмен:

- Value_co2_emissions_kt_by_country     -> Electricity.from.fossil.fuels (0.9546371)
- Primaty.energy.consumption.per.capita -> Access.to.electricity         (0.69526061)
- gdp_per_capita                        -> Access.to.electricity         (0.65039679)
- Primaty.energy.consumption.per.capita -> gdp_per_capita                (0.83107719)
- Renewables                            -> Electricity.from.renewables   (0.67045891)
- Renewables                            -> Low.carbon.electricity        (0.86170315)

## Часть 4

Множественная регрессия:

(Intercept)                           101865.90971
Access.to.electricity                  -1262.70261
Density                                    4.78829
Electricity.from.fossil.fuels           1669.57129
Electricity.from.renewables             1009.41846
Energy.imports                          -125.48778
gdp_growth                              8032.42717
gdp_per_capita                            -0.77990
Low.carbon.electricity                  1330.77786
Primary.energy.consumption.per.capita      0.01368
Renewables                             -3288.77648

> [!IMPORTANT]
> Отчет - один большой за всю работу
> с единым большим выводом

- [ ] Возможно переименовать колонки, чтобы были покороче названия и все имена
имели один формат?
