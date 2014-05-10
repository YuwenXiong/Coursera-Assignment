complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    d = data.frame(nrow = length(id), ncol = 2);
    colnames(d) = c("id", "nobs");
    cnt = 0
   	for (i in id) {
   		cnt = cnt + 1
   		if (i <= 9) {
   			x <- paste("00", as.character(i), sep = "");
   		} else if (i <= 99) {
   			x <- paste("0", as.character(i), sep = "");
   		} else {
   			x <- as.character(i);
   		}
   		f <- paste(directory, "/", x, ".csv", sep = "")
   		mat = read.csv(f)
   		d[cnt, ] = c(i, length(mat[!is.na(mat["sulfate"]) & !is.na(mat["nitrate"]), "sulfate"]))
   	}
	return(d)    
}