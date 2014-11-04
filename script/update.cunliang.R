update.cunliang <- function() {
#´æÁ¿·¿
require(XML)
fdc.url <- 'http://www.bjjs.gov.cn/tabid/2167/default.aspx'
html <- htmlTreeParse(fdc.url, useInternalNode=T)

data.tables <- getNodeSet(html, path = "//tbody[8]//table//tr")
values<- sapply(data.tables, xmlValue)
values <- gsub("\r","", values)
values <- gsub("\n","", values)
values <- gsub("\t",",", values)
values <- gsub(" ", "", values)
values <- gsub(",,," , ",", values)
values <- gsub(",," , ",", values)
values <- gsub("," , "", values)
values <- gsub("\u00a0" , "", values)


filename <- paste("csv/bjjs.gov.cn/cunliang/",Sys.Date(), ".txt", sep="")
write(values, filename)
values

}

