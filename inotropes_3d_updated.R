# Load required library
library(plotly)

# Define data - modified from several sources. See www.criticalcaretime.com episode on inotropes for more
data <- data.frame(
  x = c(2, 2.1, 2, 2.2, 1.5, 1, 0.2, 0.5, 1.4, 0.5), # inotropic effect
  y = c(1.5, 1.8, 2.2, 2.5, 0, 0.5, 0.3, 0.8, 0.2, 0.7), # chronotropic effect
  z = c(-1.2, 2, 1.8, -0.5, -2, 2, -1, 1, -1.8, 2), # vascular effect (negative = vasodilator, positive = vasoconstrictor)
  labels = c("Dobutamine", "Epinephrine (high dose)", "Dopamine (high dose)", "Isoproterenol", "Milrinone", "Norepinephrine", "Dopamine (low dose)", "Epinephrine (low dose)", "Levosimendan", "Angiotensin II")
)

# Create 3D scatter plot
fig <- plot_ly(data, x = ~x, y = ~y, z = ~z, type = 'scatter3d', mode = 'markers+text',
               text = ~labels, textposition = 'top right',
               marker = list(size = 5, color = ~z, colorscale = c('blue', 'white', 'red'), 
                             cmin = -2, cmax = 2, 
                             colorbar = list(title = "Vascular Effect\n(BLUE=Vasodilator, RED=Vasoconstrictor)")))

# Customize layout
fig <- fig %>% plotly::layout(
  title = "Inotrope Hemodynamic Effect Visualization",
  scene = list(
    xaxis = list(title = "Inotropic Effect", showticklabels = FALSE),  # X-axis with no numbers
    yaxis = list(title = "Chronotropic Effect", showticklabels = FALSE),  # Y-axis with no numbers
    zaxis = list(title = "Vascular Effect", showticklabels = FALSE)  # Z-axis with no numbers
  )
)

# Save the interactive plot as an HTML file
library(htmlwidgets)
saveWidget(fig, "inotrope_hemodynamic_effect.html", selfcontained = TRUE)

# Display plot
fig
