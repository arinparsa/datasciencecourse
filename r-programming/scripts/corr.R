 corr <- function(directory, threshold = 0) {
  # Load all files into data frames (list.files, list of 332 dataframes)
  files <- list.files(directory, full.names = TRUE)
  df_list <- lapply(files, read.csv)
  cor_vector = c()
  # For each id, compare the number of complete cases of all variables to the threshold value 
  for (i in 1:length(files)) {
    df <- na.omit(df_list[[i]])
    # If the nobs is greater than the threshold, then compute the correlation of the sulfate and nitrate columns
    nobs <- sum(complete.cases(df))
    # print(nobs)
    # browser()
    if (nobs > threshold[1]) {
      correlation <- cor(df$sulfate, df$nitrate)
      # Put the correlation in a vector
      cor_vector <- c(cor_vector, correlation)
    }
  }
  # Return a vector of correlations for the monitors that meet the threshold requirement
  # summary(cor_vector)
  # length(cor_vector)
  return (cor_vector)
}