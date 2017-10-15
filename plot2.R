plot2 <- function(){
  
  ## this function reads the table 'household_power_consumption.txt' and creates
  ## a line graph for the global active power values between 2007-02-01 and 
  ## 2007-02-02. It saves the plot in the figure 'plot2.png'
  
  library(data.table)
  
  household <- fread('household_power_consumption.txt', header = TRUE,
                     sep = ';', na.strings = "?")
  
  household$Date <- as.Date(household$Date,format = "%d/%m/%Y")
  
  subhousehold <- subset(household,household$Date == as.Date('2007-02-01') | 
           household$Date == as.Date('2007-02-02'))
  
  datetimepaste <- paste(subhousehold$Date, subhousehold$Time)
  
  dateandtime <- strptime(datetimepaste, "%Y-%m-%d %H:%M:%S")
  
  Sys.setlocale("LC_TIME", "en_US.UTF-8")
  
  plot(dateandtime,subhousehold$Global_active_power,type="l",
          ylab = "Global Active Power (kilowatts)",xlab = "")
  
  dev.copy(png,file = 'plot2.png')
  dev.off()

}