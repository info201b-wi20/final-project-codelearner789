rm(list = ls())
library("dplyr")
library("ggplot2")
library("leaflet")
Source("Summary Info Calculations.R")
#Prep data



malnourishment_rate_year <- prev_undernourished_final_data %>%
  group_by(year) %>%
  summarise(avg_percent = mean(value))

create_plot_funct <- function(df) {
  plot_3 <- ggplot(data=df, aes(year,avg_percent)) +
    geom_point() +
    geom_smooth(method="lm", se=F) + 
    labs(subtitle="average percentage by year",
         y="average percent of global population undernourished",
         x="year",
         title="Examining Global Undernourishment",
         caption="Source: UN Sustainability Goals")
  return(plot_3)
}

plot_3 <- create_plot_funct(malnourishment_rate_year)
plot_3
