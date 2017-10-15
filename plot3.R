plot3 <- function(){
  
  
  ## this function reads the table 'household_power_consumption.txt' and creates
  ## a line plot for the energy sub metering 1, 2 and 3 (overploted in the same 
  ## graph) between 2007-02-01 and 2007-02-02. It saves the histogram in the 
  ## figure 'plot3.png'
  
  library(data.table)
  
  household <- fread('household_power_consumption.txt', header = TRUE,
                     sep = ';', na.strings = "?")
  
  household$Date <- as.Date(household$Date,format = "%d/%m/%Y")
  
  subhousehold <- subset(household,household$Date == as.Date('2007-02-01') | 
                           household$Date == as.Date('2007-02-02'))
  
  datetimepaste <- paste(subhousehold$Date, subhousehold$Time)
  
  dateandtime <- strptime(datetimepaste, "%Y-%m-%d %H:%M:%S")
  
  Sys.setlocale("LC_TIME", "en_US.UTF-8")
  
  png('plot3.png',width = 480,height = 480)
  plot(dateandtime,subhousehold$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  points(test,subhousehold$Sub_metering_2,col="red",type="l")
  points(test,subhousehold$Sub_metering_3,col="blue",type="l")
  legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1)
  
  dev.off()
  
}