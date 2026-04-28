Datataset <- readXL("C:/Users/Домашний/Desktop/uni/data_mine/data_copy.xlsx", rownames=FALSE, header=TRUE, na="", 
  sheet="final", stringsAsFactors=TRUE)

cor(Dataset[,c("Access.to.electricity","Density","Electricity.from.fossil.fuels","Electricity.from.renewables",
  "Energy.imports","gdp_growth","gdp_per_capita","Low.carbon.electricity","Primary.energy.consumption.per.capita",
  "Renewables","Value_co2_emissions_kt_by_country")], use="complete")

scatterplotMatrix(~Access.to.electricity+Density+Electricity.from.fossil.fuels+Electricity.from.renewables+Energy.imports+gdp_growth+gdp_per_capita+Low.carbon.electricity+Primary.energy.consumption.per.capita+Renewables+Value_co2_emissions_kt_by_country,
   regLine=FALSE, smooth=FALSE, diagonal=list(method="density"), data=Dataset)

RegModel.1 <- lm(Electricity.from.renewables~Electricity.from.fossil.fuels, data=Dataset)
summary(RegModel.1)

RegModel.2 <- lm(Value_co2_emissions_kt_by_country~Electricity.from.fossil.fuels, data=Dataset)
summary(RegModel.2)

RegModel.3 <- lm(Value_co2_emissions_kt_by_country~Electricity.from.renewables, data=Dataset)
summary(RegModel.3)

RegModel.5 <- lm(Renewables~Low.carbon.electricity, data=Dataset)
summary(RegModel.4)

crPlots(RegModel.1, smooth=list(span=0.5))
crPlots(RegModel.2, smooth=list(span=0.5))
crPlots(RegModel.3, smooth=list(span=0.5))
crPlots(RegModel.4, smooth=list(span=0.5))
