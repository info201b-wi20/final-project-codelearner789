library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")

server1 <- function(input, output) {
  output$vis1 <- renderPlotly({
    df1 <- prev_final %>%
      select(location_name, year, value) %>%
      filter(location_name %in% c(
        "Zimbabwe", "Honduras",
        "Timor-Leste", "Costa Rica", "El Salvador",
        "Honduras", "Panama"
      )) %>%
      filter(location_name == input$country1)
    vis_1 <- ggplot(data = df1) +
      geom_point(mapping = aes_string(
        x = "year",
        y = "value"
      )) +
      labs(
        title = "Malnourishment Rates over time",
        x = "Year",
        y = "Malnourishment Rate"
      )
    vis_1
  })
}
