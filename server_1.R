library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")

server1 <- function(input, output) {
  one_country <- prev_undernourished_final_data %>%
    filter(location_name == "Zimbabwe") %>%
    group_by(year)%>%
    summarize(values_in_percents = mean(value))
  
  first_chart <- function(df) {
    plot <- ggplot(data = df) +
      geom_point(mapping = aes(x = year,
                               y = values_in_percents,
                               color = "Zimbabwe",
      )) +
      ggtitle("% of Population Undernourished in Zimbabwe")
    return(plot)
  }
  plot_1 <- first_chart(one_country)
  
}
