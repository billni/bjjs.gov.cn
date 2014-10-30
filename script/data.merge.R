data.merge <- function() {
all.data <- data.frame(no=1:90)
files <- dir("csv/bjjs.gov.cn", full.names=T)
for(filename in files) {
  data1 <- read.table(filename, header=F, blank.lines.skip = TRUE, stringsAsFactors=F)
  data1 <- data1[c(3:46,48:93),]
  data1 <- data.frame(data1)
  res <- strsplit(as.vector(data1[,1]), "：")
  data1 <- data.frame(name= sapply(res, "[", 1), value= as.numeric(sapply(res, "[", 2)))
  all.data <- data.frame(all.data, name=data1[,1], d1=data1[,2])
  }

opar <- par(no.readonly=T)
par(lty=2, pch=19, mfrow=c(3,5))
for(i in 2:90) {
   plot(t(all.data[i,c(3,5,7,9)]), type="b", col=rainbow(10), xlab=all.data[i,c(2)], ylab="值", na.rm=T)
}
par(opar)
print("ok")
}
