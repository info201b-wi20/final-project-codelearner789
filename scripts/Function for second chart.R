library("dplyr")
library("ggplot2")
library("leaflet")


malnourishment_zimbabwe <- prev_undernourished_final_data %>%
  filter(location_name == "Zimbabwe") %>%
  filter(value == max(value)) %>%
  pull(year)

all_entries <- food_price_data_final %>%
  filter(year == malnourishment_zimbabwe) %>%
  filter(country_name == "Zimbabwe") %>%
  group_by(commodity_purch) %>%
  summarize(price = max(price))

second_chart <- function(df) {
  plot_2 <- ggplot(data = df) +
    geom_bar(mapping = aes(
      x = commodity_purch,
      y = price
    ), stat = "identity") +
    theme(axis.text.x = element_text(
      angle = 90, hjust = 1
    )) +
    labs(
      title = "Average price of each commodity type in Zimbabwe 2015",
      x = "Commodity (5kg)",
      y = "Average Price USD"
    )
  return(plot_2)
}
plot_2 <- second_chart(all_entries)
plot_2
