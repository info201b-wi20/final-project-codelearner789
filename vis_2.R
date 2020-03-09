library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")

prevelence_undernourishment_data <-
  read.csv("data/prevelence_undernourished.csv",
           stringsAsFactors = FALSE)
food_price_data <- read.csv("data/wfp_market_food_prices.csv",
                            stringsAsFactors = FALSE)
colnames(prevelence_undernourishment_data)[colnames(prevelence_undernourishment_data) == "ï..Goal"] <- "Goal"

all_countries <- food_price_data %>%
  group_by(adm0_name) %>%
  summarize(num_countries = n()) %>%
  pull(adm0_name)

# Visualization 2

choose_commodity <- sidebarLayout(
  sidebarPanel(
    selectInput(
      inputId = "commodity",
      label = "Choose a commodity",
      choices = list("Bread" = "Bread", "Wheat" = "Wheat", 
                     "Rice" = "Rice","Maize" = "Maize", 
                     "Sorghum" = "Sorghum",  "Millet" = "Millet")
      ),
    selectInput(
      inputId = "Country",
      label = "Choose a country",
      choices = all_countries,
      selected = all_countries[1],
    )
  ),
  mainPanel(
    tags$h2("Average prices of commodities for Different Countries"),
    plotOutput("plot_no2")
  )
)
<<<<<<< HEAD
=======

vis_2 <- tabPanel(
  "Exploring Commodity Prices",
  choose_commodity
)
>>>>>>> c090bd0aa8edd6ef620706f8da256f2319fa50a6
