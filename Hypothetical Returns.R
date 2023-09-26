#Author: Anh Phan (GitHub: @anhphan1, Email: anhphan@udel.edu, Phone: (302) 345-5885)


library(quantmod)
library(xts) 
library(randtests)

getSymbols('AAPL', from='2018-01-01', to='2021-01-01', adjust = TRUE)
Stock <- AAPL
Stock = data.frame(AAPL)

head(Stock)

tail(Stock)

price = round(Stock$AAPL.Adjusted, digits=2)

stock_ret <- 100*diff(log(price))

# Convert to numeric
ret_price = as.numeric(stock_ret)

# One Sample t-test
t.test(stock_ret)

# One Sample t-test
t.test(stock_ret > 0)