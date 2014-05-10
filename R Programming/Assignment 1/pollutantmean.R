pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    mean <- 0
    total <- 0
   	for (i in id) {
   		if (i <= 9) {
   			x <- paste("00", as.character(i), sep = "");
   		} else if (i <= 99) {
   			x <- paste("0", as.character(i), sep = "");
   		} else {
   			x <- as.character(i);
   		}
   		f <- paste(directory, "/", x, ".csv", sep = "")
   		mat = read.csv(f)
   		if (pollutant == "sulfate") {
   			t = mat[!is.na(mat["sulfate"]), "sulfate"]
   		} else {
   			t = mat[!is.na(mat["nitrate"]), "nitrate"]
   		}
   		mean = mean + sum(t)
   		total = total + length(t)
   	}
   	return(mean / total)
}