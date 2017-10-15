plot1 <- function(){
  
  ## this function reads the table 'household_power_consumption.txt' and creates
  ## an histogram for the global active power values between 2007-02-01 and 
  ## 2007-02-02. It saves the histogram in the figure 'plot1.png'
  
  library(data.table)
  household <- fread('household_power_consumption.txt', header = TRUE,
                          sep = ';', na.strings = "?")
  
  household$Date <- as.Date(household$Date,format = "%d/%m/%Y")
  
  subhousehold <- subset(household,household$Date == as.Date('2007-02-01') | 
           household$Date == as.Date('2007-02-02'))
  
  hist(subhousehold$Global_active_power,breaks = 12,col="red", 
       main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)')
  
  dev.copy(png,file = 'plot1.png')
  dev.off()
}
  