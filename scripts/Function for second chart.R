rm(list = ls())
library("dplyr")
library("ggplot2")
library("leaflet")


all_entries <- prev_undernourished_final_data %>%
  
  group_by(commodity_purch, year) %>% 
  summarize(price=mean(price))

second_chart <- function(df) {
  plot_2 <- ggplot(data = df) +
    geom_line(mapping = aes(x = year,
                            y = price,
                            color = commodity_purch))
  return(plot_2)
}
plot_2 <- second_chart(all_entries)
 