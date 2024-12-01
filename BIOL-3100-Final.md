---
title: "How Different Aspects of a Formula 1 Team Affect Success"
output: 
  html_document:
    keep_md: true
---




## Introduction

This project aims to analyze different aspects of a Formula 1 driver and how they contribute to the wins or loses of a team. 

![Image1](./media/formula_one_car.jpg)

## Background

Formula 1 is one of the highest levels in motorsport in the world. Wins and loses can come down to a matter of seconds or inches. It is a premier level of racing that has been around since 1950. Billions of dollars go into Formula 1 teams in order to be the most successful and win the most races. Over time this success has been defined by a teams ability to understand details about the car and driver that can lead to success. Massive amounts of data are necessary to ensure the optimal performance and success of a Formula 1 team. 

There is a well-known quote by the Mercedes Formula 1 team that states "Races are won at the track. Championships are won at the factory." (2019) The data used to build formula cars is kept secret by Formula 1 teams but understanding how different factors affect performance can better help fans enjoy the work that goes into the success of a team. One aspect that I wanted to focus on was the driver. This is the aspect of racing that fans have the most information about and so it is the easiest to analyze. 

## Data

The data for this project was found on Kaggle. The name of the data set is Formula 1 World Championship. It contains data on circuits, teams, drivers, lap times, pit stops, and race results. The datasets used for this research focus on the details of the drivers. 

The data was loaded into R and combined. I had multiple data sets that had different information on drivers. The data sets were loaded into R and then combined to be more useable. 

Different variables were explored by making graphs and analyzing the correlation. The # of wins was the primary variable explored.


![Image1](./media/Figure_1.png)
The graph above shows how different nationalities have different rates of winning a Formula 1 race. This is likely due to differences in popularity across the world and not due to inherent differences in skill due to nationality. 



![](BIOL-3100-Final_files/figure-html/graph for time-1.png)<!-- -->

The graph above shows how the number of race wins has increased over time. This is likely due to the increased number of races on the Formula 1 calendar. The 2020 bar is significantly shorter but this is likely due to the decade still occurring. 

![](BIOL-3100-Final_files/figure-html/race starts graph-1.png)<!-- -->

The final graph shows the relationship between the # of race starts and the # of race wins. It is logical that more race starts would lead to more race wins. The graph is colored by time. Earlier decades tended to have less race starts as well as less race wins. 

## Modeling

After exploring and cleaning the data, different variables were modeled to see their affect on the number of race wins a driver would have. Five models were created in total. Below shows the code for the various models explored. 


``` r
mod1 <- glm(data = ddf,
            formula = Race_Wins ~ Years_Active * Decade)

mod2 <- glm(data = ddf,
            formula =  Race_Wins ~ Decade * Race_Starts)

mod3 <- glm(data = ddf,
            formula =  Race_Wins ~ Nationality * Pole_Positions)

mod4 <- glm(data = ddf,
            formula =  Race_Wins ~ Nationality * Race_Starts)

mod5 <- glm(data = ddf,
            formula =  Race_Wins ~ Years_Active * Pole_Positions)
```

The models created above were further compared using the easystats package. This package made it simple to analyze different aspects of the model and choose the best output. Below is a graph from the compare_performance function. Model 3 was chosen from the five models above because of its slightly better fit than model 5. It lacks in the BIC statistic when compared to model 5 but it's fit is better in every other aspect.

![](BIOL-3100-Final_files/figure-html/show comparison-1.png)<!-- -->

Finally this model output was modified to show only the significant variables at the 0.05 level. An output of 13 variables is given. 


```
## # A tibble: 13 × 5
##    term                                    estimate std.error statistic  p.value
##    <chr>                                      <dbl>     <dbl>     <dbl>    <dbl>
##  1 NationalityGermany                        -1.13     0.533      -2.12 3.46e- 2
##  2 Pole_Positions                             0.865    0.0505     17.1  3.88e-56
##  3 NationalityBrazil:Pole_Positions          -0.190    0.0547     -3.47 5.42e- 4
##  4 NationalityColombia:Pole_Positions        -0.326    0.146      -2.23 2.57e- 2
##  5 NationalityFrance:Pole_Positions           0.363    0.0632      5.74 1.35e- 8
##  6 NationalityGermany:Pole_Positions          0.280    0.0535      5.24 2.08e- 7
##  7 NationalityMonaco:Pole_Positions          -0.587    0.106      -5.53 4.30e- 8
##  8 NationalityNetherlands:Pole_Positions      0.850    0.0876      9.70 4.23e-21
##  9 NationalityNew Zealand:Pole_Positions     -0.865    0.314      -2.75 6.05e- 3
## 10 NationalitySouth Africa:Pole_Positions     2.47     0.498       4.95 8.89e- 7
## 11 NationalitySpain:Pole_Positions            0.580    0.0851      6.81 1.88e-11
## 12 NationalityUnited Kingdom:Pole_Positio…    0.128    0.0520      2.45 1.44e- 2
## 13 NationalityUnited States:Pole_Positions   -0.211    0.0908     -2.32 2.06e- 2
```

## Discussion

This data set did not have as much information as was expected. Different variables did have a significant affect of the number of race wins that a driver had. It was interesting to see how different factors like the # of years active or pole positions contributed to a better model. Overall the skill of a driver is hard to define with the variables available to the average person. It is unlikely that a prediction of a driver's skill could be made off of age, nationality, or # of race starts alone. It would be more beneficial to have performance data of time on certain tracks or number of crashes to assess the compentancy of a driver. 

Unfortunately since much of the data surrounding Formula 1 teams is proprietary, it is difficult to make real and important models and comparisons with the data that is available. 
 




