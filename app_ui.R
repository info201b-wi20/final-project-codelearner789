library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
source("vis_1.R")
source("vis_2.R")
source("vis_3.R")
# Introduction
intro_tab <- tabPanel(
  "Introduction",
  tags$h1("Exploring Food Accessibility and Prices")
  
)




# Conclusion
concluding_tab <- tabPanel(
  "Ending Remarks"
)

ui <- navbarPage(
  "Exploring food accessibility and malnourishment",
  intro_tab,
  vis_1,
  vis_2,
  vis_3,
  concluding_tab
)
