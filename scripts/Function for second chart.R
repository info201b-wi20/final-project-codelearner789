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
    geom_bar(mapping = aes(x = commodity_purch, y = price), stat = "identity") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    labs(
      title = "Average price of each commodity type",
      x = "Commodity",
      y = "Average Price"
    )
return(plot_2)
}

plot_2 <- second_chart(all_entries)
 