library(shiny)

calculate_rcf <- function(radius_cm, rpm) {
  rcf <- 11.2 * radius_cm * (rpm / 1000) ^ 2
  return(rcf)
}

calculate_rpm <- function(rcf, radius_cm) {
  rpm <- ((rcf / (11.2 * radius_cm)) ^ 0.5) * 1000
  return(rpm)
}

ui <- fluidPage(
  titlePanel("RCF and RPM Calculator"),
  sidebarLayout(
    sidebarPanel(
      tabsetPanel(
        tabPanel("Calculate RCF",
                 numericInput("radius_rcf", "Enter the radius of the rotor (in centimeters):", value = 1),
                 numericInput("rpm_rcf", "Enter the revolutions per minute (RPM) of the rotor:", value = 100),
                 actionButton("calculate_rcf", "Calculate RCF")),
        tabPanel("Calculate RPM",
                 numericInput("rcf_rpm", "Enter the Relative Centrifugal Force (RCF) in g units:", value = 1000),
                 numericInput("radius_rpm", "Enter the radius of the rotor (in centimeters):", value = 1),
                 actionButton("calculate_rpm", "Calculate RPM"))
      )
    ),
    mainPanel(
      textOutput("rcf_output"),
      textOutput("rpm_output")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$calculate_rcf, {
    radius_cm <- input$radius_rcf
    rpm <- input$rpm_rcf
    rcf <- calculate_rcf(radius_cm, rpm)
    output$rcf_output <- renderText({
      paste("The Relative Centrifugal Force (RCF) is:", round(rcf, 2), "g")
    })
  })
  
  observeEvent(input$calculate_rpm, {
    rcf <- input$rcf_rpm
    radius_cm <- input$radius_rpm
    rpm <- calculate_rpm(rcf, radius_cm)
    output$rpm_output <- renderText({
      paste("The revolutions per minute (RPM) of the rotor is:", round(rpm, 2))
    })
  })
}

shinyApp(ui = ui, server = server)
