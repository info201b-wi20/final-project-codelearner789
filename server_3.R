library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
# Visualization showing malnourishment rates by year
server3 <- function(input, output) {
  output$vis3 <- renderPlotly({
    df3 <- prev_undernourished_final_data %>%
      select(location_name, year, value) %>%
      filter(location_name %in% c(
        "Zimbabwe", "Honduras",
        "Timor-Leste", "Costa Rica", "El Salvador",
        "Honduras", "Panama"
      )) %>%
      filter(year == input$year3)
    vis_3 <- ggplot(data = df3) +
      geom_bar(
        mapping = aes_string(
          x = "location_name", y = "value",
          fill = input$year3
        ),
        stat = "identity"
      ) +
      labs(
        title = "\n Country Undernourishment Rates by Year",
        x = "Countries Whose Food Prices Measuerd in USD",
        y = "Undernourishment Values (Millions of People)",
        fill = "year"
      )
    vis_3
  })
}
