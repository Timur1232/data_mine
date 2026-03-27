# read excel data
Dataset <- readXL("~/winh/Downloads/Пример_Данные для 2.3.xlsx", rownames=FALSE, header=TRUE, na="", 
  sheet="Лист1", stringsAsFactors=TRUE)

columns <- c("бедность","безработица","образовании","общест...ое.развитие","ожидаемая.продол.ть", "реальное.ВВП")

# make correlation matrix
cor(Dataset[,columns], use="complete")
cor(Dataset[,columns], method="spearman", use="complete")

# draw plots
png("cor_graphs.png")
scatterplotMatrix(~бедность+безработица+образовании+общест...ое.развитие+ожидаемая.продол.ть+реальное.ВВП,
  regLine=FALSE, smooth=FALSE, diagonal=list(method="density"), data=Dataset)
dev.off()

# regression
RegModel.1 <- lm(реальное.ВВП~общест...ое.развитие, data=Dataset)
summary(RegModel.1)

# component + residual plot
crPlots(RegModel.1, smooth=list(span=0.5))
