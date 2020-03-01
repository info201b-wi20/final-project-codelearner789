rm(list = ls())
library("dplyr")
library("stringr")
source("Summary Info Calculations.R")
food_prices <- read.csv("../data/wfp_market_food_prices.csv",
                        stringsAsFactors = FALSE)
summary_table <- food_prices %>%
  filter(cur_name == "USD") %>%
  select(adm0_name, cur_name, mp_price) %>%
  group_by(adm0_name, cur_name) %>%
  summarise(avg_price = mean(mp_price)) %>%
  arrange(-avg_price) %>%
  rename(country = adm0_name)

