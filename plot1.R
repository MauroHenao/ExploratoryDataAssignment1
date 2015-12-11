library(plyr)
datos=read.table("household_power_consumption.txt",sep = ";", header=T)
datos$Date=as.Date(datos$Date,format="%d/%m/%Y")
d=mutate(datos,FechaHora=paste(Date,Time))
d$FechaHora=strptime(d$FechaHora,"%Y-%m-%d %H:%M:%S")
d=subset(d,Date=="2007-02-01" | Date=="2007-02-02")
GAP=as.numeric(as.character(d$Global_active_power))

#Plot1:
png(file="plot1.png",width=480, height=480)
hist(GAP,xlab="Global Active Power (kilowatts)",
     col="red",main=("Global Active Power"))
dev.off()