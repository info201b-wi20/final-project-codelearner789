library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
# load data

prev_undernourish <-
  read.csv("data/prevelence_undernourished.csv",
    stringsAsFactors = FALSE
  )

prev_undernourished_final_data <- select(
  prev_undernourish, GeoAreaName,
  TimePeriod, Value
) %>%
  rename(
    location_name = GeoAreaName,
    year = TimePeriod,
    value = Value
  )

prev_undernourished_final_data <- filter(
  prev_undernourished_final_data,
  location_name != "World"
)
prev_undernourished_final_data <- as.data.frame(lapply(
  prev_undernourished_final_data,
  function(x) gsub('\"', "", x)
))
prev_undernourished_final_data$year <- as.numeric(
  as.character(prev_undernourished_final_data$year)
)
prev_undernourished_final_data$value <- as.numeric(
  as.character(prev_undernourished_final_data$value)
)
prev_undernourished_final_data <- prev_undernourished_final_data[complete.cases(
  prev_undernourished_final_data
), ]

# Create Variables & Visualization for Page 3
var1_vis3 <- sidebarLayout(
  sidebarPanel(
    selectInput("year3",
      label = h3("Select Year"),
      choices = list(
        "2000" = "2000",
        "2001" = "2001",
        "2002" = "2002",
        "2003" = "2003",
        "2004" = "2004",
        "2005" = "2005",
        "2006" = "2006",
        "2007" = "2007",
        "2008" = "2008",
        "2009" = "2009",
        "2010" = "2010",
        "2011" = "2011",
        "2012" = "2012",
        "2013" = "2013",
        "2014" = "2014",
        "2015" = "2015",
        "2016" = "2016"
      ),
      selected = "2016"
    )
  ),
  mainPanel(
    tags$h3("Compare Undernourishment In Countries Where Food Prices are USD"),
    plotlyOutput("vis3")
  )
)

# Visualization 3
vis_3 <- tabPanel(
  "Undernourishment Rates",
  titlePanel("Compare Countries Undernourishment by Year"),
  tags$p(
    id = "vis3_descrip",
    "In this page we are trying to look closer at the countries
    whose food price data was measured in USD in order to compare
    undernourishment levels in different years. You can select a
    year and see what the countries undernourishment level is."
  ),
  var1_vis3
)
