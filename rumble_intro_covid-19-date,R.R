## Load Library
library(ggplot2)
library(scales)
library(plotly)
###
## Import European CDPC
##
df <- read.csv("./COVID-19.csv")
colnames(df) <- c("Date","Cases","Deaths","Countries","goID","Coninent")
df$Date <- as.Date(df$Date,format="%m-%d-%Y")
df <- df[order(df$Date,decreasing = FALSE),]

str(df)

us_deaths <- subset(df,goID =="US" & Date >="2020-03-01")
us_deaths$cumdeaths <- cumsum(us_deaths$Deaths)
##
us_cases <- subset(df,goID =="US" & Date >="2020-02-28")
us_cases$cumcases <- cumsum(us_cases$Cases)
##
### Daily Cases Deaths Feb. 28 - Present
##

p1 <-ggplot(us_cases) + geom_line(aes(x=Date,y=Cases)) +
  labs(title="US Daily Cases: Feb. 28, 2020 - Present ")

p2 <- ggplot(us_cases) + geom_line(aes(x=Date,y=cumcases)) +
  labs(title="US  Cum.. Cases: Feb. 28, 2020 - Present ")
ggplotly(p1)
ggplotly(p2)


p3 <- ggplot(us_deaths) + geom_line(aes(x=Date,y=Deaths)) +
  labs(title="US Daily Deaths: Mar. 1, 2020 - Present ")

p4 <-ggplot(us_deaths) + geom_line(aes(x=Date,y=cumdeaths)) +
  labs(title="US Cum. Deaths: Mar. 1, 2020 - Present ")

ggplotly(p3)
ggplotly(p4)

## PLotly plot from ggplot2
