library(shiny)
library(plotly)

# Define UI
ui <- fluidPage(
  # titlePanel("Visualizing the Hemodynamic effects of Inotropes & Vasopressors"),
  mainPanel(
    plotlyOutput("hemodynamicPlot", height = "800px", width = "100%") # Larger full-page plot
  )
)

# Define server logic
server <- function(input, output, session) {
  # Define data
  data <- data.frame(
    x = c(2, 2.1, 2, 2.2, 1.5, 1, 0.2, 0.5, 1.4, 0.5), # inotropic effect
    y = c(1.5, 1.8, 2.2, 2.5, 0, 0.5, 0.3, 0.8, 0.2, 0.7), # chronotropic effect
    z = c(-1.2, 2, 1.8, -0.5, -2, 2, -1, 1, -1.8, 2), # vascular effect
    labels = c("Dobutamine", "Epinephrine (high dose)", "Dopamine (high dose)", 
               "Isoproterenol", "Milrinone", "Norepinephrine", 
               "Dopamine (low dose)", "Epinephrine (low dose)", 
               "Levosimendan", "Angiotensin II")
  )
  
  # Render plotly plot
  output$hemodynamicPlot <- renderPlotly({
    plot_ly(
      data, 
      x = ~x, 
      y = ~y, 
      z = ~z, 
      type = 'scatter3d', 
      mode = 'markers+text',
      text = ~labels, 
      textposition = 'top right',
      marker = list(
        size = 5, 
        color = ~z, 
        colorscale = c('blue', 'white', 'red'), 
        cmin = -2, 
        cmax = 2,
        colorbar = list(
          title = "Vascular Effect\n(BLUE=Vasodilator, RED=Vasoconstrictor)",
          orientation = "h",  # Horizontal orientation
          xanchor = "center",
          x = 0.5,  # Center the colorbar
          y = -0.2  # Move below the plot
        )
      )
    ) %>%
      layout(
        title = "Visualizing the Hemodynamic effects of Inotropes & Vasopressors",
        scene = list(
          xaxis = list(title = "Inotropic Effect", showticklabels = FALSE),
          yaxis = list(title = "Chronotropic Effect", showticklabels = FALSE),
          zaxis = list(title = "Vascular Effect", showticklabels = FALSE),
          camera = list(
            eye = list(x = 1.5, y = 1.5, z = 1.5) # Initial rotation
          )
        )
      )
  })
}

# Run the app
shinyApp(ui = ui, server = server)


