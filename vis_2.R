library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")

prevelence_undernourishment_data <-
  read.csv("data/prevelence_undernourished.csv",
           stringsAsFactors = FALSE)
food_price_data <- read.csv("data/wfp_market_food_prices.csv",
                            stringsAsFactors = FALSE)


all_countries <- food_price_data %>%
  group_by(adm0_name) %>%
  summarize(num_countries = n()) %>%
  pull(adm0_name)

# Visualization 2
vis_2 <- tabPanel(
  "Second Visualization",
  choose_commodity,
  choose_country
)
choose_commodity <- sidebarLayout(
  selectInput(
    inputId = "commodity",
    label = "Choose a commodity",
    choices = list("Bread" = "Bread", "Wheat" = "Wheat", 
                   "Rice" = "Rice","Maize" = "Maize", 
                   "Sorghum" = "Sorghum",  "Millet" = "Millet")
    
  ),
  mainPanel(
    "Change commodity",
    plotOutput("")
  ),
)
choose_country <- sidebarLayout(
  selectInput(
    inputId = "Country",
    label = "Choose a country",
    choices = all_countries,
    selected = all_countries[1],
  )
)