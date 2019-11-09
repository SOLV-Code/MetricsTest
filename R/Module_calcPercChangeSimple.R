# This function is part of the emerging "WSPMetrics" Package
# for the latest version and additional information, check
# https://github.com/SOLV-Code/WSP-Metrics-Code


calcPercChangeSimple  <- function(vec.in){
# this function just does a basic perc change calc
# calcPercChange() applies the same basic calc retrospectively to a data frame of Year x Stock, 
# with various user options (e.g. log transform, gen avg smoothing, time window to use)

# vec.in is a vector of values


perc.change <- per.change.mod.fast(vec.in,na.rm=FALSE)  
# if any NA, gives NA for perc change
# see issue https://github.com/carrieholt/WSP-Metrics-Code/issues/55

out.list <- list(pchange = perc.change)


return(out.list)

} # end calcPercChange function

