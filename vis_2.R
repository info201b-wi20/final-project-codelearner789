library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")

prev_undernourish <-
  read.csv("data/prevelence_undernourished.csv",
    stringsAsFactors = FALSE
  )
food_price_data <- read.csv("data/wfp_market_food_prices.csv",
  stringsAsFactors = FALSE
)
colnames(prev_undernourish)[colnames(prev_undernourish) == "?..Goal"] <- "Goal"

all_countries <- food_price_data %>%
  filter(cur_name == "USD") %>%
  group_by(adm0_name) %>%
  summarize(num_countries = n()) %>%
  pull(adm0_name)

food_price_data_final <- select(
  food_price_data, adm0_name,
  cm_name, cur_name, mp_year, mp_price,
  um_id, um_name
) %>%
  rename(
    country_name = adm0_name,
    commodity_purch = cm_name,
    currency = cur_name,
    year = mp_year,
    price = mp_price,
    unit = um_id,
    unit_type = um_name
  )

all_years <- food_price_data_final %>%
  filter(currency == "USD") %>%
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
      selected = all_countries[6],
    ),
    selectInput(
      inputId = "year",
      label = "Pick year",
      choices = all_years,
      selected = all_years[12]
    )
  ),
  mainPanel(
    tags$h2(
      id = "comp_heading",
      "Average prices of commodities for Different Countries"
    ),
    tags$p(
      id = "price_compare",
      "This portion of the report aims to examine the average prices
      of each commodity sold in any given country that uses US Dollars
      as its main currency. We decided to just stick to exploring the
      average prices of each commodity for countries that use USD
      as their currency so that the user can get more consistent
      comparisons of commodity prices in any given country for any
      given year. Keep in mind, not every country has data for every
      year listed as an option."
    ),
    plotlyOutput("plot_no2")
  )
)

vis_2 <- tabPanel(
  "Exploring Commodity Prices",
  choose_commodity
)
