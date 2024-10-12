p2 <- read.csv("Final Problem 2 Dataset.csv", header=TRUE)
fit1 <- lm(y ~ acid.temp + acid.conc + water.temp + sulf.conc + amt.bl., data=p2)
summary(fit1)

plot(fit1$fitted, fit1$residuals, )
abline(0,0)
