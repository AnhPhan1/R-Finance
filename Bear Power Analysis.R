#Author: Anh Phan (GitHub: @anhphan1, Email: anhphan@udel.edu, Phone: (302) 345-5885)

library(quantmod)
library(ggplot2)
library(gridExtra)

# Get stock data
getSymbols('AAPL', from='2018-01-01', to='2021-01-01', adjust = TRUE)
Stock <- AAPL

# Calculate Bears Power
Stock$EMA_Low <- EMA(Stock$AAPL.Low, n = 30)
Stock$Bears_Power <- Stock$AAPL.Low - Stock$EMA_Low

# Create a ggplot chart for Closing Price
closing_price_chart <- ggplot(Stock, aes(x = index(Stock), y = AAPL.Close)) +
  geom_line(color = 'blue') +
  labs(title = Stock + 10,
       x = "Date",
       y = "Price")

# Create a ggplot chart for Bears Power
bears_power_chart <- ggplot(Stock, aes(x = index(Stock), y = Bears_Power)) +
  geom_line(color = 'red') +
  labs(title = "Bears Power",
       x = "Date",
       y = "Bears Power") +
  theme(plot.title = element_text(hjust = 0.5))  # Center the plot title

# Arrange charts using grid
grid.arrange(closing_price_chart, bears_power_chart, ncol = 1)
