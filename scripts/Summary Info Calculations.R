#Load Libraries
library("dplyr")
library("ggplot2")
library("stringr")
#Load data set

food_price_data <- read.csv("data/wfp_market_food_prices.csv",
                            stringsAsFactors = FALSE)
prevelence_undernourishment_data <- read.csv("data/prevelence_undernourished.csv", 
                                             stringsAsFactors = FALSE)
#organize data & Rename

prev_undernourished_final_data <- select(prevelence_undernourishment_data, GeoAreaName, TimePeriod, Value) %>%
  rename(
    location_name = GeoAreaName, 
    year = TimePeriod, 
    value = Value)

food_price_data_final <- select(food_price_data, adm0_name, cm_name, cur_name, mp_year, mp_price) %>%
  rename(
    country_name = adm0_name,
    commodity_purch = cm_name,
    currency = cur_name,
    year = mp_year,
    price = mp_price
  )
#Creat summary info function
get_summary_info <- function(prevelence_undernourishment_data) {
  ret <- list(
    num_rows_2016 = nrow(prevelence_undernourishment_data$TimePeriod = 2016),
    df_uniq_countries = 
    
  ) 
}
#get_summary_info <- function(food_price_data) {
  #ret <- list(
   # num_rows_2016 = nrow(food_price_data$mp_year = 2016),
    #df_uniq_countries = nrow(distinct(food_price_data$adm0_name))
    
  #) 
#}

num_countries_2017 <- select(prevelence_undernourishment_data, 
                             GeoAreaName, TimePeriod, Value) %>%
  + filter(TimePeriod == ""2017"") %>% 
  + group_by(GeoAreaName) %>%
  + summarize(num_countries = length(GeoAreaName))
