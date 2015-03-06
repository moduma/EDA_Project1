library(data.table)

#Read Data
projData <- fread("household_power_consumption.txt",sep=";",na.strings="?", 
                  header=TRUE);

#Get data from rows 66637 to 69516
#This covers the days 01Feb2007 to 02Feb2007
reqData<-projData[66637:69516,];

#Plot1
#Create png file at the working directory
png("./plot1.png",width = 480, height = 480, units = "px");
hist(as.numeric(reqData$Global_active_power),main="Global Active Power",
     xlab="Global Active Power(kilowatts)",ylab="Frequency", col="red",ylim=c(0,1200),xlim=c(0,6))
dev.off();
