# Visualization 1
library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
prev_undernourish <-
  read.csv("data/prevelence_undernourished.csv",
           stringsAsFactors = FALSE)

colnames(prev_undernourish)[colnames(prev_undernourish) == "ï..Goal"] <- "Goal"

prev_final <- select(
  prev_undernourish, GeoAreaName,
  TimePeriod, Value) %>%
  rename(
    location_name = GeoAreaName,
    year = TimePeriod,
    value = Value
  )

prev_undernourished_final_data <- select(
  prev_undernourish, GeoAreaName,
  TimePeriod, Value) %>%
  rename(
    location_name = GeoAreaName,
    year = TimePeriod,
    value = Value
  )

prev_undernourished_final_data <- filter(prev_undernourished_final_data,
                                         location_name != "World")
prev_undernourished_final_data <- as.data.frame(lapply(
  prev_undernourished_final_data,
  function(x) gsub('\"', "", x)
))
prev_undernourished_final_data$year <- as.numeric(
  as.character(prev_undernourished_final_data$year))
prev_undernourished_final_data$value <- as.numeric(
  as.character(prev_undernourished_final_data$value))
prev_undernourished_final_data <- prev_undernourished_final_data[complete.cases(
  prev_undernourished_final_data), ]

prev_final <- filter(prev_undernourished_final_data,
                     location_name != "World")
prev_final <- as.data.frame(lapply(
  prev_final,
  function(x) gsub('\"', "", x)))

prev_final$year <- as.numeric(
  as.character(prev_final$year))
prev_final$value <- as.numeric(
  as.character(prev_final$value))
prev_final <- prev_final[complete.cases(
  prev_final), ]

#Create Visualizations for Page 1
var1_vis1 <- sidebarLayout(
  sidebarPanel(
    selectInput("country1",
                label = h1("Select Country"),
                choices = list("Zimbabwe" = "Zimbabwe",
                               "Honduras" = "Honduras",
                               "Timor-Leste" = "Timor-Leste",
                               "Costa Rica" = "Costa Rica",
                               "El Salvador" = "El Salvador",
                               "Honduras" = "Honduras",
                               "Panama" = "Panama"),
                selected = "Zimbabwe")
  ),
  mainPanel(
    tags$h1("Undernourishment Over the Years in Various Countries"),
    tags$p(
      id = "vis1_descrip",
      "This page aims to display undernourishment in countries that use USD
    over the years. This helps to show the yearly changes in undernourishment
    in these countries. (You can select which country you want displayed by
    selecting a country in the tab on the left.)",
    ),
    plotlyOutput("vis1")
  )
)

# Vis 1
vis_1 <- tabPanel(
  "Undernourishment in Different Countries",
  titlePanel("Comparing Countries Undernourishment Over the Years"),
  var1_vis1
)