library(targets)

options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", "lubridate")) 

source("./2_process/src/2_process.R")
source("./3_visualize/src/3_visualize.R")

list(
  # Process summary table from Bock et al. 2018
  tar_target(
    p2_Bock_salt_trends,
    process_RoadSaltDRB(filepath = "1_fetch/in/RoadSaltDRB.zip")
  ),
  # Plot road salt application trends 
  tar_target(
    p3_Bock_salt_trends_png,
    plot_road_salt_trends(fileout = "3_visualize/out/drb-road-salt-trends.png",
                          p2_Bock_salt_trends,
                          width=9,height=6,units="in"),
    format="file"
  )
)
  
  