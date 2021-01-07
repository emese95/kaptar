kaptár=dir("méhészet")
kaptár1=read.csv(paste("méhészet",kaptár[1],sep="/"),encoding="latin1")
head(kaptár1)
?read.csv
library(xts)
külhőm=xts(kaptár1[,5],as.POSIXct(kaptár1[,1]))
plot(külhőm)
summary(kaptár1)
kaptár1xts=xts(kaptár1[,-(1:2)],as.POSIXct(kaptár1[,1]))
plot(kaptár1xts)
colnames(kaptár1)
kaptár1xts[,1] >6
which(kaptár1xts[,1] >6)
kaptár1xts[2830:2836,1]
kaptár1xts[kaptár1xts[,1] >6,1]
kaptár1xts[kaptár1xts[,1] >6,1]
kaptár1xts["2019-10-27",1]
plot(kaptár1xts[,3])
harmadik=apply.daily(kaptár1xts[,3],mean)
plot(merge.xts(kaptár1xts[,3],harmadik))

plot.zoo(kaptár1xts[,3])
lines(as.zoo(harmadik),col=2,lwd=2)

minharmadik=apply.daily(kaptár1xts[,3],min)
maxharmadik=apply.daily(kaptár1xts[,3],max)
plot(merge.xts(harmadik,minharmadik, maxharmadik))
