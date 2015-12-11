library(plyr)
datos=read.table("household_power_consumption.txt",sep = ";", header=T)
datos$Date=as.Date(datos$Date,format="%d/%m/%Y")
d=mutate(datos,FechaHora=paste(Date,Time))
d$FechaHora=strptime(d$FechaHora,"%Y-%m-%d %H:%M:%S")
d=subset(d,Date=="2007-02-01" | Date=="2007-02-02")
GAP=as.numeric(as.character(d$Global_active_power))

#Plot2:
png(file="plot2.png",width=480, height=480)
with(d, plot(FechaHora,GAP,type="l",xlab=NULL,ylab="Global Active Power (kilowatts)"))
dev.off()