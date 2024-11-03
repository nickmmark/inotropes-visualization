# Inotrope hemodynamic effect visualization
# By Nick Mark 10/2/2024

# Load required library
library(ggplot2)

# Define data - modified from several sources. See www.criticalcaretime.com episode on inotropes for more
data <- data.frame(
  x = c(2, 2.1, 2, 2.2, 1.5, 1, 0.2, 0.5, 1.4, 0.5), # inotropic effect
  y = c(1.5, 1.8, 2.2, 2.5, 0, 0.5, 0.3, 0.8, 0.2, 0.7), # chronotropic effect
  z = c(-1.2, 2, 1.8, -0.5, -2, 2, -1, 1, -1.8, 2), # vascular effect (negative = vasodilator, positive = vasoconstrictor)
  labels = c("Dobutamine", "Epinephrine (high dose)", "Dopamine (high dose)", "Isoproterenol", "Milrinone", "Norepinephrine", "Dopamine (low dose)", "Epinephrine (low dose)", "Levosimendan", "Angiotensin II")
)

# Create XY plot with heatmap colors based on Z axis
ggplot(data, aes(x = x, y = y)) +
  geom_point(aes(color = z), size = 5) +               # Color by Z value
  geom_text(aes(label = labels), hjust = -0.1, vjust = -0.5) +  # Adjust label positioning
  scale_color_gradient2(
    low = "blue", mid = "white", high = "red", midpoint = 0,
    name = "Vascular Effect\n(BLUE=Vasodilator, RED=Vasoconstrictor)"
  ) +
  labs(
    title = "Inotrope Comparison",
    x = "Inotropic Effect",
    y = "Chronotropic Effect"
  ) +
  coord_cartesian(xlim = c(min(data$x), max(data$x) + 0.8),     # expand space for labels to fit
                  ylim = c(min(data$y), max(data$y) + 0.0 )) + 
  theme_minimal() +
  theme(
    axis.text.x = element_blank(),  # Remove X-axis numbers
    axis.text.y = element_blank(),  # Remove Y-axis numbers
    legend.text = element_blank()   # Remove numbers from the color scale
  )
