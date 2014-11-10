batch <- function() {
 source("script/update.yishou.R")
 update.yishou()
 source("script/update.cunliang.R")
 source("script/update.cunliang.yue.R")
 source("script/merge.yishou.R")
 source("script/merge.cunliang.R")
 source("script/merge.cunliang.yue.R")
 update.yishou()
 update.cunliang()
 update.cunliang.yue()
 merge.yishou()
 merge.cunliang()
 merge.cunliang.yue()


}

