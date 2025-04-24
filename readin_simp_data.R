# Option 1: tidytuesdayR package 
#install.packages("tidytuesdayR")
library(tidytuesdayR)


tuesdata <- tidytuesdayR::tt_load('2025-02-04')
## OR
# tuesdata <- tidytuesdayR::tt_load(2025, week = 5)

simpsons_characters <- tuesdata$simpsons_characters
simpsons_episodes <- tuesdata$simpsons_episodes
simpsons_locations <- tuesdata$simpsons_locations
simpsons_script_lines <- tuesdata$simpsons_script_lines

# Download data as CSV files 

write.csv(simpsons_characters,file='~/Desktop/MEDS/EDS_213/section_database_proj/simpsons_data/simpsons_characters.csv', row.names=FALSE)
write.csv(simpsons_episodes,file='~/Desktop/MEDS/EDS_213/section_database_proj/simpsons_data/simpsons_episodes.csv', row.names=FALSE)
write.csv(simpsons_locations,file='~/Desktop/MEDS/EDS_213/section_database_proj/simpsons_data/simpsons_locations.csv', row.names=FALSE)
write.csv(simpsons_script_lines,file='~/Desktop/MEDS/EDS_213/section_database_proj/simpsons_data/simpsons_script_lines.csv', row.names=FALSE)
