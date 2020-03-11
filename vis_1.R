# Visualization 1
library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
prevelence_undernourishment_data <-
  read.csv("data/prevelence_undernourished.csv",
           stringsAsFactors = FALSE)




vis_1 <- tabPanel(
  "First Visualization"
)
