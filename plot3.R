library(data.table)

#Read Data
projData <- fread("household_power_consumption.txt",sep=";",na.strings="?", 
                  header=TRUE);

#Get data from rows 66637 to 69516
#This covers the days 01Feb2007 to 02Feb2007
reqData<-projData[66637:69516,];

#Plot1
#Create png file at the working directory
png("./plot3.png",width = 480, height = 480, units = "px");
plot(strptime(paste(reqData$Date,reqData$Time),"%d/%m/%Y %H:%M:%S"),
    as.numeric(reqData$Sub_metering_1),type="l",
    ylab="Energy Sub Metering",xlab="",ylim=c(0,40));
par(new="T");
plot(strptime(paste(reqData$Date,reqData$Time),"%d/%m/%Y %H:%M:%S"),
    as.numeric(reqData$Sub_metering_2),type="l",ylim=c(0,40),col="red",
    ylab="Energy Sub Metering",xlab="");
par(new="T");
plot(strptime(paste(reqData$Date,reqData$Time),"%d/%m/%Y %H:%M:%S"),
     as.numeric(reqData$Sub_metering_3),type="l",ylim=c(0,40),col="blue",
     ylab="Energy Sub Metering",xlab="");
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"));
dev.off();
