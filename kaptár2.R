külhőm=xts(kaptár1[,5],as.POSIXct(kaptár1[,1]))
plot(külhőm)

kaptár1xts=xts(kaptár1[,-(1:2)],as.POSIXct(kaptár1[,1]))
plot(kaptár1xts)

## Hiba helye
plot(kaptár1xts["2020-04-13/2020-04-14",])

## Hibás szakasz törlése
kaptár1xts <- kaptár1xts["/2020-04-13",]

## Külső és belső egy ábrán
kaptárLista=dir("meheszet")
kaptár1=read.csv(paste("meheszet",kaptárLista[12],sep="/"),encoding="latin1")
kaptár1xts=xts(kaptár1[,-(1:2)],as.POSIXct(kaptár1[,1]))
rajzás = merge.xts(kaptár1xts["2020-04-14/", 11], kaptár1xts["2020-04-14/", 12])
plot(rajzás)

kaptár=dir("meheszet")
kaptár1=read.csv(paste("meheszet",kaptár[10],sep="/"),encoding="latin1")
kaptár2=read.csv(paste("meheszet",kaptár[12],sep="/"),encoding="latin1")
kaptár1xts=xts(kaptár1[,-(1:2)],as.POSIXct(kaptár1[,1]))
kaptár2xts=xts(kaptár2[,-(1:2)],as.POSIXct(kaptár2[,1]) - 365 * 24 * 60 * 60)
belso1 = apply.daily(kaptár1xts[, 7], mean)
kulso1 = apply.daily(kaptár1xts[, 3], mean)
belso2 = apply.daily(kaptár2xts[, 7], mean)
kulso2 = apply.daily(kaptár2xts[, 3], mean)
plot(merge.xts(belso1 - kulso1, belso2 - kulso2))

####

kaptár=dir("meheszet")
kaptár1=read.csv(paste("meheszet",kaptár[10],sep="/"),encoding="latin1")
kaptár1xts=xts(kaptár1[,-(1:2)],as.POSIXct(kaptár1[,1]))
napk = kaptár1xts["2019-04-17/2019-04-17", 3]
napb = kaptár1xts["2019-04-17/2019-04-17", 7]
plot(merge.xts(napk, napb))

kapt.ccf <- ccf(as.ts(napk),as.ts(napb))
plot(kapt.ccf$lag, kapt.ccf$acf, typ="h")

which(kapt.ccf$lag == 7200) ## 13
kapt.ccf$acf[13,1,1]
plot(diff(napb, lag = 2))

### Külső-belső különbség 2 óra eltolással
## Teljes
plot(lag(napb, k = 2) - napk)


## Differencia
plot(napb - napk)

