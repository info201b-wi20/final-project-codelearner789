rm(list = ls())
library("dplyr")
library("stringr")
source("Summary Info Calculations.R")

summary_table <- food_price_data %>%
  filter(cur_name == "USD") %>%
  select(adm0_name, cur_name, mp_price) %>%
  group_by(adm0_name, cur_name) %>%
  summarise(avg_price = mean(mp_price)) %>%
  arrange(-avg_price) %>%
  rename(country = adm0_name)

