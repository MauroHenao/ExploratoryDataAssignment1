library(plyr)
datos=read.table("household_power_consumption.txt",sep = ";", header=T)
datos$Date=as.Date(datos$Date,format="%d/%m/%Y")
d=mutate(datos,FechaHora=paste(Date,Time))
d$FechaHora=strptime(d$FechaHora,"%Y-%m-%d %H:%M:%S")
d=subset(d,Date=="2007-02-01" | Date=="2007-02-02")
GAP=as.numeric(as.character(d$Global_active_power))

#Plot3:
png(file="plot3.png",width=480, height=480)
Subm1=as.numeric(as.character(d$Sub_metering_1))
Subm2=as.numeric(as.character(d$Sub_metering_2))
Subm3=as.numeric(as.character(d$Sub_metering_3))

with(d, plot(FechaHora,Subm1,xlab=NULL,ylab = "Energy sub metering",
             type = "n"))
with(d, lines(FechaHora,Subm1,type="l"))
with(d, lines(FechaHora,Subm2,col="red"))
with(d, lines(FechaHora,Subm3,col="blue"))
legend("topright",legend=names(d[7:9]),cex=1,fill=c("black","red","blue"))
dev.off()