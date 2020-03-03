rm(list = ls())
library("dplyr")
library("ggplot2")
library("leaflet")


malnourishment_Zimbabwe <- prev_undernourished_final_data %>%
  filter(location_name == "Zimbabwe") %>%
  filter(value == max(value)) %>%
  pull(year)

all_entries <- food_price_data_final %>%
  filter(year == malnourishment_Zimbabwe) %>%
  filter(country_name == "Zimbabwe") %>%
  group_by(commodity_purch) %>% 
  summarize(price= max(price))

second_chart <- function(df) {
  plot_2 <- ggplot(data = df) +
    geom_bar(mapping = aes(x = commodity_purch, y = price), stat = "identity")
  
return(plot_2)
}

plot_2 <- second_chart(all_entries)
 