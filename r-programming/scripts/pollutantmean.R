pollutantmean <- function(directory, pollutant, id=1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## We need to return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## Load files into data frames
  
  files <- list.files(directory, full.names = TRUE)
  df_list <- lapply(files[id], read.csv)
  
  # Alternative way of loading files into a single data frame using a for loop 
  # as opposed to lapply
  
  # files <- list.files(directory, full.names = TRUE)
  # for (i in 1:length(id)) {
  #   df <- read.csv(files[id[i]])
  #   single_df <- rbind(single_df, df)
  # }
  
  ## Merging all data frames into one
  
  airpollution_df <- data.frame(matrix(vector(), 0, 4))
  
  for (i in 1:length(df_list)) {
    airpollution_df <- rbind(airpollution_df, df_list[[i]])
  }
  
  names(airpollution_df) <- c("Date","sulfate","nitrate","ID")
    
  #Alternate way of rbinding using lapply followed by do.call
  
  #one_df_list <- lapply(df_list, rbind)
  #single_df <- do.call(rbind.data.frame, one_df_list)
  
  if (pollutant == "sulfate") {
    mean(airpollution_df$sulfate, na.rm = TRUE)
  } else if (pollutant == "nitrate") {
    mean(airpollution_df$nitrate, na.rm = TRUE)
  }
    
  
  
}