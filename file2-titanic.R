library(ggplot2)
library(RColorBrewer)

data <- read.csv("titanic.csv", header = TRUE)

#1- Generate a series of bar charts to describe the gender, ticket class and survival
#of the passengers onboard.

gen_bar <- ggplot(data)+geom_bar(aes(x= Sex)) +
  labs(title = "Gender Bar Plot", x = "Gender")+theme_light()
gen_bar

tic_bar <- ggplot(data)+geom_bar(aes(x= Pclass, colour = Pclass, fill = Pclass))+
  labs(title = "Ticket Class Bar Plot", x = "Ticket Class")
tic_bar

survival_bar <- ggplot(data)+geom_bar(aes(x= Survived, fill = Survived)) +
  labs(title = "Survival Bar Plot", x= "Survived")
survival_bar

#Generate a histogram for the passengers' age. Furthermore, describe the
#passengers' age using the following two boxplots: age per ticket class and age
#based on survival

age_hist <- ggplot(data) + aes(x = Age) + geom_histogram()
age_hist

age_tic_box <- ggplot(data)+ geom_boxplot(aes(y= Age))+
  facet_grid(~Pclass)+
  labs(title ='Age per Ticket class', y = 'Age of Passangers', x = "Ticket Class")
age_tic_box

age_tic_box +theme_light()

age_survival <-ggplot(data)+ geom_boxplot(aes(y= Age))+
  facet_grid(~Survived)+
  labs(title ='Age of passangers based on survival', y = 'Age of Passangers', 
       x = "Survial")
age_survival

#Generate a histogram for the travel fare and a table showing the number of
#people who did not pay - you may want to check on Google why a handful of
#people was on board for free!

(travel_fare <- ggplot(data) + geom_histogram(aes(x= Fare))+
    labs(title='Travel Fare price', x = "Fare Rate"))

library(dplyr)
fare <- select(data, "Fare", "Name")
fare <- filter(fare,Fare == 0)
head(fare)

#A chart of your choice to describe the family size per ticket class

fam_size <- mutate(data, fam = SibSp + Parch)

fam_size_plot <- ggplot(fam_size) + geom_bar(aes(x= fam)) + facet_grid(~Pclass)+
  labs(title ="Family Size per Ticket Class", y= "Family size", x= "Ticket Class")
fam_size_plot


#A series of stacked bar charts to show the how survival differs for different
#gender and ticket class

a <- ggplot(data) + aes(x= Pclass, fill = Sex) + geom_bar()+
  theme_light() + facet_grid(~ Survived) + 
  labs(title = "Survival based on Gender and Ticket Class", x = "Ticket Class")
a

#A violin chart describing how survival related to age and gender 

violin1 <- ggplot(data)+aes( y = Age, x = Sex, fill = Sex)+ geom_violin()+
   theme_light()+ facet_grid(~Survived)
  labs ( title = "Survival relation to age and gender", y = "Age" , x = "Gender")
violin1

#A violin chart describing the survival rate related to age and ticket class

Survival_data <- select(data, Pclass, Age , Survived)  %>% arrange(Pclass, Age)

 





