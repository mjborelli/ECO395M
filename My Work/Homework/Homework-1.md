Question 1
----------

With our Austin flight data, I wanted to look at cancellations not just
by the day of the week, but also by the listed cause of delay.

![](Homework-1_files/figure-markdown_strict/ggplot-1.png)

There are some clear trends that can be seen in these bar graphs.
Carrier cancellations are most common during the week and less common on
weekend flights. NAS cancellations are more common on Monday and
Tuesday, with the rest of the days being fairly similar. Lastly, weather
delays are more common on weekends, but Tuesday seems to be an outlier.

Question 2
----------

The following is from the code Dr. Scott provided that extracts the 350
and 65 AMG trim levels as subsets of the data.

![](Homework-1_files/figure-markdown_strict/subset-1.png)![](Homework-1_files/figure-markdown_strict/subset-2.png)

The following are the Root Mean-Squared Errors (RMSE) for each of the
trim types at specified:

### Trim: 350

-   (K = 5) = 10550.83
-   (K = 10) = 9749.663
-   (K = 25) = 10042.9
-   (K = 50) = 10534.91
-   (K = 100) = 10534.91
-   (K = 150) = 14366.23
-   (K = 200) = 16562.14

### Trim: 65 AMG

-   (K = 5) = 26064.08
-   (K = 10) = 24250.16
-   (K = 25) = 23160.28
-   (K = 50) = 24296.19
-   (K = 100) = 35937.45
-   (K = 150) = 53763.28
-   (K = 200) = 73465.3

We can look at plots of RMSE versus K to estimate what the optimal K is
for each trim.

![](Homework-1_files/figure-markdown_strict/plots2-1.png)

For the 350 trim, our optimum value of K is K = 15

![](Homework-1_files/figure-markdown_strict/65plot-1.png) It is harder
to tell for the 65 AMG trim, but it seems that our optimal K is
approximately 25.

![](Homework-1_files/figure-markdown_strict/plotting-1.png)![](Homework-1_files/figure-markdown_strict/plotting-2.png)

Of the two trims, the 350 trim has a higher optimal K than the 65 AMG
trim. This has nothing to do with the difference in the trims. The main
reason for the difference is that the subset of S-Class cars with 350
trim is larger than the subset with 65 AMG trim. When you have more
data, the optimal value for K increases because your points will be
closer together and therefore create better predictions.
