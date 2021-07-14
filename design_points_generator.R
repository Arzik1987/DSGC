library("lhs")
library("randtoolbox")

set.seed(65754)

n = 10000

for(i in 1:1){
  d <- randomLHS(n, 11)
  
  data <- matrix(ncol = 12, nrow = n)
  data[, 1:4] <- d [, 1:4]*9.5 + 0.5
  data[, 6:8] <- d [, 5:7]*1.5 - 2
  data[, 5] <- -apply(data[, 6:8], 1, sum)
  # data[, 9] <- rep(0, n)
  data[, 9:12] <- d [, 8:11]*0.95 + 0.05
  
  write.table(data, 
              paste0(getwd(),"\\design.csv"),
              row.names = FALSE,
              col.names = FALSE, sep=",")
}


n = 100
d <- halton(n, 2)
data <- matrix(ncol = 2, nrow = n)
data[, 1] <- d [, 1]*30 - 20
data[, 2] <- d [, 2]*30 - 15 + 0.01

write.table(data, 
            paste0(getwd(),"\\starting_points.csv"),
            row.names = FALSE,
            col.names = FALSE, sep=",")