# load data

prevelence_undernourishment_data <-
  read.csv("data/prevelence_undernourished.csv",
           stringsAsFactors = FALSE
  )

colnames(prevelence_undernourishment_data)[colnames(prevelence_undernourishment_data) == "ï..Goal"] <- "Goal"

prev_undernourished_final_data <- select(
  prevelence_undernourishment_data, GeoAreaName,
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

#Create Variables & Visualization for Page 3
var1_vis3 <- sidebarLayout(
  sidebarPanel(
    checkboxGroupInput("country3",
                label = h3("Select Countries"),
                choices = list("Zimbabwe" = "Zimbabwe",
                               "Honduras" = "Honduras",
                               "Timor-Leste" = "Timor-Leste",
                               "Costa Rica" = "Costa Rica",
                               "El Salvador" = "El Salvador",
                               "Panama" = "Panama"),
                selected = "Zimbabwe")
    ),
  mainPanel(
    h3("Compare Undernourishment In Countries Where Food Prices are USD"),
    plotOutput("vis3", click = "plot_click3"),
    verbatimTextOutput("info3")
  )
)

# Visualization 3
vis_3 <- tabPanel(
  "Undernourishment Rates",
  titlePanel("Find Which Countries Have Similar Undernourishment Rates"),
  p("In this page we are trying to answer the question of
  which countries are similar in the amount of
  undernourishment their populations are facing.
  You can use the graphics the select a range of values
  and see where countries fall within those
    values of undernourishment."),
  var1_vis3)
   
