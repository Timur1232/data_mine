# Лабораторная 2

## Часть 1

> [!IMPORTANT]
> Сделать к следующему занятию

> [!TODO]
> - Нужно выполнить код и добавить картинки
> - А также перепроверить перед сдачей

## Часть 2

> [!IMPORTANT]
> Добавить информацию

Для эксперементальных данных взять что угодно

Вроде готово

## Часть 3

> [!TODO]
> - Спросить какие переменные брать

Что делать:
- матрица
- графики зависимостей
- для каждой пары построить линейную регрессию
- графики остатков

Нужно описать, что за данные я взял.
Брать для анализа столбцы с хорошей корреляцией (>0.65) - у меня есть несколько хороших

### Корреляция моих данных

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
