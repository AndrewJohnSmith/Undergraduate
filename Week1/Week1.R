#Wednesday Class
#Comments using the '#'
  #These will not execute in the console

5

#Using assignments
X <- 5
X

Andrew <- 2
Andrew

#Spaces and tabs are ignored
X + Andrew
X * Andrew

#	Andrew			* Andrew


#Using a function.
#Set a working directory - all your files will be in here
  #Use >Session>Set Working Directory>Choose Directory
  #Can also use setwd("YourDirectoryHere")

#using the help files - put a '?' in front of your function
?list.files()

list.files()

#Read in a file.
?read.table()
FD <- read.table(file="Force_Displacement1.txt", header=TRUE)

FD

#Indexing - accessing parts of your data
#Accessing rows and columns
	#Access row one
FD[1, ]	

	#Access column one
FD[ ,1]	

  #Row 5 and all columns etc.
FD[5, ]
FD[ ,3]
#Both row 1 and column 3
FD[1,3]

#Accessing multiple rows
FD[1:2, ]
#Accessing multiple columns
FD[,1:2]


#Plotting the data
?plot()

#Plotting using points
plot(x=FD[,2], y=FD[,3], type='p')

#Changing colours and line widths
plot(x=FD[,2], y=FD[,3], type='l', col='blue', lwd=2)


plot(x=FD[,1], y=FD[,3], type='l', col='blue', lwd=2)