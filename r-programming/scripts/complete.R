complete <- function(directory, id=1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  # Create an empty data frame with columns of names id and nobs
  single_df <- data.frame(matrix(vector(), 0, 2))
  names(single_df) <- c("id", "nobs")
  # Get file names relevant files from the directory
  files <- list.files(directory, full.names = TRUE)
  # For each file name, read.csv into dataframe for each id
  #assume you're doing id=3:5
  for (i in 1:length(id)) {
    df <- read.csv(files[id[i]])
    # Find nobs: number of complete cases (no NA values) for each dataframe
    nobs <- sum(complete.cases(df))
    # Binding the id and nobs to the data frame created to hold these values
    single_df <- rbind(single_df, c(id[i], nobs))
  }

  
  names(single_df) <- c("id", "nobs")
  
  return(single_df)
  
}
