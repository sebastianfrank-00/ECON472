# ECON 472 HW2 2/10/21

# digits
options(digits = 4)

# 2 

pnorm(-1.96, 0, 1)
1 - pnorm(1.64, 0, 1)
pnorm(.5, 0, 1) - pnorm(-.5, 0, 1)
qnorm(.01)
qnorm(.99)
qnorm(.05)
qnorm(.95)

# 3 

mux <- .05
sigmax <- .1
xvals <- seq(-.25, .35, length = 100)
plot(xvals, dnorm(xvals, mux, sigmax), type = 'l', col =  'blue', lwd = 2, ylim = c(0, 10))
muy <- .025
sigmay <- .05
yvals <- seq(-.25, .35, length = 100)
plot(yvals, dnorm(yvals, muy, sigmay), type = 'l', col =  'red', lwd = 2, ylim = c(0, 10), xlab = 'x', ylab = 'pdf', main = 'Normal Curves for X and Y')
lines(xvals, dnorm(xvals, mux, sigmax), type = 'l', col =  'blue', lwd = 2)
legend(x = 'topleft', legend = c('X', 'Y'), col = c('blue', 'red'), lwd = 2)

# 4

qnorm(.05, .05, .12)
qnorm(.01, .05, .12)

# 6 

cvals <- seq(0, 20, length = 100)
plot(cvals, dchisq(cvals, df = 1), type = 'l', lwd = 2, lty = 1, col = 1, ylab = 'PDF', xlab = 'X', main = 'Probability Curves for Chi-Squared Distributions')
lines(cvals, dchisq(cvals, df = 2), type = 'l', lwd = 2, lty = 2, col = 2)
lines(cvals, dchisq(cvals, df = 4), type = 'l', lwd = 2, lty = 3, col = 3)
lines(cvals, dchisq(cvals, df = 10), type = 'l', lwd = 2, lty = 4, col = 4)
legend(x = 'topright', legend = c('df = 1', 'df = 2', 'df = 4', 'df = 10'), col = c('black', 'red', 'green', 'blue'), lty = c(1, 2, 3, 4), lwd = 2)

svals <- seq(-3, 3, length = 100)
tvals <- seq(-3, 3, length = 100)
plot(svals, dnorm(svals, 0, 1), type = 'l', col =  1, lty = 1, lwd = 2, ylim = c(0, 1), main = "Probability Curves for Student's T and Standard Normal Distributions", xlab = 'X', ylab = 'PDF' )
lines(tvals, dt(tvals, df =  1), type = 'l', col = 2, lty = 2, lwd = 2)
lines(tvals, dt(tvals, df =  2), type = 'l', col = 3, lty = 3, lwd = 2)
lines(tvals, dt(tvals, df =  4), type = 'l', col = 4, lty = 4, lwd = 2)
lines(tvals, dt(tvals, df =  10), type = 'l', col = 5, lty = 5, lwd = 2)
legend(x = 'topright', legend = c('Std. Norm', 'T df = 1', 'T df = 2', 'T df = 4', 'T df = 10'), col = c(1, 2, 3, 4, 5), lwd = 2, lty = c(1, 2, 3, 4, 5))











