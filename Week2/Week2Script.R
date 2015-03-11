getwd()
list.files()

#Read in the lizard data, tell it where the missing data is.
#Bring in the species names as row names.
Liz<-read.csv("anolisData.csv", na.strings="?", row.names=1)

#str means structure, how is R viewing the data?
  #Factors for discrete data, numeric for continuous data
str(Liz)
Liz

#Plot the data
plot(Liz$SVL, Liz$PCI_limbs)

#best fit line using linear models
Fit<-lm(Liz$PCI_limbs~Liz$SVL)
  #plot the line on your chart (note that the plot has to be up in yopur window)
abline(Fit, col="red", lwd=2)
summary(Fit)

#Subset by Cuba - I only want the Cuba data
  #== is a logical statement, it means 'only give me Islands that are True for Cuba'
Cuba<-subset(Liz, subset=Island=="Cuba")

plot(Cuba$SVL, Cuba$PCI_limbs)

FitCuba<-lm(Cuba$PCI_limbs~Cuba$SVL)
abline(FitCuba, col="blue")
summary(FitCuba)

#The unclass function allows you to colour multiple groups in a plot
MyCols<-c("black", "red", "blue", "darkgreen")
plot(Liz$SVL, Liz$PCI_limbs, col=MyCols[unclass(Liz$Island)], pch=16)
abline(Fit, col="cornflowerblue")
abline(FitCuba, col="pink")
