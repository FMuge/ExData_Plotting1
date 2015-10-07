plot1 <- function() {
    
    ##read data
    ## Only reqired data for this assignment is captured (date btw. 1/2/2007 & 2/2/2007)
    data<-read.table(
        pipe('grep "^[1,2]/2/2007" "./household_power_consumption.txt" ' ),
        sep=";",na.strings="?",colClasses=c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
  
     ##Since the only required data has been captured, colnames are set after reading data:
    colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                      "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")        
    
    ##setting png file 
    png(file = "./ExData_Plotting1/plot1.png",unit="px", width = 480, height = 480)
    
    ## plot the graph
    hist(data$Global_active_power,main="Global Active Power",
         xlab="Global Active Power (kilowatts)",col="red")
    
    ##close the device
    dev.off()
}