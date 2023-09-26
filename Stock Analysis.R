#Author: Anh Phan (GitHub: @anhphan1, Email: anhphan@udel.edu, Phone: (302) 345-5885)


library(quantmod)
library(PerformanceAnalytics)
SPY = getSymbols("SPY", from="2021-01-01", auto.assign=F)
head(SPY)
tail(SPY)
summary(SPY)
plot(SPY)
# Calculate Returns
rets = ROC(Cl(SPY), type="discrete")
# Another way to calculate returns
returns <- Return.calculate(Cl(SPY))
head(returns)
head(rets)
plot(rets, main="")
title(main='Stock Returns', cex=1.5, font=4)
table.Drawdowns(rets["2020/"], top=10)
