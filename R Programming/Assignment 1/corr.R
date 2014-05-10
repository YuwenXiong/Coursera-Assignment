corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    x = complete(directory);
    t = x[x["nobs"] > threshold, "id"]
    corr = numeric(0)
    cnt = 0
    for (i in t) {
    	cnt = cnt + 1
    	mat = read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep = ""))
    	n = mat[!is.na(mat["sulfate"]) & !is.na(mat["nitrate"]), "nitrate"]
    	s = mat[!is.na(mat["sulfate"]) & !is.na(mat["nitrate"]), "sulfate"]
    	corr = c(corr, cor(n, s))
    }
    return (corr)
}
