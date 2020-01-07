library(tidyverse)
library(MetricsTest)
library(R2jags)


#ls(getNamespace("MetricsTest"), all.names=TRUE)


# TEST BAYESIAN PERC CHANGE

pdf("ProbDecl_Fits.pdf",onefile=TRUE,height=8.5, width=11)

vec.use = c(12,10,14,7,13,5,8,3,4,7,6,5)
slope.mcmc.fit <- calcPercChangeMCMC(vec.in= vec.use,model.in = NULL ,
                                     perc.change.bm = -25 , na.skip=FALSE,
                                     out.type = "long", mcmc.plots = TRUE)
dev.off()

names(slope.mcmc.fit)
slope.mcmc.fit$pchange
slope.mcmc.fit$probdecl
slope.mcmc.fit$summary


# TEST LONG-TERM TREND - Simple version for single vector

lt.trend.single <- calcLongTermTrendSimple(vec.in = as.vector(Nile) ,
            gen.in = 4,min.lt.yrs = 20, avg.type = "geomean",
            tracing=FALSE,
            recent.excl = FALSE)

lt.trend.single

# TEST LONG-TERM TREND - data frame version


sample.df <- data.frame(Stock1 = sample(100,40),Stock2 = sample(2000,40),Stock3 = sample(500,40))
sample.df[29,3] <- NA

lt.trend <- calcLongTermTrend(X = sample.df,gen.in = 4, recent.num.gen = 1, extra.yrs = 0,
                               min.lt.yrs = 20, avg.type = "geomean", tracing=FALSE,
                               recent.excl = FALSE)

lt.trend



