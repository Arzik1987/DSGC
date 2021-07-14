
d.new <- read.csv(paste0(getwd(),"\\Data_for_UCI.csv"), header = FALSE)
stab <- apply(d.new[, 13:ncol(d.new)], 1, max)
d.new <- cbind(d.new[, 1:12], stab)
colnames(d.new)  <- c("tau1", "tau2", "tau3", "tau4", "p1", "p2", "p3", "p4", "g1", "g2", "g3", "g4", "stab")
d.new$stabf <- as.factor(ifelse(d.new$stab > 0, "unstable", "stable"))

write.csv(d.new, paste0(getwd(), "\\Data_for_UCI_named.csv"), row.names = FALSE)