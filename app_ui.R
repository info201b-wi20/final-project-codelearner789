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
  titlePanel(tags$h1(
    id = "intro_sec",
    "Exploring Food Accessibility and Prices"
    )),
  fluidPage(
    tags$p(
      id = "intro_descrip",
    "This project aims to look generally at global data about Food Prices 
    and Population Nourishment to further understand which areas are most
    impacted by undernourishment and when. Data and surveillance of these
    issues have great implications for how to proceed in dealing with a public
    health issue such as global food insecurity. The source of our data comes
    from two datasets. The first dataset is a global food price tracker that
    was collected and compiled by the World Food Program. Their data focuses
    on providing information on food prices form developing countries. 
    The second dataset that we are pulling from is data from the UN 
    Sustainable Development Goals and the data provides the number of
    undernourished people per country overtime. This project combines
    country data that overlaps between the two datasets to create a
    fuller picture of global food insecurity. For this project, we
    decided to create 3 visualizations to illustrate specific trends
    in food malnourishment and food accessibility as well as
    trends in food prices."),
    img(src = "https://miro.medium.com/max/620/1*qF6t1pzpiunMD-8PK7fmuQ.jpeg")
  )
)




# Conclusion
concluding_tab <- tabPanel(
  "Overall Analysis",
  p(
    "For each of the visualizations, we were able to make some insightful
    statements about food accessibility and the trend of food prices.
    For Visualization 2, an important insight that can be made is that
    as the years go by, we get data for the average price of more commodities
    for any given country. An example of this from the visualization is that "
  ),
  p("For our third visualization, the user can look at years from 2000 to 2018.
    The visualization will then be produced based on the year selected. 
    The visualization is a bar graph that shows the undernourishment 
    values of countries that use USD and the undernourishment levels 
    during that particular year."
    )
)

ui <- fluidPage(
  includeCSS("styles.css"),
  navbarPage(
    "Exploring food accessibility and malnourishment",
    intro_tab,
    vis_1,
    vis_2,
    vis_3,
    concluding_tab
  )
)
  

