#Week 5#
#Normality and correcting for phylogeny#
Liz<-read.csv("anolisData.csv", na.strings="?", row.names=1)
str(Liz)

#Snout-vent length
  #Let's first plot the data to see who it is distributed.
hist(Liz$SVL)
  #The density function looks a little nicer but works in a similar way to 'hist'
plot(density(Liz$SVL))

#This is the actual test for normlity
  #If p<0.05 this means the data is significantly different from a normal distribution.
    #Basically, your data is not normal.
shapiro.test(Liz$SVL)
  #We can visualize this - the quantiles should follow a straight line if normal.
qqnorm(Liz$SVL)

#A perfect example
Normal<-rnorm(5000)
plot(density(Normal))
shapiro.test(Normal)
qqnorm(Normal)

#Given the data is not normal we need to use non-parametric statistics
    #Or we could transform (for another day)
#Non-paramteric t-test.
LizIs<-Liz[Liz$Island=="Cuba" | Liz$Island=="Hispaniola",]
table(LizIs$Island)

#Independent 2-group Mann-Whitney U Test
  #y is numeric and A is a binary factor 
wilcox.test(LizIs$SVL~LizIs$Island)
  #Not significant

#Non-paramteric ANOVA.
LizEco<-Liz[Liz$ecomorph=="CG" | Liz$ecomorph=="TG" | Liz$ecomorph=="TC",]
table(LizEco$ecomorph)
# Kruskal Wallis Test One Way Anova by Ranks
kruskal.test(LizEco$SVL~LizEco$ecomorph) # where y1 is numeric and A is a factor 
  #To do a post-hoc test we need to install a new package (only need to do it once).
install.packages("PMCMR")
  #This loads it in.
library(PMCMR)
posthoc.kruskal.nemenyi.test(formula=LizEco$SVL~LizEco$ecomorph)
  #For whatever reason there's no built in correction method.
  #Doin it manually
p.adjust(c(7.1e-05,2.1e-05,0.96), method="bonferroni")
  #Significant remains between CG-TC, and CG-TG

#Can also use holm for a less conservative test.
p.adjust(c(7.1e-05,2.1e-05,0.96), method="holm")


#Like last week do you own version of the non-parametric tests above.
  #Select different islands or groups to test.