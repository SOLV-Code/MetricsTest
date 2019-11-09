# This function is part of the emerging "WSPMetrics" Package
# for the latest version and additional information, check
# https://github.com/SOLV-Code/WSP-Metrics-Code
# NEED ALSO STEPS FOR SINGLE VECTOR!!!!

calcPercChange  <- function(X,gen.in = 4, slope.num.gen = 3, extra.yrs = 0, genmean.smoothing = TRUE, log.transform = TRUE, out.exp = FALSE, tracing=FALSE){
# X is a data frame with Years x Stocks. Row labels are years, no missing years allowed, NA are possible, but will result in NA slope for
# any time window that includes one or more NA (for now: discuss infill options for future extensions, as in Ck implementation)
# extra.yrs arg is to handle COSEWIC "extra year"
# WARNING: for now, each "batch" has to have the same avg gen (gen.in) 
# NOTE: there is another version of this for a simple vector of values calcPercChangeSimple

# if genmean.smoothing
if(genmean.smoothing){
	series.use <- apply(X,MARGIN=2,FUN=smoothSeries,gen = gen.in , filter.sides=1, log.transform = log.transform, out.exp = out.exp,na.rm=FALSE)
	dimnames(series.use) <- dimnames(X)
	}

if(!genmean.smoothing){
	series.use <- X
	}
	
	
if(tracing){ print("series.use ------"); print(tail(series.use))}

# create output template
out.mat <- series.use
out.mat[,] <- NA


yrs.list <-   as.numeric(dimnames(series.use)[[1]])


# get first smoothed value at 1 gen.in, then need 3 more gen for the slope
# (e.g. if gen = 4, start at 15th year (stocks with missing data at beginning will juts get NA (b/c na.rm =FALSE below) 
# plus account for the COSEWIC extra yr option
yrs.list <- yrs.list[  (gen.in -1 + extra.yrs + gen.in*slope.num.gen) :  length(yrs.list) ]
if(tracing){print("yrs.list"); print(yrs.list)}


for(yr.use in yrs.list){

yrs.vec <-  seq(yr.use- ((gen.in*slope.num.gen)-1+extra.yrs) ,yr.use)
sub.idx <- dimnames(series.use)[[1]] %in% yrs.vec
tmp.mat <- series.use[sub.idx,]
#print("-----")
#print(tmp.mat)
out.mat[as.character(yr.use),] <- apply(tmp.mat, MARGIN=2,FUN= per.change.mod.fast,na.rm=FALSE)

} # end looping through years

return(out.mat)

} # end calcPercChange function

