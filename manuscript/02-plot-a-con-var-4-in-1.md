# Plot the Distribution of a Continuous Variable

Let's begin with an example. First, we load the ezplot package, which contains a dataset of films from IMBD.com. 

A>
```r
library(ezplot)
?films
```

The variable `budget` is continuous, and we can look at its distribution using the `plt_dist()` function. 

A>
```r
plt = plt_dist(films) # plt_dist() returns a function
plt("budget") # notice the quotation marks 
```

![Distribution of Budget](images/dist_budget-1.png) 

It outputs four plots in one panel: histogram, density plot, boxplot and qqplot. The first three plots show the shape of its distribution, and we see it has a long right tail. The qqplot shows its deviation from normality. We see that it isn't close to being normally distributed because a normal distribution would have most of the blue dots aligned linearly along the 45 degree diagonal line connecting the bottom left corner to the upper right corner. 

Pay attention to how we used `plt_dist()`: first, we pass to it the data frame `films`, and it returns a function, which we assign to a variable `plt`; next, we call `plt()` and pass to it the name of the variable we want to visualize, in this case, `"budget"`. You should take a moment and make a mental note about this as you'll see in the later chapters, this is how you use every plotting function in the ezplot package. All ezplot plotting functions are designed as [functions that return functions](http://masterr.org/r/functions-that-return-functions/). And this design has two benefits: 

1. Consistent Interface. Every plotting function takes a data frame as input and returns a function as output. If you've used R a lot, you know the frustration of having to remember different types of input and output across different functions. Guess what? You'll never have this problem when using ezplot functions. The consistent interface eliminates this frustration and frees up your brain cells so that you can focus on what a function does, for example, draw a boxplot or histogram, rather than how it does it. 

2. Reusability. The output function can be used to visualize more than one variables in the same data frame. For example, instead of calling `plt("budget")`, we can use `plt()` to visualize another continuous variable `boxoffice`. This is really handy since a dataset rarely only contains one continuous variable or one categorical variable, and we almost always want to visualize every variable and their relationships when we do descriptive and exploratory analyses. 

A>
```r
plt("boxoffice") # notice the quotation marks 
```

![Distribution of Boxoffice](images/dist_bo-1.png) 

Let's look at the two plots drawn above for a moment. Both budget and boxoffice have a long right tail. And we can make the long right tail disappear by taking the log transformation. For example, we can append to `films` a new variable called `log_budget` by taking the log of budget. We'd like to visualize `log_budget`, however, because `films` is updated, we need to call `plt_dist()` on `films` again, which will output a new function that we can use to draw, and we'll assign it to the variable `plt2`. Finally, to make the plot, we'll simply call `plt2("log_budget")`.

A>
```r
films$log_budget = log(films$budget)
plt2 = plt_dist(films)
plt2("log_budget")
```

![Distribution of log(Budget)](images/dist_log_budget-1.png) 

We see that after taking log, budget becomes more or less bell-shaped, though it's still not quite normal because of the slight long left tail. For all practical purpose, this is good enough. By the way, the reason why we care about normality is that many statistical methods, for example, linear regression, are devised based on the assumption of a normal distribution. In order to use these methods correctly, we need to make sure the input data are approximately normally distributed. When encountering long right tailed continuous data, we can often make it more normal by taking the log of its values. Oh, there's one more thing: the color used in the plots is color-blind friendly. We'll talk more about colors in later chapters, for now, let's take a break. 
