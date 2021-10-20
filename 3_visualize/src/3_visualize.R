plot_road_salt_trends <- function(summary_data,fileout,width,height,units){
  
  summary_data %>%
  mutate(Year = as.Date(as.character(Year), format = "%Y")) %>%
  ggplot() + geom_area(aes(x = Year, y = salt_lbs, group = landcover, fill = landcover),alpha=.75)+
    ylab("Total road salt applied (lbs)") + 
    ggtitle("Delaware River Basin",subtitle = "data from Bock et al. 2018") +
    scale_fill_brewer(palette="Dark2") +
    theme_classic()
  ggsave(fileout, width = width, height = height, units = units)
  
  return(fileout)
  
}



        

