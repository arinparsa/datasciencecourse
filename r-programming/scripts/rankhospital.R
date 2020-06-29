rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  outcome_df <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(!(state %in% outcome_df$State)) {
    stop('Invalid State')
  }
  
  if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
    stop('Invalid Outcome') 
  }
  
  if(outcome == "heart attack") {
    col <- 11
  }
  if(outcome == "heart failure") {
    col <- 17
  }
  if(outcome == "pneumonia") {
    col <- 23
  }
  ## Create a data frame of the hospitals in the state we want and the outcome for the condition we want
  hospital_df <- outcome_df[outcome_df$State == state, c(2, col)]
  
  ## Redefine hospital_df names to be simpler
  names(hospital_df) <- c("Hospital", "Mortality")
  
  ## Change column class to numeric (Note: It will also coerce non-numerics into N/As )
  hospital_df$Mortality <- as.numeric(hospital_df$Mortality)
  
  ## Remove N/As
  hospital_df <- na.omit(hospital_df)
  
  ## Order the hospital names alphabetically
  hospital_df <- hospital_df[order(hospital_df$Hospital),]
  
  ## Order the Mortality column from least to greatest
  hospital_df <- hospital_df[order(hospital_df$Mortality),]
  
  ## Creating Rank column
  hospital_df <- cbind(hospital_df, c(1:nrow(hospital_df)))
  colnames(hospital_df)[3] <- "Rank"

  ## Return hospital name in that state with the given rank
  if (num == "best") {
    return(hospital_df[hospital_df$Rank == 1, 1])
  }
   
  if (num == "worst") {
    return(hospital_df[hospital_df$Rank == nrow(hospital_df), 1])
  }
  
  if (num > nrow(hospital_df)) {
    return("NA")
  }
  
  return(hospital_df[hospital_df$Rank == num, 1])
}