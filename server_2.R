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

server2 <- function(input, output) {
  output$plot_no2 <- renderPlot({
    
    df <- food_price_data_final %>%
      filter(year == input$year) %>%
      filter(country_name == input$Country) %>%
      group_by(commodity_purch) %>%
      summarise(price = max(price))
    currency_used <- food_price_data_final %>%
      filter(country_name == input$Country) %>%
      group_by(currency) %>%
      summarize(num = n()) %>%
      pull(currency)
    titleText <- paste0("Average Price in ", currency_used)
    plot <- ggplot(data = df) +
      geom_col(mapping = aes_string(
        x = "commodity_purch",
        y = "price"
      )) +
      theme(axis.text.x = element_text(
        angle = 90, hjust = 1
      )) +
      labs(
        title = titleText,
        x = "Commodity Type",
        y = "Average Price"
      )
    return(plot)
  })
}
