# Загрузка примера данных
Dataset <- readXL("C:/Users/Домашний/Desktop/uni/data_mine/Пример_Данные для 2.3.xlsx", rownames=FALSE, header=TRUE, na="", sheet="Лист1", stringsAsFactors=TRUE)

# Построение модели множественной регрессии
RegModel.1 <- lm(реальное.ВВП~бедность+безработица+образовании+общест...ое.развитие+ожидаемая.продол.ть, data=Dataset)
summary(RegModel.1)

# Графики остатков
crPlots(RegModel.1, smooth=list(span=0.5))

library(MASS, pos=16)

# Пошаговое построение модели вперед и назад
stepwise(RegModel.1, direction='forward', criterion='AIC')
stepwise(RegModel.1, direction='backward', criterion='AIC')

# VIF коэффициенты
vif(RegModel.1)
round(cov2cor(vcov(RegModel.1)), 3) # Correlations of parameter estimates

# Загрузка эксперементальных данных
MyDataset <- readXL("C:/Users/Домашний/Desktop/uni/data_mine/data_copy.xlsx", rownames=FALSE, header=TRUE, na="", sheet="final", stringsAsFactors=TRUE)

# Построение модели множественной регрессии
RegModel.2 <- 
  lm(Value_co2_emissions_kt_by_country~Access.to.electricity+Density+Electricity.from.fossil.fuels+Electricity.from.renewables+Energy.imports+gdp_growth+gdp_per_capita+Low.carbon.electricity+Primary.energy.consumption.per.capita+Renewables, data=MyDataset)
summary(RegModel.2)

# Графики остатков
crPlots(RegModel.2, smooth=list(span=0.5))

# Пошаговое построение модели вперед и назад
stepwise(RegModel.2, direction='forward', criterion='AIC')
stepwise(RegModel.2, direction='backward', criterion='AIC')

# VIF коэффициенты
vif(RegModel.2)
round(cov2cor(vcov(RegModel.2)), 3) # Correlations of parameter estimates
