update.yishou <- function() {
require(XML)
path <- "datafile/yishou/"
fdc.url <- 'http://www.bjjs.gov.cn/tabid/2167/default.aspx'
html <- htmlTreeParse(fdc.url, useInternalNode=T)

data.tables <- getNodeSet(html, path = "//tbody[7]//table//tr")
values<- sapply(data.tables, xmlValue)
values <- gsub("\r","", values)
values <- gsub("\n","", values)
values <- gsub("\t",",", values)
values <- gsub(" ", "", values)
values <- gsub(",,," , ",", values)
values <- gsub(",," , ",", values)
values <- gsub("," , "", values)
values <- gsub("\u00a0" , "", values)


filename <- paste(path, Sys.Date(), ".txt", sep="")
write(values, filename)
values

#xpathSApply(html, path="//table")
#xpathApply(html, path="//table", xmlValue)
#xpathApply(html, path="/tbody[7]", xmlValue)
#values <- xpathApply(html, path="/tbody[7]", xmlValue)
#values <- gsub("\r","", values)
#values <- gsub("\n","", values)
#values <- gsub("\t",",", values)
}

