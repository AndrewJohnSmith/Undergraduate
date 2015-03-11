#Set the working directory
Lizs<-read.csv("anolisData.csv", na.strings="?", row.names=1)

#check the data
head(Lizs, 5)

#Sample size for Islands
table(Lizs$Island)
#Sample size for ecomorphs
table(Lizs$ecomorph)

#Subset by two different factors - Cuba and Hispaniola
LizsRed<-Lizs[Lizs$Island=="Cuba" | Lizs$Island=="Hispaniola",]
table(LizsRed$Island)

#Making a boxplot
?boxplot
boxplot(SVL~Island, data=LizsRed)

#LizsEco subset - "CG" | "TG"
LizsEco<-Lizs[Lizs$ecomorph=="CG" | Lizs$ecomorph=="TG",]
table(LizsEco$ecomorph)
boxplot(SVL~ecomorph, data=LizsEco)

#Stats - ttests
?t.test
#Island data
t.test(SVL~Island, data=LizsRed)
#Ecomorph
t.test(SVL~ecomorph, data=LizsEco)
