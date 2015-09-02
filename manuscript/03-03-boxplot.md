## Boxplot. 

When visualizing the distribution of a continuous variable, instead of histogram or density plot, you can also use boxplot. For example, we can make a boxplot for `budget` with 5 lines of code.

A>
```r
library(ezplot)
plt = mk_boxplot(films)
title = "Distribution of Budget"
p = plt(xvar="1", yvar="budget", ylab="budget ($)", main=title)
scale_axis(p, axis="y", scale="log10")
```

![Distribution of Budget](images/boxplot_budget-1.png) 

Note the usage of `scale_axis()` above. It changes the y-axis to log10 scale. Also note the usage of `xvar="1"`. The parameter `xvar` needs to take a string representing the x variable name. We pass it the string `"1"` here because we are only visualizing `budget` (on the y-axis) and don't have a x variable. Let's do an example where we also need a x variable. The films in the dataset are made between 1913 and 2014, so an interesting thing to look at is how the distributions of budget change over the years. To do that, we need to draw a boxplot with `budget` on the y-axis and `year` on the x-axis.

A>
```r
title = "Distribution of Budget from 1913 to 2014"
p = plt("year", "budget", ylab="budget ($)", main=title)
scale_axis(p, scale = "log10")
```

![Distribution of Budget Over the Years](images/boxplot_bt_vs_year-1.png) 

We see a general pattern of budget increase, however, it seems the details are too granular and hence a bit distracting. Luckily, there's another variable called `year_cat` that aggregate `year` into 4 brackets. We can use `year_cat` instead of `year` to redraw the plot.

A>
```r
table(films$year_cat)
1913-1950 1950-1970 1970-1990 1990-2014 
      231       243       876      4594 
```

A>
```r
p = plt("year_cat", "budget", ylab="budget ($)", main=title)
print(p)
```

![Distribution of Budget Over the Years](images/boxplot_bt_vs_year_cat_p1-1.png) 

Note that without applying any scale transformations on the y-axis, its tick labels are expressed in scientific notations by default, which makes it difficult to read. We can apply the comma scale to the y-axis to display the numbers in 000,000 format.

A>
```r
scale_axis(p, "y", scale = "comma")
```

![Distribution of Budget Over the Years](images/boxplot_bt_vs_year_cat_p2-1.png) 

Observe that all the boxes are squashed down, indicating `budget` is heavily right-skewed. We can use the function `scale_axis()` to apply the log10 scale on the y-axis.

A>
```r
p = scale_axis(p, scale = "log10")
print(p)
```

![Distribution of Budget Over the Years](images/boxplot_bt_vs_year_cat_p3-1.png) 

Finally, we can use color-blind friendly colors to color the boxes.

A>
```r
red = cb_color("vermilion")
green = cb_color("bluish_green")
purple = cb_color("reddish_purple")
blue = cb_color("blue")
p = p + ggplot2::scale_fill_manual(values = c(red, green, purple, blue))
print(p)
```

![Distribution of Budget Over the Years](images/boxplot_bt_vs_year_cat_p4-1.png) 

Now, it's your turn. Try the following exercises.

1. Draw a plot to show how the distributions of boxoffice change over the years.
2. Draw a plot to show how the distributions of rating change over the years.
3. Draw a plot to show how the distributions of length change over the years.
4. The `films` dataset has a variable named `mpaa` that records the MPAA rating of each film. What type of a variable is it? Can you draw a plot to show the distribution of boxoffice at each MPAA rating?
5. The `films` dataset has a bunch of variables that record the genres, for example, `action`, `comedy`, and etc. Can you draw a plot to show the distribution of boxoffice for each genre?