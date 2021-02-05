# ECON 472 HW1 2/4/21

# establish working directory
setwd("~/Desktop/Econometrics/ECON472/Homework")
getwd()

# digits 
options(digits = 4)

# read files 
sbux.df <- read.csv("sbuxPrices.csv", header = TRUE, na.strings = ".", stringsAsFactors = FALSE)
attach(sbux.df)
sbux.df

# data frame exploration
class(sbux.df)
str(sbux.df)
head(sbux.df)
tail(sbux.df)
colnames(sbux.df)
class('Date')
class('Adj.Close')

# subsetting operations - extracting first five rows
sbux.df[1:5, 'Adj.Close', drop = FALSE]

# extract prices from the time of the financial crisis 
sbux.df[101:132, ]

# create new df for price data with dates as the row names
sbuxPrices.df <- sbux.df[, 'Adj.Close', drop = FALSE]
rownames(sbuxPrices.df) <- sbux.df$Date
head(sbuxPrices.df)

# plot the data
# type l refers to line graph 
# ylab refers to y axis label
# main refer to main title
# lwd refers to line thickness (lower numbers are thinner)
# lty refers to line type 
plot(sbux.df$Adj.Close)
plot(sbux.df$Adj.Close, type = 'l', col = 'blue', ylab = 'Adjusted Close', main = 'Monthly Closing Price of SBUX', lwd = 2, lty = 1)
legend(x = 'topleft', legend = 'SBUX', lty = 1, lwd = 2, col = 'blue' )

# compute returns 
# 1 mo simple returns
n <- nrow(sbuxPrices.df)
sbux.ret.df <- (sbuxPrices.df[2 : n, 1, drop = FALSE] - sbuxPrices.df[1 : n - 1, 1, drop = FALSE]) / sbuxPrices.df[1 : n - 1, 1, drop = FALSE]
class(sbux.ret.df)
names(sbux.ret.df) <- rownames(sbuxPrices.df)[2 : n]
head(sbux.ret.df)
## continuously compounded 1 mo returns 
sbux.ccret <- log(sbuxPrices.df[2 : n, 1, drop = FALSE]) - log(sbuxPrices.df[1 : n - 1, 1, drop = FALSE])
class(sbux.ccret)
names(sbux.ccret) <- rownames(sbuxPrices.df)[2 : n]
head(sbux.ccret)

# compare the two returns 
head(cbind(sbux.ret.df, sbux.ccret))

# plot the returns 
# par is used to divide the 'Plots' screen
# abline is to add one or more straight lines thru the current plot
# the argument h in abline represents the y-value for the horizontal line 
par(mfrow = c(2, 1))
plot(sbux.ret.df$Adj.Close, type = 'l', col = 'blue', ylab = 'Return', lwd = 2, main = 'Monthly Simple Return on SBUX')
abline(h = 0)  
plot(sbux.ccret$Adj.Close, type="l", col="blue", lwd=2, ylab="Return", main = 'Monthly Continuously Compounded Return on SBUX')
abline(h = 0)
par(mfrow = c(1, 1))
plot(sbux.ret.df$Adj.Close, type = 'l', col = 'blue', ylab = 'Return', lwd = 2, main = 'Monthly Return')
lines(sbux.ccret$Adj.Close, col = 'red', lwd = 2)
legend(x = 'bottomright', legend =  c('Simple', 'CC'), lty = 1, lwd = 2, col = c('blue', 'red'))

# calculating the growth of $1 invested in SBUX 
sbux.gret <- 1 + sbux.ret.df$Adj.Close
sbux.fv <- cumprod(sbux.gret)
plot(sbux.fv, type = 'l', col = 'blue', ylab = 'Dollars', lwd = 2, main = 'FV of $1 Invested in SBUX')



