library("dplyr")
library("ggplot2")
library("leaflet")

one_country <- prev_undernourished_final_data %>%
  filter(location_name == "Zimbabwe") %>%
  group_by(year) %>%
  summarize(values_in_percents = mean(value))

first_chart <- function(prev_undernourished_final_data) {
  plot <- ggplot(data = prev_undernourished_final_data) +
    geom_point(mapping = aes(
      x = year,
      y = values_in_percents,
      color = "Zimbabwe"
    )) +
    ggtitle("Zimbabwe Percent Undernourishment 2000 - 2017")
  return(plot)
}
plot_1 <- first_chart(one_country)
