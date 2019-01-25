## Irine Moore
## Jan 25 2019
## Tidy_verse

install.packages("tidyverse")
library(tidyverse)
install.packages("Rmisc")
library(Rmisc)
library(ggplot2)

###ggplot2

a<- ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y = hwy, color=class))+
  theme_classic()

## to specify for the whole plot color, put it outside aes


b<- ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y = hwy), color="purple")+
  theme_classic()

## plot for each group
c<- ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y = hwy), color="purple")+
  theme_classic()+
  facet_wrap(~ class, nrow = 2)
#line geom, plus data
d<- ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), color="Red")+
  geom_point(mapping = aes(x=displ, y = hwy, color=drv))+
  theme_bw()

#change line color
e<- ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv))+
  geom_point(mapping = aes(x=displ, y = hwy, color=drv))+
  theme_bw()

##global aesthetics, no SE for curves
 
f<- ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color=drv)) + 
  geom_smooth(se=F)+ 
  geom_point()+
  theme_bw()

multiplot(a,b,c,d,e,f, cols=2)

##same plots

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

## change the color for the dfferent groups in scatter plot
a1<-ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(color=drv))+ 
  geom_smooth()+ggtitle(label=" scatter colored by group")+
  


## change the color for the smooth lines for each group

a2<-ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(aes(color=drv))+
  ggtitle(label=" smooth lines for each group")+
  guides(fill=FALSE, color=FALSE) # remove legend
 

##for all
a3<-ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(color=drv)) + 
  geom_smooth(aes(color=drv))+
ggtitle(label="Complete plot")+
  guides(fill=FALSE, color=FALSE) # remove legend


multiplot(a1,a2,a3,a4, cols=2)

## Bar plots

# Diamonds data
attach(diamonds)
a4<-ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill=cut, color=cut))




