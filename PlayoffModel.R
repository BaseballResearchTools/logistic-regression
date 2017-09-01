#############################################
# MLB Win Curve - Logistic Regression Model #
#############################################


# read data
PlayoffData = read.csv("PlayoffData.csv")


# fit Logistic Regression model & predict model
PlayoffModel = glm(Playoffs ~ Wins, data = PlayoffData, family = binomial)

summary(PlayoffModel)


predictions = predict(PlayoffModel, type="response")



# plot Win Curve
library(ggplot2)

ggplot(PlayoffModel, aes(x=Wins, y=Playoffs)) +
  geom_point() +
  stat_smooth(method="glm", family="binomial", fill="grey60", size=1.18, na.rm=TRUE) +
  xlim(75, 100) + 
  theme(axis.text = element_text(size = 12))