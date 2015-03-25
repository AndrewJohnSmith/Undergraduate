require(ape); require(geiger); require(phytools); require(nlme)

Dana<-read.csv("~/Downloads/Dana Thesis tooth data.csv", na.strings="", row.names=3)
head(Dana)


#Performs an F test to compare the variances of two samples from normal populations.
var.test(Dana$CL/Dana$CW,Dana$P2L/Dana$P2W)

#This is how I set up the boxplot figure.
New<-c(Dana$CL/Dana$CW,Dana$P2L/Dana$P2W)
As<-rep("A",35)
Bs<-rep("B",35)
News<-c(As,Bs)
Yeah<-cbind(News,New)
Yeah<-as.data.frame(Yeah)
Yeah[,2]<-as.numeric(as.character(Yeah[,2]))
boxplot(New~News,data=Yeah)



##Phylo correlations##
#Read in your tree if you want to do any correlations
Tree<-read.nexus("~/Dropbox/Amherst/Project/Moduarity/JawPics/Paper/Data/Correlations/CarnivoraCon.nex")

#As you have missing data you will need to remove it if you wish to do correlations.
	#Just include the columns that you wish to test.
	#Here I want to regress skull length on jaw length 
SkullJaw<-na.omit(Dana[,1:4])

#You now have to match your data and tree - the next few lines do this
Pruning<-treedata(Tree, SkullJaw) #removes any data not in the tree.

Ctree<-Pruning$phy #Extracts the new tree
CTree<-ladderize(Ctree)
#par(mfrow=c(1,2))
plot(CTree) #plots the tree
CData<-Pruning$data #Extracts the new data frame

#Matches the data to the tree - they're now in the right order
CData <- CData[match(CTree$tip.label, rownames(CData)),]

#There may be polytomies in the tree - this removes them...
CTree<-multi2di(CTree)
CTree$edge.length[CTree$edge.length == 0] <- 0.0000001 #... and adds 100,000 years to the split

CData<-as.data.frame(CData) #Checks the data is a dataframe and makes the numeric data.
for(i in 3:ncol(CData)){
CData[,i]<-as.numeric(as.character(CData[,i]))
}

#Setting up your correlation - firstly you need a correlation matrix
bm.CTree<-corBrownian(phy=CTree)
#Then you perform the regression - uses the gls function
gls.teeth <- gls(Skull.Length~Mandible.length, correlation=bm.CTree, data= CData)
#Look at the result
summary(gls.teeth)

#                   Value Std.Error  t-value p-value
#(Intercept)     59.04983 24.851060 2.376149  0.0241
#Mandible.length  0.59359  0.227705 2.606859  0.0141
	#You're interested in the second p-value (0.0141) this says your data is significantly correlated.
		#Basically, there is a correlation between the skull and jaw lengths.

#Let's plot that regression line on thge data.
plot(Skull.Length~Mandible.length, data=CData, col=unclass(CData$Family), pch=20)
abline(gls.teeth, col="red")

FIT<-lm(Skull.Length~Mandible.length,data= CData)
abline(FIT, col="blue")

