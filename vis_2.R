library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")

prevelence_undernourishment_data <-
  read.csv("data/prevelence_undernourished.csv",
           stringsAsFactors = FALSE)
food_price_data <- read.csv("data/wfp_market_food_prices.csv",
                            stringsAsFactors = FALSE)
colnames(prevelence_undernourishment_data)[colnames(prevelence_undernourishment_data) == "?..Goal"] <- "Goal"

all_countries <- food_price_data %>%
  group_by(adm0_name) %>%
  summarize(num_countries = n()) %>%
  pull(adm0_name)

food_price_data_final <- select(food_price_data, adm0_name,
                                cm_name, cur_name, mp_year, mp_price,
                                um_id, um_name) %>%
  rename(
    country_name = adm0_name,
    commodity_purch = cm_name,
    currency = cur_name,
    year = mp_year,
    price = mp_price,
    unit = um_id,
    unit_type = um_name)

all_years <- food_price_data_final %>%
  group_by(year) %>%
  summarise(num_recorded = n()) %>%
  pull(year)
# Visualization 2

choose_commodity <- sidebarLayout(
  sidebarPanel(
    selectInput(
      inputId = "Country",
      label = "Choose a country",
      choices = all_countries,
      selected = all_countries[1],
    ),
    selectInput(
      inputId = "year",
      label = "Pick year",
      choices = all_years,
      selected = all_years[22]
    )
  ),
  mainPanel(
    tags$h2("Average prices of commodities for Different Countries"),
    plotOutput("plot_no2")
  )
)

vis_2 <- tabPanel(
  "Exploring Commodity Prices",
  choose_commodity
)
