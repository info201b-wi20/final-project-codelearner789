#Load Libraries
library("dplyr")
library("ggplot2")
library("stringr")
rm(list = ls())
#Load data set
source("index.Rmd")

#organize data & Rename

prev_undernourished_final_data <- select(prevelence_undernourishment_data, GeoAreaName, TimePeriod, Value, Goal) %>%
  rename(
    location_name = GeoAreaName, 
    year = TimePeriod, 
    value = Value,
    goal = Goal) 

prev_undernourished_final_data <- as.data.frame(lapply(prev_undernourished_final_data,
                                                       function(x) gsub('\"', '', x)))
prev_undernourished_final_data$year <- as.numeric(as.character(prev_undernourished_final_data$year))
prev_undernourished_final_data$value <- as.numeric(as.character(prev_undernourished_final_data$value))
prev_undernourished_final_data <- prev_undernourished_final_data[complete.cases(prev_undernourished_final_data), ]
food_price_data_final <- select(food_price_data, adm0_name, cm_name, cur_name, mp_year, mp_price, um_id, um_name) %>%
  rename(
    country_name = adm0_name,
    commodity_purch = cm_name,
    currency = cur_name,
    year = mp_year,
    price = mp_price,
    unit = um_id,
    unit_type = um_name
  )

#Creat summary info function for undernourished data set
get_summary_info <- function(prev_undernourished_final_data) {
  ret <- list(
    most_recent_year = select(prev_undernourished_final_data, year) %>%
      group_by(year) %>%
      summarize(last_year = max(year)) %>%
      filter(last_year == max(last_year, na.rm = TRUE)) %>%
      pull(year),
    least_recent_year = select(prev_undernourished_final_data, year) %>%
      group_by(year) %>%
      summarize(first_year = min(year)) %>%
      filter(first_year == min(first_year, na.rm = TRUE)) %>%
      pull(year),
    country_most_undernourished = select(prev_undernourished_final_data, location_name, value) %>%
      group_by(location_name) %>%
      summarize(value = max(value, na.rm = TRUE)) %>%
      filter(value == max(value, na.rm = TRUE)) %>%
      pull(location_name),
    most_num_people_undernourished = select(prev_undernourished_final_data, value) %>%
      group_by(value) %>%
      summarize(highest_num = max(value, na.rm = TRUE)) %>%
      arrange(-highest_num) %>%
      top_n(1) %>%
      pull(highest_num),
    country_least_undernourished = select(prev_undernourished_final_data, location_name, value) %>%
      group_by(location_name) %>%
      summarize(value = min(value, na.rm = TRUE)) %>%
      filter(value == min(value, na.rm = TRUE)) %>%
      pull(location_name),
    least_num_undernourished = select(prev_undernourished_final_data, value) %>%
      group_by(value) %>%
      summarize(lowest_num = min(value, na.rm = TRUE)) %>%
      arrange(lowest_num) %>%
      
  ) 
  return(ret)
}

#Summary info function for food price data
get_summary_info <- function(food_price_data_final) {
  
}




