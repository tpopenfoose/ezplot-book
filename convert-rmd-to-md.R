rm(list=ls())

# set opts
library(knitr)
opts_knit$set(out.format = "markdown")
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = FALSE,
               echo = TRUE, fig.path='images/', fig.width = 7, fig.height = 7, 
               dev = 'png') # don't use fig.align, it forces html code for img
options(width = 100, scipen = 5, digits = 5)

# set paths
proj_path = "~/write/ezplot-book"
manu_path = file.path(proj_path, "manuscript")
setwd(manu_path)
rmd_path = file.path(manu_path, "Rmd")

# file_in = file.path(rmd_path, "01-set-up.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "02-plot-a-con-var-4-in-1.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-01-histogram.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-02-densityplot.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-03-boxplot.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-04-intervalplot.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-05-scatterplot.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-06-barplot-1.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-06-barplot-2.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-06-barplot-3.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-07-areaplot.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-08-lineplot.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-09-slopeplot.Rmd")
# knitr::knit(file_in)

# file_in = file.path(rmd_path, "03-10-heatmap.Rmd")
# knitr::knit(file_in)

file_in = file.path(rmd_path, "")
knitr::knit(file_in)
