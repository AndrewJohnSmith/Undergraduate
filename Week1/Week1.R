#Wednesday Class
#Comments using the '#'

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

FD[5, ]
FD[ ,3]

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