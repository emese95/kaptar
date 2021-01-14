külhőm=xts(kaptár2[,5],as.POSIXct(kaptár2[,1]))
plot(külhőm)

kaptár2xts=xts(kaptár2[,-(1:2)],as.POSIXct(kaptár2[,1]))
plot(kaptár2xts)

## Hiba helye
plot(kaptár2xts["2020-04-13/2020-04-14",])

## Hibás szakasz törlése
kaptár2xts <- kaptár2xts["/2020-04-13",]

## Külső és belső egy ábrán
plot(merge.xts(kaptár2xts[,"Külső.hőmérséklet...C..átlag"],kaptár2xts[,9]))

## Differencia
plot(kaptár2xts[,"X1..kaptár.hőmérséklet.profil.1...C..átlag"]
               - kaptár2xts[,"Külső.hőmérséklet...C..átlag"])

### Keresztkorreláció
## Alapértelmezetten ábra
ccf(as.ts(kaptár2xts[,"X1..kaptár.hőmérséklet.profil.1...C..átlag"]),
    as.ts(kaptár2xts[,"Külső.hőmérséklet...C..átlag"]))
## A számolás objektumának mentése
kapt2.ccf <- ccf(as.ts(kaptár2xts[,"X1..kaptár.hőmérséklet.profil.1...C..átlag"]),
                 as.ts(kaptár2xts[,"Külső.hőmérséklet...C..átlag"]))
## autokorrelogram kézzel
plot(kapt2.ccf$lag, kapt2.ccf$acf, typ="h", ylim=c(0,0.8))

which(kapt2.ccf$lag == 7200) ## 33
kapt2.ccf$acf[33,1,1]

## Differencia belső hőmérséklet
plot(diff(kaptár2xts[,9], lag = 24))

### Külső-belső különbség 2 óra eltolással
## Teljes
plot(lag(kaptár2xts[,9], k = 2) - kaptár2xts[,"Külső.hőmérséklet...C..átlag"])

plot(lag(kaptár2xts["2020-03-16/2020-03-23",9], k = 2) - kaptár2xts["2020-03-16/2020-03-23","Külső.hőmérséklet...C..átlag"])

plot(merge.xts(kaptár2xts["2020-03-16/2020-03-23",9], kaptár2xts["2020-03-16/2020-03-23","Külső.hőmérséklet...C..átlag"]))
