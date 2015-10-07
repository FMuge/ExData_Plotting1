plot4 <- function() {
    
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
    png(file = "./ExData_Plotting1/plot4.png",unit="px", width = 480, height = 480)
    
    ## There will be four graphs will be plotted with 2 rows and columns
    par(mfrow=c(2,2))
    
    ## plot the 1st graph
    with(data,plot(Time,Global_active_power, type="l",
                   xlab="",ylab="Global Active Power"))
    
    ## plot the 2nd graph
    with(data,plot(Time,Voltage, type="l",xlab="datetime"))
    
    ## plot the 3rd graph
    with(data,plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
        ## add second line
        lines(data$Time,data$Sub_metering_2,col="red")
        ## add third line
        lines(data$Time,data$Sub_metering_3,col="blue")
        ## add legend
        legend("topright",col=c("black","red","blue"), lty=1, bty= "n", legend=names(data[7:9]),cex=1)
    
    ## plot the 4th graph 
    with(data,plot(Time,Global_reactive_power, type="l",xlab="datetime"))   
        
    ##close the device
    dev.off()
}