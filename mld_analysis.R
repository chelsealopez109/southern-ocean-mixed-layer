# request csv data from https://dataselection.euro-argo.eu/
# Data in this project is from floats in the area -40N, 0S, 50E, 0W in 2018
# 0.125 greater than surface density

library(dplyr)
test_file <- read.csv("argo_float_data.csv", header = TRUE, check.names = FALSE)
argo_profile <- unique(test_file$Station) #list of profile numbers
mixed_layers <- data.frame(argo_profile) #data frame to add mlds for each profile
profile_list <- list()



##### add df of data from each station into single list
for (i in 1:length(argo_profile)){
  profile_list[[i]] <- subset(test_file, test_file$Station == argo_profile[i])
}
names(profile_list) <- argo_profile
# Some stations have too few measurements (only surface). Need to remove those

