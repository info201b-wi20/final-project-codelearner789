rm(list = ls())
library("dplyr")
library("ggplot2")
library("leaflet")

food_prices_dataset <- read.csv("../data/wfp_market_food_prices.csv", stringsAsFactors = FALSE)

food_entry_vec <- c("Rice", "Beans", "Meat (chicken, imported)")
all_entries <- food_prices_dataset %>%
  filter(cur_name == "USD") %>% 
  filter(cm_name %in% food_entry_vec) %>%
  group_by(cm_name, mp_year) %>% 
  summarize(price=mean(mp_price))

second_chart <- function(df) {
  plot_2 <- ggplot(data = df) +
    geom_line(mapping = aes(x = mp_year,
                            y = price,
                            color = cm_name))
  return(plot_2)
}
plot_2 <- second_chart(all_entries)
 