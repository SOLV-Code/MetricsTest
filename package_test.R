library(tidyverse)
library(MetricsTest)
library(R2jags)


ls(getNamespace("MetricsTest"), all.names=TRUE)


pdf("ProbDecl_Fits.pdf",onefile=TRUE,height=8.5, width=11)

vec.use = c(12,10,14,7,13,5,8,3,4,7,6,5)
slope.mcmc.fit <- calcPercChangeMCMC(vec.in= vec.use,model.in = NULL ,
                                     perc.change.bm = -25 , na.skip=FALSE,
                                     out.type = "long", mcmc.plots = TRUE)
dev.off()










