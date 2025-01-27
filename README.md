# inotropes-visualization
graphical display of the hemodynamic effects of different cardiac inotropes

### Physiology
Inotropes are medications that augment **cardiac output** (CO)
- **Chronotropic effect** - affects the rate of cardiac contraction (**heart rate**; HR)
- **Inotropic effect** - affects the force of cardiac contraction (**stroke volume**; SV)

Additionally, many inotropes also affect systemic arteriolar vascular tone or afterload. We can describe inotropes in terms of their effects on **systemic vascular resistance** (SVR) as either:
- **Inodilators** - inotropes that decrease SVR
- **Inoconstrictors** - inotropes that increase SVR

In order to understand how these effects interact, recall two important physiology concepts:
```math
CO = HR x SV
```
```math
MAP = CO x SVR
```

The combination of increased CO and decreased SVR can either increase or decrease mean arterial pressure (MAP); for this reason. even though inotropes increase cardiac output, the effects of inodilators on blood pressure can be complex.


### Visualizations
In order to help understand the physiolgical effects of inotropes I made the following visualizations using RStats `plotly` and [htmlwidgets](https://www.htmlwidgets.org/) libraries:

I also made a `Shiny` app version which you can play with [here](https://nickmmark.shinyapps.io/inotropes/).


<img src="https://github.com/nickmmark/inotropes-visualization/blob/main/inotrope_heatmap_updated.png" width="1000" />

<img src="https://github.com/nickmmark/inotropes-visualization/blob/main/inotrope_3d_vis.gif" width="1000" />

### References
- for more see the [Critical Care Time podcast](https://www.criticalcaretime.com/episodes/35-inotropes) I recorded about this!
