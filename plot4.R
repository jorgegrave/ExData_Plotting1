plot4 <- function(){
  
  
  ## this function reads the table 'household_power_consumption.txt' and creates
  ## a multiplot figure with 4 different line plots, all showing data between 
  ##2007-02-01 and 2007-02-02. The corresponding variables are: Blobal active 
  ## power, Voltage, Energy su metering 1,2 and 3 (all overploted in the same 
  ## figure) and Global reactive power. It saves the histogram in the figure
  ## 'plot1.png'.
  
  library(data.table)
  
  household <- fread('household_power_consumption.txt', header = TRUE,
                     sep = ';', na.strings = "?")
  
  household$Date <- as.Date(household$Date,format = "%d/%m/%Y")
  
  subhousehold <- subset(household,household$Date == as.Date('2007-02-01') | 
                           household$Date == as.Date('2007-02-02'))
  
  datetimepaste <- paste(subhousehold$Date, subhousehold$Time)
  
  dateandtime <- strptime(datetimepaste, "%Y-%m-%d %H:%M:%S")
  
  Sys.setlocale("LC_TIME", "en_US.UTF-8")
  
  
  png('plot4.png',width = 480,height = 480)
  
  par(mfrow=c(2,2))
  
  plot(dateandtime,subhousehold$Global_active_power,type="l",
       ylab = "Global Active Power (kilowatts)",xlab = "")
  
  plot(dateandtime,subhousehold$Voltage,type="l",ylab="Voltage",xlab="datetime")
  
  plot(dateandtime,subhousehold$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  points(test,subhousehold$Sub_metering_2,col="red",type="l")
  points(test,subhousehold$Sub_metering_3,col="blue",type="l")
  legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,bty="n")
  
  plot(dateandtime,subhousehold$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
  dev.off()
}