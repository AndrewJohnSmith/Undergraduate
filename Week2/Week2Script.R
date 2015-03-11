getwd()
list.files()

#Read in the lizard data, tell it where the missing data is.
#Bring in the species names as row names.
Liz<-read.csv("anolisData.csv", na.strings="?", row.names=1)

str(Liz)
Liz

#Plot the data
plot(Liz$SVL, Liz$PCI_limbs)

#best fit line using linear models
Fit<-lm(Liz$PCI_limbs~Liz$SVL)
abline(Fit, col="red", lwd=2)
summary(Fit)

Cuba<-subset(Liz, subset=Island=="Cuba")

plot(Cuba$SVL, Cuba$PCI_limbs)

FitCuba<-lm(Cuba$PCI_limbs~Cuba$SVL)
abline(FitCuba, col="blue")
summary(FitCuba)

MyCols<-c("black", "red", "blue", "darkgreen")
plot(Liz$SVL, Liz$PCI_limbs, col=MyCols[unclass(Liz$Island)], pch=16)
abline(Fit, col="cornflowerblue")
abline(FitCuba, col="pink")
