#4.1 Create a Scatter plot with the iris dataset using the ggplot package.
#Add legends, lines, and labels, and use the aes function in the plot.
library(ggplot2)
data("iris")

ggplot(data=iris,mapping=aes(x=Petal.Length,y=Petal.Width))+
  geom_point(aes(color=Species))+
  geom_smooth(method="lm")+
  labs(title="Iris Data",x=" Petal Length", 
       y="Petal Width")+
  geom_label(aes(label=Species,hjust=0),nudge_y=0.1,size=2)



#4.2  Choose a dataset of your choice and plot a Histogram for the same.
ggplot(iris, aes(x=Petal.Length)) + 
  geom_histogram()


#4.3  Choose a dataset of your choice and plot a Bar Graph for the same.
ggplot(iris, aes(x=Species,y=Petal.Length)) + 
  geom_bar(stat = "identity")


#4.4  Choose a dataset of your choice and plot a Box plot for the same.
ggplot(iris, aes(Species,Petal.Length)) + 
  geom_boxplot()

