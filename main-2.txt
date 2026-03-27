#import "typst_templates/uni.typ": *
#show: uni_style

#front_page(
  lab_name: [Корреляционный и регрессионный анализ данных №2],
  lab_number: 2,
  subject: DataMining,
)

= Цель

Исследовать возможности языка R для проведения корреляционного и регрессионного
анализа данных. Исследовать возможности языка R для создания и изменения вида
диаграмм

= Постановка задачи

\1. Ознакомится с методическими указаниями.

\2. Исследовать основные функции и команды языка R, представленные в данной
лабораторной работе.

\3. Выполнить все примеры.

\4. Реализовать код и прописать комментарии к каждому действию.

\5. Изучить самостоятельно добавление Легенды к диаграмме.

\6. По экспериментальным данным провести построение 3 - 4 различных диаграмм.

\7. Используя изученные функции и команды провести модификацию построенных
графиков.

= Ход работы

Выполнены все примеры приведенные в методических указаниях. Код на R находится
в #link(<appendixA>)[Приложении А]. Далее показаны результаты выполнения команд
отрисовки графиков.

#let examples = ()
#for i in range(0, 11) {
  examples.push("/2/example_" + str(i) + ".png")
}

Выполнение кода поиска регрессии для данных mtcars (@mtcars[рисунок]).

```
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg ~ wt))
title("Regression of MPG on Weight")
detach(mtcars)
```

#V()
#figure(
  caption: [Пример поиска регрессии на наборе mtcars],
  image(examples.at(0), width: 60%),
) <mtcars>
#V()

Выполнение кода отрисовки графиков типа "b" (линии и точки) (@lines[рисунок]):
сплошные линии и круги, пунктир и треугольники и жирный пунктир и квадраты.

```
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

plot(dose, drugA, type = "b")
```

#figure(
  caption: [Пример графика линии и точки],
  supplement: none,
  kind: image,
  grid(
    columns: 3,
    stroke: none,
    image(examples.at(1)),
    image(examples.at(2)),
    image(examples.at(3)),
  )
) <lines>
#V()

Выполнение кода отрисовки круговых диаграмм (@pie[рисунок]): с цветом и без цвета.

```
opar <- par(no.readonly = TRUE)
par(lty = 2, pch = 17)
plot(dose, drugA, type = "b")
par(opar)
```

#figure(
  caption: [Пример круговых диаграмм с цветом и без цвета],
  supplement: none,
  kind: image,
  grid(
    columns: 2,
    stroke: none,
    image(examples.at(4)),
    image(examples.at(5)),
  )
) <pie>
#V()

Выполнение кода добавления текста (@text[рисунок]).

```
plot(dose, drugA, type = "b", lty = 3, lwd = 3, pch = 15, cex = 2)
```

#V()
#figure(
  caption: [Пример добавления текста],
  image(examples.at(6), width: 60%),
) <text>
#V()

Выполнение кода отрисовки графика уменьшенного размера (@smol[рисунок]).

```
n <- 10
mycolors <- rainbow(n)
pie(rep(1, n), labels = mycolors, col = mycolors)
mygrays <- gray(0:n/n)
pie(rep(1, n), labels = mygrays, col = mygrays)
```
#figure(
  caption: [Пример отрисовки графика уменьшенного размера],
  image(examples.at(7), width: 40%),
) <smol>
#V()

Выполнение кода изменения текста (@text_form[рисунок]): с цветом и без цвета.

```
opar <- par(no.readonly = TRUE)
par(font.lab = 3, cex.lab = 1.5, font.main = 4, cex.main = 2)
plot(dose, drugA, type = "b", main = "Пример текста", xlab = "Доза", ylab = "Реакция")
par(opar)
```

#figure(
  caption: [Пример текста с цветом и без цвета],
  supplement: none,
  kind: image,
  grid(
    columns: 2,
    stroke: none,
    image(examples.at(8)),
    image(examples.at(9)),
  )
) <text_form>
#V()

Выполнение кода добавления легенды (@legend[рисунок]).

```
opar <- par(no.readonly=TRUE)
par(pin=c(2, 3))
par(lwd=2, cex=1.5)
par(cex.axis=.75, font.axis=3)
plot(dose, drugA, type="b", pch=19, lty=2, col="red")
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")
par(opar)
```

#V()
#figure(
  caption: [Пример добавления легенды],
  image(examples.at(10), width: 55%),
) <legend>
#V()

В качестве экспериментальных данных взяты простые функции: $y = x^2$, $y = e^x$ и $y = sin(x)$.
По ним построены графики на @experimental_data[рисунке].

```
# Генерация данных для функций
x <- seq(0.1, 10, by = 1)
y_square <- x^2
y_exp <- exp(x)
x_sin <- seq(0, 2*pi, length.out = 10)
y_sin <- sin(x_sin)

png("x2.png")
plot(x, y_square, type = "b", pch = 16, col = "blue", lty = 1,
     main = "y = x^2",
     xlab = "x", ylab = "y")
dev.off()

png("exp.png")
plot(x, y_exp, type = "l", lwd = 2, col = "red",
     main = "y = exp(x)",
     xlab = "x", ylab = "y")
points(x, y_exp, pch = 19, col = "red", cex = 0.5)
dev.off()

png("sin.png")
plot(x_sin, y_sin, type = "l", lty = 1, col = "darkgreen", lwd = 2,
     main = "y = sin(x)",
     sub = "x от 0 до 2π",
     xlab = "x (радианы)", ylab = "sin(x)",
     xaxt = "n")
axis(1, at = c(0, pi/2, pi, 3*pi/2, 2*pi),
     labels = c("0", "π/2", "π", "3π/2", "2π"))
dev.off()
```

#V()
#figure(
  caption: [График функции $x^2$, $e^x$ и $sin(x)$],
  supplement: none,
  kind: image,
  grid(
    columns: 3,
    stroke: none,
    image("/2/x2.png"),
    image("/2/exp.png"),
    image("/2/sin.png"),
  )
) <experimental_data>
#V()

Код, выданый по заданию, помеченн комментариями. График представлен на @comm[рисунке].

```
# Инициализация данных
x <- c(1:10)
y <- x
z <- 10/x

# Сохраняем текущие графические параметры
opar <- par(no.readonly = TRUE)
# Устанавливаем поля графика
par(mar = c(5, 4, 4, 8) + 0.1)

# Строим график типа "b", 21 - круги, красный цвет,
# без оси y, тип линии 3 - пунктир, без автоматических заголовков
plot(x, y, type = "b",
     pch = 21, col = "red",
     yaxt = "n", lty = 3, ann = FALSE)

# Добавляем линию, 22 - квадраты, синий цвет, тип линии 2 - штриховая
lines(x, z, type = "b", pch = 22, col = "blue", lty = 2)

# Добавляем ось Y (2 - слева) с делениями в точках x, подписи красные, перпендикулярно оси
axis(2, at = x, labels = x, col.axis = "red", las = 2)

# Добавляем ось Y (4 - справа) с делениями в точках z, подписи округлены до 2 знаков,
# синие, размер шрифта 0.7, длина делений наружу
axis(4, at = z, labels = round(z, digits = 2),
     col.axis = "blue", las = 2, cex.axis = 0.7, tck = -0.01)

# Текст с правой стороны на расстоянии 3 строк, синий, горизонтально
mtext("y=1/x", side = 4, line = 3, cex.lab = 1, las = 2, col = "blue")

# Добавляем заголовок и подписи осей
title("Пример осей",
      xlab = "значение переменной X",
      ylab = "Y = X")

# Восстанавливаем исходные графические параметры
par(opar)
```

#V()
#figure(
  caption: [График кода по заданию],
  image("/2/comment_code.png", width: 70%),
) <comm>
#V()

= Вывод

В ходе выполнения задания изучены возможности языка R. Построены графики из
методических указаний. Выпонен и помечен комментариями код из задания.

#pagebreak()
#appendix(
  "/2/main.r"
) <appendixA>
