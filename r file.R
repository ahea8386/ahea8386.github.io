library(tidyverse)
library(easystats)

drivers <- read.csv('./csv_files/drivers.csv')
driver_standings <- read.csv('./csv_files/driver_standings.csv')
View(driver_standings)
driver_df <- merge.data.frame(drivers, driver_standings)
View(driver_df)

driver_df %>%
  ggplot(aes(x = nationality, y = wins)) +
  geom_point(color = 'cornflowerblue') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Correlation between Nationality and # of Wins",
     x = "Nationality",
     y = "# of Race Wins")
ddf <- read.csv('./csv_files/F1Drivers_Dataset.csv')
View(ddf)

ddf %>%
  ggplot(aes(x = Decade, y = Race_Wins)) +
  geom_col(fill = 'darkred') +
  theme_minimal() +
  labs(title = "Correlation between Time and Race Wins",
       x = "Time (in decades)",
       y = "Race Wins")

ddf %>%
  ggplot(aes(x = Race_Starts, y = Race_Wins, color = Decade)) +
  geom_col() +
  theme_minimal() +
  labs(title = "Correlation between # of Race Starts and Race Wins",
       x = "# of Race Starts",
       y = "# of Race Wins")

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


compare_performance(mod5, mod4, mod3) %>% plot()
summary(mod3)  

broom::tidy(mod3) %>%
  filter(p.value < 0.05)
