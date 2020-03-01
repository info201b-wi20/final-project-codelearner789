rm(list = ls())
library("dplyr")
library("ggplot2")
library("leaflet")

food_prices_dataset <- read.csv("../data/wfp_market_food_prices.csv", stringsAsFactors = FALSE)

one_country <- food_prices_dataset %>%
  filter(adm0_name == "El Salvador") %>%
  group_by(mp_year)%>%
  summarize(average_price = mean(mp_price))
  
first_chart <- function(df) {
  plot <- ggplot(data = df) +
    geom_line(mapping = aes(x = mp_year,
                            y = average_price,
                            ))
  return(plot)
}
plot_1 <- first_chart(one_country)

