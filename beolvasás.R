kaptár=dir("méhészet")

# teszt
for (segéd in 1:3) {
kaptár1=read.csv(paste("méhészet",kaptár[segéd],sep="/"),encoding="latin1")
print(summary(kaptár1[,3]))
}

# lista
kaptárlista=list()
for (segéd in 1:3) {
  kaptárlista[[segéd]]=read.csv(paste("méhészet",kaptár[segéd],sep="/"),encoding="latin1")

}
(summary(kaptárlista[[2]][,3]))

# lista

for (segéd in 1:length(kaptár)) {
  assign(paste0("kaptár",segéd),read.csv(paste("méhészet",kaptár[segéd],sep="/"),encoding="latin1"))
  
}
