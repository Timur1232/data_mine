#import "typst_templates/uni.typ": *
#show: uni_style
#set math.equation(numbering: none)
#show math.equation: it => {
  block(breakable: true, align(left, it))
}

#front_page(
  lab_name: [Корреляционный и регрессионный анализ данных №4],
  lab_number: 2,
  subject: DataMining,
)

= Цель

// TODO: Добавить цель

= Постановка задачи

\1. Загрузить пакет R commander (Rcmdr).

\2. Импортировать пример данных из файла Пример_Данные.xslx.

\3.

\4.

\5.

\6.

\7.

\8.

= Ход работы

После установки пакета Rcmdr и загрузки данных выполнен анализ множественной
регрессии примера данных (@ex_many_reg[рисунок]).

#V()
#figure(
  caption: [Множественная регрессия],
  image("/4/ex_many_reg.png", width: 65%),
) <ex_many_reg>
#V()

Получено уравнение множественной регрессии.

#V()
$
"индекс реального ВВП" = 5 dot "общественное развитие" \
"    "– "бедность" – 0,99 dot "безработица" – "образование" \
"    "– "ожид.продолжительность" + 0,003
$
#V()

Построен графики остатков (@ex_ost_plot[рисунок]). Как видно, графики остатков
почти идеально совпадают с регрессионными прямыми.

#V()
#figure(
  caption: [Графики остатков],
  image("/4/ex_ost_plot.png", width: 75%),
) <ex_ost_plot>
#V()

Построены пошаговые модели регрессии: вперед (шаги решения представлены в
#link(<appendix_a>)[Приложении А] на @ex_forward[рисунке], результат на
@ex_forward_result[рисунке]) и назад (шаги решения представлены в
#link(<appendix_a>)[Приложении А] на @ex_backward[рисунке], результат на
@ex_backward_result[рисунке]).

#V()
#figure(
  caption: [Результат пошаговой регрессии вперед],
  image("/4/ex_forward_result.png"),
) <ex_forward_result>
#V()
#figure(
  caption: [Результат пошаговой регрессии назад],
  image("/4/ex_backward_result.png"),
) <ex_backward_result>
#V()

Для направления вперед получено уравнение:

#V()
$
"индекс реального ВВП" = 5 dot "общественное развитие" \
"    "– "бедность" – 0,99 dot "безработица" – "образование" \
"    "– "ожид.продолжительность" + 0,003
$
#V()

Для направления назад получено:

#V()
$
"индекс реального ВВП" = 5 dot "общественное развитие" \
"    "– "бедность" – 0,99 dot "безработица" – "образование" \
"    "– "ожид.продолжительность" + 0,003
$
#V()

Как видно, оба уравнения совпадают. При этом для направления назад было сделано
меньше шагов, чем для направления вперед. Уравнения пошаговой модели также
совпадают с предыдущим уравнением множественной регрессии.

На @ex_vif[рисунке] представлены коэффициенты VIF. По ним можно сделать вывод
об отсутствии мультиколеальности в построенной модели.

#V()
#figure(
  caption: [VIF коэффициенты],
  image("/4/ex_vif.png"),
) <ex_vif>
#V()

// =================[Мои данные]================= //

Далее загружены эксперементальные данные, описанные в прошлой части
лабораторной работы. Выполнен анализ множественной регрессии
(@my_many_reg[рисунок]).

#V()
#figure(
  caption: [Множественная регрессия],
  image("/4/my_many_reg.png", width: 80%),
) <my_many_reg>
#V()

Получено уравнение множественной регрессии с зависимой переменной
"Value_co2_emissions_kt_by_country" (выбросы CO2 в килотоннах).

#V()
$
"Value_co2_emissions_kt_by_country" = \
"    "- 1262.70261 dot "Access.to.electricity" + 4.78829 dot "Density" \
"    "+ 1669.57129 dot "Electricity.from.fossil.fuels" \
"    "+ 1009.41846 dot "Electricity.from.renewables" \
"    "- 125.48778 dot "Energy.imports" + 8032.42717 dot "gdp_growth" \
"    "- 0.77990 dot "gdp_per_capita" + 1330.77786 dot "Low.carbon.electricity" \
"    "+ 0.01368 dot "Primary.energy.consumption.per.capita" \
"    "- 3288.77648 dot "Renewables" + 101865.90971
$
#V()

Построены графики остатков (@my_ost_plot[рисунок]).
Как видно на графиках, наиболее близко регрессионные прямые совпадают с
остатками в связях:

- Value_co2_emissions_kt_by_country -> Electricity.from.fossil.fuels (график 3);
- Value_co2_emissions_kt_by_country -> Electricity.from.renewables (график 4).

Эти же связи были выявлены в корреляциооном анализе в прошлой части. Остальные
графики остатков достаточно сильно отклоняются от регрессионных прямых и имею
очень разбросанные данные.

#V()
#figure(
  caption: [Графики остатков],
  image("/4/my_ost_plot.png", width: 80%),
) <my_ost_plot>
#V()

Построены пошаговые модели регрессии: вперед (шаги решения представлены в
#link(<appendix_a>)[Приложении А] на @my_forward[рисунке], результат на
@my_forward_result[рисунке]) и назад (шаги решения представлены в
#link(<appendix_a>)[Приложении А] на @my_backward[рисунке], результат на
@my_backward_result[рисунке]).

#V()
#figure(
  caption: [Результат пошаговой регрессии вперед],
  image("/4/my_forward_result.png"),
) <my_forward_result>
#V()
#figure(
  caption: [Результат пошаговой регрессии назад],
  image("/4/my_backward_result.png"),
) <my_backward_result>
#V()

Для направления вперед получено уравнение:

#V()
$
"Value_co2_emissions_kt_by_country" = \
"    "+ 1646 dot "Electricity.from.fossil.fuels" \
"    "+ 1062 dot "Electricity.from.renewables" \
"    "+ 9371 dot "gdp_growth" - 1504 dot "Renewables" \
"    "- 16088
$
#V()

Для направления назад получено:

#V()
$
"Value_co2_emissions_kt_by_country" = \
"    "+ 1667.7389 dot "Electricity.from.fossil.fuels" \
"    "+ 1012.6262 dot "Electricity.from.renewables" \
"    "- 109.9732 dot "Energy.imports" + 7783.5695 dot "gdp_growth" \
"    "- 0.7471 dot "gdp_per_capita" + 1223.3014 dot "Low.carbon.electricity" \
"    "+ 0.01368 dot "Primary.energy.consumption.per.capita" \
"    "- 3225.7494 dot "Renewables" - 17762.7416
$
#V()

Как видно, оба уравнения не совпадают совпадают. Уравнение с направление назад
похоже на уравнение множественной регрессии по коэффициентам, но не достает
переменных "Access.to.electricity" и "Density".

На @my_vif[рисунке] представлены коэффициенты VIF. По ним можно сделать вывод о
наличии мультиколеальности в построенной модели, так как присутствуют большие
значения коэффициента (>10).

#V()
#figure(
  caption: [VIF коэффициенты],
  image("/4/my_vif.png"),
) <my_vif>
#V()

= Вывод


#pagebreak()
#appendix_head() <appendix_a>

#figure(
  caption: [Ход решения пошаговой регрессии вперед для примера данных],
  image("/4/ex_forward.png", width: 100%),
) <ex_forward>
#V()
#figure(
  caption: [Ход решения пошаговой регрессии назад для примера данных],
  image("/4/ex_backward_1.png", width: 100%),
) <ex_backward>
#V()
#figure(
  caption: [Ход решения пошаговой регрессии вперед для эксперементальных данных],
  image("/4/my_forward.png", width: 100%),
) <my_forward>
#V()
#figure(
  caption: [Ход решения пошаговой регрессии назад для эксперементальных данных],
  image("/4/my_backward.png", width: 100%),
) <my_backward>
#V()
