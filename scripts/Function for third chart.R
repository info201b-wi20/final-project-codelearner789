rm(list = ls())
library("dplyr")
library("ggplot2")
library("leaflet")
Source("Summary Info Calculations.R")
#Prep data



malnourishment_rate_year <- prev_undernourished_final_data %>%
  group_by(year) %>%
  summarise(avg_percent = mean(value))

# mean_val <- median(malnourishment_rate_year %>% pull(avg_percent), na.rm = TRUE)
# malnourishment_rate_year$`country name` <-rownames(malnourishment_rate_year)
# 
# malnourishment_rate_year$percent_z <- round((malnourishment_rate_year$avg_percent - mean(malnourishment_rate_year$avg_percent))
#                                             /sd(malnourishment_rate_year$avg_percent), 3)
# 
# malnourishment_rate_year$diff_from_avg <- 
#   ifelse(malnourishment_rate_year$percent_z < 12, "below", "above")
# 
# malnourishment_rate_year <- 
#   malnourishment_rate_year[order(malnourishment_rate_year$percent_z), ]
# malnourishment_rate_year$`country name` <- factor(malnourishment_rate_year$`country name`, 
#                                                   levels = malnourishment_rate_year$`country name`)
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
