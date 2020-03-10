library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
source("server_1.R")
source("server_2.R")
source("server_3.R")
server <- function(input, output) {
  server1(input, output)
  server2(input, output)
  server3(input, output)
}

