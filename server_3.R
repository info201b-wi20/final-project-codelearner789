library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")

server3 <- function(input, output) {
  output$vis3 <- renderPlot({
    df3 <- prev_undernourished_final_data %>% 
      select(location_name, year, value) %>%
      filter(location_name %in% c("Zimbabwe", "Honduras", 
                                  "Timor-Leste", "Costa Rica", "El Salvador",
                                  "Honduras", "Panama"))
    title <- paste0("Coutry Undernourishment Rates (", 
                    input$slider_value, ") 2000 - 2017")
    vis_3 <- ggplot(data = df3) +
      geom_line(mapping = aes_string(x = "year", y = input$slider_value), 
                colour = "location_name") +
      labs(title = title, 
           x = "Year 2000-2017",
           y = paste0("Undernourishment Values: ",
                      input$slider_value))
    vis_3
  })
  output$info3 <- renderText({
    mess_info3 <- paste0(
      "x = ", input$plot_click3$x,
      " y = ", input$plot_click3$y
    )
    mess_info3
  })
}



