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
kaptár1=read.csv(paste("meheszet",kaptár[12],sep="/"),encoding="latin1")
kaptár1xts=xts(kaptár1[,-(1:2)],as.POSIXct(kaptár1[,1]))
rajzás = merge.xts(kaptár1xts["2020-04-14/", 11], kaptár1xts["2020-04-14/", 12])
plot(rajzás)

kaptárLista=dir("meheszet")
kaptár[10]
kaptár[12]
kaptár1=read.csv(paste("meheszet",kaptár[10],sep="/"),encoding="latin1")
kaptár2=read.csv(paste("meheszet",kaptár[12],sep="/"),encoding="latin1")
kaptár1xts=xts(kaptár1[,-(1:2)],as.POSIXct(kaptár1[,1]))
kaptár2xts=xts(kaptár2[,-(1:2)],as.POSIXct(kaptár2[,1]) - 365 * 24 * 60 * 60)
belso1 = apply.daily(kaptár1xts[, 7], mean)
kulso1 = apply.daily(kaptár1xts[, 3], mean)
belso2 = apply.daily(kaptár2xts[, 7], mean)
kulso2 = apply.daily(kaptár2xts[, 3], mean)
plot(merge.xts(belso1 - kulso1, belso2 - kulso2))



q q## Differencia
plot(kaptár1xts[,"X1..kaptár.hőmérséklet.profil.1...C..átlag"]
               - kaptár1xts[,"Külső.hőmérséklet...C..átlag"])

### Keresztkorreláció
## Alapértelmezetten ábra
ccf(as.ts(kaptár1xts[,"X1..kaptár.hőmérséklet.profil.1...C..átlag"]),
    as.ts(kaptár1xts[,"Külső.hőmérséklet...C..átlag"]))
## A számolás objektumának mentése
kapt2.ccf <- ccf(as.ts(kaptár1xts[,"X1..kaptár.hőmérséklet.profil.1...C..átlag"]),
                 as.ts(kaptár1xts[,"Külső.hőmérséklet...C..átlag"]))
## autokorrelogram kézzel
plot(kapt2.ccf$lag, kapt2.ccf$acf, typ="h", ylim=c(0,0.8))

which(kapt2.ccf$lag == 7200) ## 33
kapt2.ccf$acf[33,1,1]

## Differencia belső hőmérséklet
plot(diff(kaptár1xts[,9], lag = 24))

### Külső-belső különbség 2 óra eltolással
## Teljes
plot(lag(kaptár1xts[,9], k = 2) - kaptár1xts[,"Külső.hőmérséklet...C..átlag"])

plot(lag(kaptár1xts["2020-03-16/2020-03-23",9], k = 2) - kaptár1xts["2020-03-16/2020-03-23","Külső.hőmérséklet...C..átlag"])

plot(merge.xts(kaptár1xts["2020-03-16/2020-03-23",9], kaptár1xts["2020-03-16/2020-03-23","Külső.hőmérséklet...C..átlag"]))
