library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
  titlePanel("Aquarium Parameters"),
  sidebarLayout(
    sidebarPanel(
      numericInput("day", "Enter Day:", 1, min = 1),
      numericInput("ammonia", "Enter Ammonia Level (mg/L):", 0, min = 0, step = 0.01),
      numericInput("nitrite", "Enter Nitrite Level (mg/L):", 0, min = 0, step = 0.01),
      numericInput("nitrate", "Enter Nitrate Level (mg/L):", 0, min = 0, step = 0.01),
      numericInput("ph", "Enter pH Level:", 7, min = 0, max = 14, step = 0.01),
      actionButton("addData", "Add Data"),
      actionButton("resetData", "Reset Data")
    ),
    mainPanel(
      plotOutput("aquariumPlot")
    )
  )
)

# Define server
server <- function(input, output) {
  data <- reactiveVal(data.frame(day = numeric(0), ammonia = numeric(0), nitrite = numeric(0), nitrate = numeric(0), ph = numeric(0)))

  observeEvent(input$addData, {
    new_data <- data.frame(
      day = input$day,
      ammonia = input$ammonia,
      nitrite = input$nitrite,
      nitrate = input$nitrate,
      ph = input$ph
    )
    data(rbind(data(), new_data))
  })

  observeEvent(input$resetData, {
    data(data.frame(day = numeric(0), ammonia = numeric(0), nitrite = numeric(0), nitrate = numeric(0), ph = numeric(0)))
  })

  output$aquariumPlot <- renderPlot({
    ggplot(data(), aes(x = day)) +
      geom_line(aes(y = ammonia, color = "Ammonia"), size = 1.5) +
      geom_line(aes(y = nitrite, color = "Nitrite"), size = 1.5) +
      geom_line(aes(y = nitrate, color = "Nitrate"), size = 1.5) +
      geom_line(aes(y = ph, color = "pH"), size = 1.5) +
      labs(title = "Aquarium Parameters", x = "Days", y = "Concentration / pH") +
      theme_minimal()
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
