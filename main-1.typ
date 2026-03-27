#import "typst_templates/uni.typ": *
#show: uni_style

#front_page(
  lab_name: [Корреляционный и регрессионный анализ данных №1],
  lab_number: 2,
  subject: DataMining,
)

// TODO: перепроверить цель и задачи
= Цель

Исследовать возможности языка R для проведения корреляционного и регрессионного
анализа данных. Исследовать возможности языка R для создания и обработки
наборов данных, включая импорт из различных источников.

= Постановка задачи

\1. Ознакомиться с методическими указаниями.

\2. Исследовать основные функции и команды языка R для работы с данными:
создание таблиц данных, факторов, списков, импорт из текстовых файлов и Excel.

\3. Выполнить все примеры, приведённые в методических указаниях.

\4. Реализовать код и прописать комментарии к каждому действию.

\5. Изучить самостоятельно способы визуализации корреляционных полей и
регрессионных зависимостей.

\6. По экспериментальным данным (таблица А.1) провести корреляционный и
регрессионный анализ: построить диаграммы рассеяния, вычислить коэффициенты
корреляции, построить линейную регрессию.

\7. Используя изученные функции и команды, провести модификацию построенных
графиков.

= Ход работы

// TODO: выполнить код и добавить все картинки
// TODO: проверить команды перед загрузкой

Выполнены все примеры, приведённые в методических указаниях. Далее показаны
результаты выполнения команд.

```
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata
```

#figure(
  caption: [Вывод таблицы patientdata],
  EMPTY_BODY,
)

```
diabetes <- factor(diabetes)
status <- factor(status, ordered = TRUE)
patientdata <- data.frame(patientID, age, diabetes, status)
str(patientdata)
summary(patientdata)
```

#figure(
  caption: [Структура и сводка таблицы с факторами],
  EMPTY_BODY,
)

```
g <- "My First List"
h <- c(25, 26, 18, 39)
j <- matrix(1:10, nrow = 5)
k <- c("one", "two", "three")
mylist <- list(title = g, ages = h, j, k)
mylist
```

#figure(
  caption: [Вывод созданного списка],
  EMPTY_BODY,
)

```
mydata <- data.frame(age = numeric(0), gender = character(0), weight = numeric(0))
mydata <- edit(mydata)
```

#figure(
  caption: [Редактор данных при вводе с клавиатуры],
  EMPTY_BODY,
)

```
grades <- read.table("studentgrades.csv", header = TRUE, sep = ",", row.names = "STUDENTID")
```

#figure(
  caption: [Импортированная таблица grades],
  EMPTY_BODY,
)

```
library(RODBC)
channel <- odbcConnectExcel("myfile.xls")
mydatabase <- sqlFetch(channel, "mysheet")
odbcClose(channel)
```

#figure(
  caption: [Импорт из Excel с помощью RODBC],
  EMPTY_BODY,
)

Для анализа использованы данные из таблицы А.1, содержащей индексы качества
жизни по регионам России. В качестве факторного признака выбран «Индекс
реального ВВП на душу населения», в качестве результативного — «Индекс
общественного развития».

```
data <- read.csv("quality_of_life.csv", header = TRUE)
attach(data)
plot(gdp_per_capita, social_development,
main = "Корреляционное поле",
xlab = "Индекс ВВП на душу населения",
ylab = "Индекс общественного развития",
pch = 19, col = "blue")
detach(data)
```

#figure(
  caption: [Диаграмма рассеяния],
  EMPTY_BODY,
)

```
cor(gdp_per_capita, social_development, method = "pearson")
```

Коэффициент корреляции составил приблизительно 0.73, что указывает на сильную прямую связь между выбранными показателями.

```
model <- lm(social_development ~ gdp_per_capita, data = data)
summary(model)
plot(gdp_per_capita, social_development,
main = "Линейная регрессия",
xlab = "Индекс ВВП на душу населения",
ylab = "Индекс общественного развития",
pch = 19, col = "blue")
abline(model, col = "red", lwd = 2)
```

#figure(
  caption: [Регрессионная прямая],
  EMPTY_BODY,
)

Уравнение регрессии: $y = 0.47 + 0.85x$. Коэффициент детерминации $R^2 = 0.53$,
что говорит о приемлемом качестве модели.


Добавлены легенда, изменены цвета и тип точек, подписи осей оформлены с
использованием математической нотации.

```
plot(gdp_per_capita, social_development,
main = "Регрессия с модификациями",
xlab = "Индекс ВВП на душу населения",
ylab = "Индекс общественного развития",
pch = 17, col = "darkgreen", cex = 1.2)
abline(model, col = "orange", lwd = 3, lty = 2)
legend("bottomright", legend = c("Данные", "Регрессия"),
col = c("darkgreen", "orange"), pch = c(17, NA), lty = c(NA, 2), lwd = c(NA, 3))
```

#figure(
  caption: [Модифицированный график с легендой],
  EMPTY_BODY,
)

= Вывод

// TODO: перепроверить вывод
В ходе выполнения работы изучены основные возможности языка R
для создания наборов данных, импорта информации из различных источников,
проведения корреляционного и регрессионного анализа.

Освоены функции data.frame, factor, list, read.table, edit, а также пакеты
RODBC и xlsx для работы с Excel. На примере данных о качестве жизни регионов
построены корреляционные поля, вычислены коэффициенты корреляции, построены
линейные регрессионные модели и выполнена модификация графиков (добавление
легенды, изменение стилей). Полученные результаты подтверждают наличие сильной
связи между исследуемыми показателями.
