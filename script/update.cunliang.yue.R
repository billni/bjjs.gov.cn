update.cunliang.yue <- function() {
#´æÁ¿·¿
require(XML)
fdc.url <- 'http://www.bjjs.gov.cn/tabid/2167/default.aspx'
html <- htmlTreeParse(fdc.url, useInternalNode=T)

data.tables <- getNodeSet(html, path = "//tbody[9]//table//tr")
values<- sapply(data.tables, xmlValue)
values <- gsub("\r","", values)
values <- gsub("\n","", values)
values <- gsub("\t",",", values)
values <- gsub(" ", "", values)
values <- gsub(",{1,}" , ",", values)
values <- gsub("\u00a0" , "", values)


filename <- paste("csv/bjjs.gov.cn/cunliangyue/",Sys.Date(), ".txt", sep="")
write(values, filename)
values

}

