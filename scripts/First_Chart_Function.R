library("dplyr")
library("ggplot2")
library("leaflet")

one_country <- prev_undernourished_final_data %>%
  filter(location_name == "Zimbabwe") %>%
  group_by(year)%>%
  summarize(values_in_percents = mean(value))
  
first_chart <- function(df) {
  plot <- ggplot(data = df) +
    geom_point(mapping = aes(x = year,
                            y = values_in_percents,
                            color = "Zimbabwe",
                            ))
  return(plot)
}
plot_1 <- first_chart(one_country)

