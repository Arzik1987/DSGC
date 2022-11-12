library("rpart")           # CART decision tree algorithm
library("rpart.plot")      # plot nice trees for CART results


#### create features

create.features <- function(d){
  d$mint <- apply(abs(d[, c("tau1", "tau2", "tau3", "tau4")]), 1, min)
  d$maxt <- apply(abs(d[, c("tau1", "tau2", "tau3", "tau4")]), 1, max)
  d$avgt <- apply(abs(d[, c("tau1", "tau2", "tau3", "tau4")]), 1, mean)
  d$minp <- apply(abs(d[, c("p2", "p3", "p4")]), 1, min)
  d$maxp <- apply(abs(d[, c("p2", "p3", "p4")]), 1, max)
  d$avgp <- apply(abs(d[, c("p2", "p3", "p4")]), 1, mean)
  d$ming <- apply(abs(d[, c("g1", "g2", "g3", "g4")]), 1, min)
  d$maxg <- apply(abs(d[, c("g1", "g2", "g3", "g4")]), 1, max)
  d$avgg <- apply(abs(d[, c("g1", "g2", "g3", "g4")]), 1, mean)
  d
}


#### load data

load.data <- function(filename){
  d <- read.csv(filename)
  d$stab <- as.factor(ifelse(d$stab > 0, "unstable", "stable"))
  d <- create.features(d)
  d
}


#### build DT

equationf <- as.formula(stab ~ mint + maxt + avgt + minp + maxp + avgp + ming + maxg + avgg)
d <- load.data("Data_for_UCI_named.csv")
fit <- rpart(equationf, data = d)
rpart.plot(fit)


#### save the plot

tiff("cart_1.tiff",
    width = 3*9/5, height = 2.5, units = "in", res = 300)
rpart.plot(fit, cex = 0.55, type = 3, extra = 0, box.palette = "GnRd")
dev.off()
