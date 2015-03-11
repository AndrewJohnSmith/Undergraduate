#Set working directory using >Session>Set Working Directory>Choose Directory
setwd("/Users/Home/Desktop/RClass/Week4")
#Read in the data
Lizs<-read.csv("anolisData.csv", na.strings="?", row.names=1)
table(Lizs$ecomorph)

#Subset
#LizsEco subset - "CG" | "TG"
LizsEco<-Lizs[Lizs$ecomorph=="CG" | Lizs$ecomorph=="TG" | Lizs$ecomorph=="TC",]
table(LizsEco$ecomorph)

#let's look at the data
boxplot(SVL~ecomorph, data=LizsEco)

#Let's run an ANOVA - are there differences between the populations?
AOVfit<-aov(SVL~ecomorph, data=LizsEco)
summary(AOVfit)
#Yes! Highly significant... but there are three groups.
  #We now need to conduct a post-hoc comparison test.

#This tests all the groups against each other and corrects for Type II error.
TukeyHSD(AOVfit)
  #TG-TC appears to be non-significant, we can check this by looking at the boxplot.

#I want you to pick 3-4 groups to perform a pairwise comparison on.



#Subset
#Island data
LizsIs<-Lizs[Lizs$Island=="Cuba" | Lizs$Island=="Puerto Rico" | Lizs$Island=="Hispaniola",]
table(LizsIs$Island)

boxplot(SVL~Island, data=LizsIs)

AOVfit<-aov(SVL~Island, data=LizsIs)
summary(AOVfit) #There's no significant differences here so there's no need to do post-hoc.

TukeyHSD(AOVfit) # We can do it anyway as an example.



#What is a P adjustment?
  #When you run multiple comprisons (like multiple T-tests on your groups) you can increase you Type I error.
  #To account for this we use a post-hoc correction test.
  #The most common is bonferroni - this test multiplies each of your orginal P-values by the number of comparisons.
  #In the example below it multiplies them by 3 as I enter three P-values.
> p.adjust(c(0.04, 0.01,0.5), method="bonferroni")
#[1] 0.12 0.03 1.00
  #Holm is a little less conservative.
> p.adjust(c(0.04, 0.01,0.5), method="holm")
#[1] 0.08 0.03 0.50