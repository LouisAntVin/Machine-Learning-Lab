library(ggplot2)
data("iris")

ggplot(iris,aes(x=Petal.Length,y=Petal.Width))+
  geom_point(aes(shape=factor(Species)))+
  geom_point(aes(color=factor(Species)))+
  geom_smooth(method="lm")

ggplot(data=iris,mapping=aes(x=Petal.Length,y=Petal.Width))+
  geom_point(aes(color=Species))+
  geom_smooth(method="lm")+
  labs(title="Iris Data",x=" Petal Length", 
       y="Petal Width")+
  geom_label(aes(label=Species),nudge_y=0.1,size=2)

data("Titanic")
df=data.frame(Titanic)
ggplot(df, aes(x=Freq)) + 
  geom_histogram(col="black",fill="red",bins = 10)+
  ggtitle("Titanic")
