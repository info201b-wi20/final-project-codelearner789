rm(list = ls())
library("dplyr")
library("stringr")
source("Summary Info Calculations.R")

summary_table <- food_price_data_final %>%
  filter(currency == "USD") %>%
  select(country_name, commodity_purch, unit, unit_type, price) %>%
  group_by(country_name, commodity_purch, unit, unit_type) %>%
  summarise(average_price = mean(price)) %>%
  arrange(-average_price)
