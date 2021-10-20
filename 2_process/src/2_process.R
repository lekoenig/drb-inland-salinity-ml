process_RoadSaltDRB <- function(filepath,savepath=temp){
  
  temp <- tempdir()
  
  #unzip DRB road salt data
  unzip(zipfile = filepath,exdir=savepath,overwrite=TRUE)
  
  # read in summary text file
  road_salt_table <- read.table(paste0(savepath,"/RoadSaltDRB/RoadSaltEstimatesByLU.txt"),header = TRUE,sep = "\t",check.names = FALSE)
  
  # format summary file
  processed_data <- road_salt_table %>% 
    rename("landcover" = "Row Labels") %>% 
    pivot_longer(!landcover,names_to = "Year", values_to = "salt_lbs") %>%
    mutate(Year = factor(Year))
  
  return(processed_data)
  
}