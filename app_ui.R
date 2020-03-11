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
  p("For each of the visualizations, we were able to make some insightful
    statements about food accessibility and the trend of food prices. Our first 
    visualizations gives users an understanding of undernourishment rates selected
    from the five countries that use the USD. The data timeline is from 2000 to 
    the earliest data provided from the dataset, keeping in mind that this dataset
    is updated. Looking at El Salvador specifically, we see that in the early 2000s
    the lowest rate for malnourishment was just below 9 and then we have an upward
    trend that continues until 2011 and then has an downward trend. 
    For future implications, this could tell us that El Salvador rate of malnourishment
    could continue on a downward trend. With the hopes of one day having malnourishment
    rates below what it was in the early 2000 or surpassing it." 
  ),
  p("For Visualization 2, an important insight that can be made is that
    as the years go by, we get data for the average price of more commodities
    for any given country. An example of this from the visualization is that when
    looking at Panama, the two commodities that are listed are Maize (yellow) and 
    Rice(milled 80-20). The trend that occurs from 2012 to 2013 is that the price
    of Maize spikes down and goes from 750 to 450 and then stays relatively the same
    afterwards while the price of the Rice is the same through those years.
    From this insight, we can gather that for future trends, the price of for both
    the Maize and Rice will stay the same albeit a minor spike for a short period
    of time."
  ),
  p("For our Undernourishment Rates, the user can look at years from 2000 to 2018.
    The visualization will then be produced based on the year selected. 
    The visualization is a bar graph that shows the undernourishment 
    values of countries that use USD and the undernourishment levels 
    during that particular year. The goal was to allow users to compare the 
    countries in which we had compared food prices to compare nourishment rates 
    each year. A pattern that can be seen is that overall the level of undernourishment
    between the countries that measure food prices with USD decreased slightly over time
    and the order of country with the works nourishment levels to best stayed the same
    throughout the years. Zimbabwe was the country that after 2001 did not improve while
    other countries were able to lower their undernourishment rate. Overall there was never
    drastic improvement between these countries and there was a huge difference between
    the countries in Latin American countries and other countries. The larger 
    implications of this could be that countries where there was  no major changes 
    in a sixteen year time span had not been presented with a good solution. This shows that
    none of these countries have been able to remotely solve the problem.")
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
  

