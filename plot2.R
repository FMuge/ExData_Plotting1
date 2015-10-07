plot2 <- function() {
    
    ##read data
    ## Only reqired data for this assignment is captured (date btw. 1/2/2007 & 2/2/2007)
    data<-read.table(
        pipe('grep "^[1,2]/2/2007" "./household_power_consumption.txt" ' ),
        sep=";",na.strings="?",colClasses=c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
    
    
    ##Since the only required data has been captured, colnames are set after reading data:
    colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                      "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")        
    
    ## Time variable format setting:
    data$Time<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
    
    ## To correct locale Day names (Pers., Cuma, Cum.)
    Sys.setlocale("LC_TIME", "English")
    
    ##setting png file 
    png(file = "./ExData_Plotting1/plot2.png",unit="px", width = 480, height = 480)
    
    ## plot the graph
    with(data,plot(Time,Global_active_power, type="l",
                  xlab="",ylab="Global Active Power (kilowatts)"))
    
    ##close the device
    dev.off()
}