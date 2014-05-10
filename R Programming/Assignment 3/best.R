best <- function(state, name) {
	outcome = read.csv("outcome-of-care-measures.csv", colClasses = "character")
	names(outcome) = tolower(names(outcome))
	idx = (outcome$"state" == state)
	if (length(outcome[idx, "state"]) == 0) {
		stop("invalid state");
	}
	name = chartr(' ', '.', name)
	name = paste("hospital.30.day.death..mortality..rates.from.", tolower(name), sep = "")
	if (is.null(outcome[idx, name])) {
		stop("invalid outcome");
	}
	t2 = outcome[idx, "hospital.name"];
	return (t2[(which.min(as.numeric(outcome[idx, name])))]);
}