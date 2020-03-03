#Load Libraries
library("dplyr")
library("ggplot2")
library("stringr")
rm(list = ls())


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
      filter(value == max(value, na.rm = TRUE)) %>%
      pull(location_name),
    most_num_people_undernourished = select(prev_undernourished_final_data, value) %>%
      group_by(value) %>%
      summarize(highest_num = max(value, na.rm = TRUE)) %>%
      arrange(-highest_num) %>%
      top_n(1) %>%
      pull(highest_num),
    least_num_undernourished = select(prev_undernourished_final_data, value) %>%
      group_by(value) %>%
      summarize(lowest_num = min(value, na.rm = TRUE)) %>%
      arrange(lowest_num) %>%
      head(n = 1L) %>%
      pull(lowest_num),
    z_nourishment_average_value = select(prev_undernourished_final_data, location_name, value) %>%
      filter(location_name == "Zimbabwe") %>%
      summarize(value = mean(value)) %>%
      pull(value),
    z_value_most_undernourished = select(prev_undernourished_final_data, location_name, value) %>%
      filter(location_name == "Zimbabwe") %>%
      summarize(value = max(value, na.rm = TRUE)) %>%
      pull(value),
    z_year_most_undernourished = select(prev_undernourished_final_data, location_name, value, year) %>%
      filter(location_name == "Zimbabwe") %>%
      filter(value == max(value, na.rm = TRUE)) %>%
      pull(year)
  ) 
  return(ret)
}

#Summary info function for food price data
get_summary_info2 <- function(food_price_data_final) {
  ret <- list(
    currency = select(food_price_data_final, currency, country_name) %>%
      group_by(currency) %>%
      filter(country_name == "Zimbabwe") %>%
      head(n = 1L) %>%
      pull(currency),
    food_type = select(food_price_data_final, country_name, commodity_purch) %>%
      filter(country_name == "Zimbabwe") %>%
      group_by(commodity_purch) %>%
      summarize() %>%
      head(n = 3L) %>%
      pull(commodity_purch),
    unit_type = select(food_price_data_final, country_name, unit_type) %>%
      filter(country_name == "Zimbabwe") %>%
      group_by(unit_type) %>%
      head(n = 1L) %>%
      pull(unit_type),
    country = select(food_price_data_final, country_name) %>%
      filter(country_name == "Zimbabwe") %>%
      head(n = 1L) %>%
      pull()
  )
  return(ret)
}





