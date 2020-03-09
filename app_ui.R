library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
# Introduction
intro_tab <- tabPanel(
  "Introduction"
  
)

# Visualization 1
vis_1 <- tabPanel(
  "First Visualization"
)
# Visualization 2
vis_2 <- tabPanel(
  "Second Visualization"
)
# Visualization 3
vis_3 <- tabPanel(
  "Third Visualization"
)
# Conclusion
concluding_tab <- tabPanel(
  "Ending Remarks"
)

ui <- navBarPage(
  "Exploring food accessibility an malnourishment",
  intro_tab,
  vis_1,
  vis_2,
  vis_3,
  concluding_tab
  
)