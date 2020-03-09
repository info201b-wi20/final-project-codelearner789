library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")

server3 <- function(input, output) {
  output$vis3 <- renderPlot({
    df <- prev_undernourished_final_data %>% 
      select(location_name, year, value) %>%
      filter(location_name %in% c("Zimbabwe", "Honduras", 
                                  "Timor-Leste", "Costa Rica", "El Salvador",
                                  "Honduras", "Panama"))
    title <- paste0("Coutry Undernourishment Rates (", 
                    input$slider_value, ") 2000 - 2017")
    vis_1 <- ggplot(data = df, aes(x = year)) +
      geom_line(mapping = aes(y = input$slider_value, col = location_name)) +
      labs(title = title, 
           x = "Year 2000-2017",
           y = paste0("Undernourishment Values: ",
                      input$slider_value))
    vis_1
  })
  output$info3 <- renderText({
    mess_info3 <- paste0(
      "x = ", input$plot_click3$x,
      " y = ", input$plot_click3$y
    )
    mess_info3
  })
}



