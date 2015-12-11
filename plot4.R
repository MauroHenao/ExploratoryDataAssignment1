library(plyr)
datos=read.table("household_power_consumption.txt",sep = ";", header=T)
datos$Date=as.Date(datos$Date,format="%d/%m/%Y")
d=mutate(datos,FechaHora=paste(Date,Time))
d$FechaHora=strptime(d$FechaHora,"%Y-%m-%d %H:%M:%S")
d=subset(d,Date=="2007-02-01" | Date=="2007-02-02")
GAP=as.numeric(as.character(d$Global_active_power))

#plot4:
png(file="plot4.png",width=480, height=480)
par(mfrow=c(2,2))
with(d, plot(FechaHora,GAP,type="l",ylab="Global Active Power (kilowatts)"))
with(d, plot(FechaHora,Voltage,type="l",ylab="Voltage"))

with(d, plot(FechaHora,Subm1,xlab=NULL,ylab = "Energy sub metering",type = "n"))
with(d, lines(FechaHora,Subm1,type="l"))
with(d, lines(FechaHora,Subm2,col="red"))
with(d, lines(FechaHora,Subm3,col="blue"))
legend("topright",legend=names(d[7:9]),cex=0.7,fill=c("black","red","blue"))

with(d, plot(FechaHora,Global_reactive_power,type="l"))
dev.off()