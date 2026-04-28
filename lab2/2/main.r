png("example_0.png")
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg ~ wt))
title("Regression of MPG on Weight")
detach(mtcars)
dev.off()

dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

png("example_1.png")
plot(dose, drugA, type = "b")
dev.off()

png("example_2.png")
opar <- par(no.readonly = TRUE)
par(lty = 2, pch = 17)
plot(dose, drugA, type = "b")
par(opar)
dev.off()

png("example_3.png")
plot(dose, drugA, type = "b", lty = 3, lwd = 3, pch = 15, cex = 2)
dev.off()

n <- 10
mycolors <- rainbow(n)
png("example_4.png")
pie(rep(1, n), labels = mycolors, col = mycolors)
mygrays <- gray(0:n/n)
png("example_5.png")
pie(rep(1, n), labels = mygrays, col = mygrays)
dev.off()

png("example_6.png")
opar <- par(no.readonly = TRUE)
par(font.lab = 3, cex.lab = 1.5, font.main = 4, cex.main = 2)
plot(dose, drugA, type = "b", main = "Пример текста", xlab = "Доза", ylab = "Реакция")
par(opar)
dev.off()

png("example_7.png")
opar <- par(no.readonly=TRUE)
par(pin=c(2, 3))
par(lwd=2, cex=1.5)
par(cex.axis=.75, font.axis=3)
plot(dose, drugA, type="b", pch=19, lty=2, col="red")
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")
par(opar)
dev.off()

x <- c(1:10)
y <- x
z <- 10 / x

png("example_8.png")
opar <- par(no.readonly = TRUE)
plot(dose, drugA, type="b",
    col="red", lty=2, pch=2, lwd=2,
    main="клинические испытания прпарата A",
    sub="это вымышленные данные",
    xlab="Доза", ylab="Эффект от препарата",
    xlim=c(0, 60), ylim=c(0, 70))
par(opar)
dev.off()

png("example_9.png")
plot(dose, drugA, type = "b", ann = FALSE)
title(main = "клинические испытания препарата А", col.main = "red",
      sub = "это вымышленные данные", col.sub = "blue",
      xlab = "Доза", ylab = "Эффект от препарата", col.lab = "green", cex.lab = 0.75)
dev.off()

png("example_10.png")
plot(dose, drugA, type = "b", pch = 17, lty = 1, col = "red",
     ylim = c(0, 70), xlab = "Доза", ylab = "Реакция",
     main = "Сравнение лекарств A и B")
lines(dose, drugB, type = "b", pch = 19, lty = 2, col = "blue")
legend("topleft", legend = c("Лекарство A", "Лекарство B"),
       col = c("red", "blue"), pch = c(17, 19), lty = c(1, 2))
dev.off()

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

png("comment_code.png")
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
dev.off()
