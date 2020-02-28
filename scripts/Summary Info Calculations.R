#Load Libraries
library("dplyr")
library(ggplot2)

#Load data set

food_price_data <- read.csv("data/wfp_market_food_prices.csv", stringsAsFactors = FALSE)
prevelence_undernourishment_data <- read.csv("data/")