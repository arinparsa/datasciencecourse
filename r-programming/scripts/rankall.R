rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcome_df <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")
  ## Check that outcome is valid
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
  hospital_df <- outcome_df[,c(2, 7, col)]
  
  ## Redefine hospital_df names to be simpler
  names(hospital_df) <- c("hospital", "state", "mortality")
  
  ## Change column class to numeric (Note: It will also coerce non-numerics into N/As )
  hospital_df$mortality <- as.numeric(hospital_df$mortality)
  
  ## Remove N/As
  hospital_df <- na.omit(hospital_df)
  
  ## Order the dataset columns
  hospital_df <- hospital_df[order(hospital_df$state, hospital_df$mortality, hospital_df$hospital),]
  
  ## For each state, find the hospital of the given rank
  
  ## Create a list that contains the abbreviation for each state
  states <- unique(hospital_df$state)
  
  ## Create an empty vector for the number of hospitals in a state to be added
  state_rank <- c()
  
  ## Create an empty vector for the worst hospitals in each state
  worst <- c()
  
  desired_hospitals <- data.frame(matrix(vector(), 0, 2))
  names(desired_hospitals) <- c("hospital", "state")
  
  ## Loop through unique states and create the data frame for hospital and state
  ## based on rank (index of the row in the ordered dataframe of state hospitals by mortality
  for (i in states) {
    ## Subset of rows by state
    state_rows <- hospital_df[hospital_df$state == i,]
    if(num == "best") {
      desired_hospitals <- rbind(desired_hospitals, c(state_rows[1, 1], i))
    }
    else if(num == "worst") {
      desired_hospitals <- rbind(desired_hospitals, c(state_rows[nrow(state_rows), 1],i))
    }
    ## if num is greater than number of hospitals in a state, return NA
    ## although R will coerce them if we don't have this statement, I'm 
    ## explicitly coding for sake of clarity
    else if(num > nrow(state_rows)) {
       desired_hospitals <- rbind(desired_hospitals, c("<NA>", i))
     }
    else {
      desired_hospitals <- rbind(desired_hospitals, c(state_rows[num, 1],i))
    }
  }
  
  names(desired_hospitals) <- c("hospital", "state")
  
  return(desired_hospitals)
  
}