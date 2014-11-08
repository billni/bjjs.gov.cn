merge.cunliang <- function() {
pdf.options(family='GB1')
pdf("bjjs.gov.cn.cunliang.pdf")
path <- "csv/bjjs.gov.cn/cunliang"
all.data <- data.frame(no=1:20)
files <- dir(path, full.names=T)
for(filename in files) {
  data1 <- read.table(filename, header=F, blank.lines.skip = TRUE, stringsAsFactors=F)
  data1 <- data1[2:21,]
  data1 <- data.frame(data1)
  res <- strsplit(as.vector(data1[,1]), "£º")
  data1 <- data.frame(name= sapply(res, "[", 1), value= as.numeric(sapply(res, "[", 2)))
  all.data <- data.frame(all.data, name=data1[,1], d1=data1[,2])
  }

nona.data <- na.omit(all.data)
titles <- all.data[which(is.na(all.data$d1)), length(all.data)-1]
j<-1
opar <- par(no.readonly=T)
par(lty=2, pch=19, mfrow=c(2,2))
loopnum <- nrow(nona.data)
cols <- seq(from=3, to=length(all.data), by=2)
for(i in 1:loopnum) {
   plot(t(nona.data[i,cols]), type="b", col=rainbow(10), xlab=nona.data[i,2], ylab="Öµ")
   text(x=1:length(cols), y=t(nona.data[i,cols]), t(nona.data[i,cols]))
   if(i %% 4 == 1) {       
	title(main=titles[j])
        j<-j+1
   }
}
par(opar)
dev.list()
dev.off()
}
