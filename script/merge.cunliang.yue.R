merge.cunliang.yue <- function() {
path <- "datafile/cunliangyue/"
files <- dir(path, full.names=T)
all.data <- data.frame(1:10)
for(filename in files) {
  data1 <- read.table(filename, header=F, blank.lines.skip = TRUE, stringsAsFactors=F)
  data1 <- data1[c(5:11,12:16),]
  res <- strsplit(data1, ",")
  data2 <- t(sapply(res, "["))
  data3 <- data.frame(data2)
  names(data3) <- data2[1,]
  data3<-data3[c(2:6, 8:12),]  
  all.data <- data.frame(all.data, data3[,3:5])
}
  all.data <- data.frame("name"=data3[,2], all.data) 
  all.data <- all.data[,c(1, 3:length(all.data))]
  all.data
}
