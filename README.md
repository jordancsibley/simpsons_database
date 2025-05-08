# The Simpsons Database

### Environmental Data Science 213 Spring 2025 
![The Simpsons - Source: theverge.com](https://platform.theverge.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/13079153/the-simpsons-tv-series-cast-wallpaper-109911.0.0.1444767471.jpeg?quality=90&strip=all&crop=7.8125%2C0%2C84.375%2C100&w=2400) 

## Description 

This repository holds the code used to create a database from 4 different datasets that contain the characters, locations, episode details, and script lines for approximately 600 episodes of The Simpsons. 

## Repository Structure 

```
simpsons_database
|
├── data/
|     ├── characters_clean.csv    # characters table that has gender column recoded
|     ├── simpsons_characters.csv   # raw character data
|     ├── simpsons_episodes.csv   # raw episodes data
|     ├── simpsons_locations.csv   # raw locations data
|     └── simpsons_script_lines.csv   # raw script lines data 
|
├── images/
|      └── simpsons_database.png   # database schema for README.md
|
├── readin_simp_data.R    # script used to read in and download the 4 simpsons datasets
|
├── simpsons-data-cleaning.qmd   # script used for inital data exploration and cleaning of characters table
|
├── simpsons_database.Rproj   # R project 
|
├── README.md 
|
└── .gitignore     

```

## Database Schema 

Here is a diagram that outlines the structure and organization of the database. It contains 4 tables, `characters`, `episodes`, `locations` and `script_lines`. Schema created using [dbdiagram.io](https://dbdiagram.io/home).

![](images/simpsons_database.png)

## Data Access 

Originally, this dataset was scraped by Tod Schenider for his post [The Simpsons by the Data](https://toddwschneider.com/posts/the-simpsons-by-the-data/), for which he made the scraper available on [GitHub](https://github.com/toddwschneider/flim-springfield). Kaggle user William Cukierski used the scraper to upload the dataset, which has been rehosted [here](https://www.kaggle.com/datasets/prashant111/the-simpsons-dataset).

The code used to download the data into R was found on the [tidytuesday repository for 2025-02-04](https://github.com/rfordatascience/tidytuesday/tree/main/data/2025/2025-02-04) and is as follows: 

```
# Option 1: tidytuesdayR package 
## install.packages("tidytuesdayR")

tuesdata <- tidytuesdayR::tt_load('2025-02-04')
## OR
tuesdata <- tidytuesdayR::tt_load(2025, week = 5)

simpsons_characters <- tuesdata$simpsons_characters
simpsons_episodes <- tuesdata$simpsons_episodes
simpsons_locations <- tuesdata$simpsons_locations
simpsons_script_lines <- tuesdata$simpsons_script_lines

# Option 2: Read directly from GitHub

simpsons_characters <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-02-04/simpsons_characters.csv')
simpsons_episodes <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-02-04/simpsons_episodes.csv')
simpsons_locations <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-02-04/simpsons_locations.csv')
simpsons_script_lines <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-02-04/simpsons_script_lines.csv')

```


## Author 
Jordan Sibley 

Master of Environmental Data Science Student, Bren School of Environmental Science & Management

jcsibley@bren.ucsb.edu

jordan.c.sibley@gmail.com 

## Acknowledgments 

The material for this assignment was presented by TA Annie Adams in the course Databases and Data Management (EDS 213) at the Bren School of Environmental Science & Management, Fall 2024. I'd also like to acknowledge the instructors of this course, Julien Brun and Greg Janée. 
