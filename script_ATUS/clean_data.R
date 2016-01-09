load('D:/ATUS/0314/atusact.rda')
load('D:/ATUS/0314/atuscps.rda')
load('D:/ATUS/0314/atusresp.rda')
load('D:/ATUS/0314/atusrost.rda')
load('D:/ATUS/0314/atusrost.rda')
load('D:/ATUS/0314/atussum.rda')
load('D:/ATUS/0314/atuswgts.rda')
load('D:/ATUS/0314/atuswho.rda')



options("scipen" = 10)



memory.limit(size = 50000)
merged.data <- merge(atusact, atussum, by="tucaseid")

#https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html
#http://stackoverflow.com/questions/1660124/how-to-sum-a-variable-by-group
# http://www.bls.gov/tus/lexiconnoex0314.pdf
# 050101 is main job
# tewhere = 1 is home = 2 is workplace

# check dplyr and time the merge time



ID.list <- as.data.frame(atussum$tucaseid)
colnames(ID.list) <- "ID"


sum.main.job <- aggregate(atusact$tuactdur24, by=list( ID = atusact$tucaseid , code = atusact$trcodep ==50101  ), FUN=sum)

sum.main.job$main.job.total.time <- 1440 - sum.main.job$x



sum.main.job.true.only <- subset(sum.main.job, sum.main.job$code == TRUE )
sum.main.job.true.only <- sum.main.job.true.only[c("ID", "code", "x")] 

# both are ok
sum.main.job.false.only <- subset(sum.main.job, sum.main.job$code == FALSE )

sum.main.job.merge <- merge(ID.list, sum.main.job.true.only , by="ID", all = T)
sum.main.job.merge[is.na(sum.main.job.merge)] <- 0


# for checking only
table(sum.main.job.false.only$main.job.total.time-atussum$t050101)
table(sum.main.job.merge$x-atussum$t050101)














# for aggregate: http://davetang.org/muse/2013/05/22/using-aggregate-and-apply-in-r/



sum.main.job.home <- aggregate(atusact$tuactdur24, by=list( ID = atusact$tucaseid , code = atusact$trcodep ==50101, location = atusact$tewhere == 1  ), FUN=sum)

sum.main.job.home.2 <- subset(sum.main.job.home, sum.main.job.home$code == TRUE & sum.main.job.home$location == TRUE)





sum.main.job.home.3 <- merge(sum.main.job.merge, sum.main.job.home.2, by="ID", all = T)

sum.main.job.home.3[is.na(sum.main.job.home.3 )] <- 0


sum.main.job.home.3$percent.main.job.wfh <- sum.main.job.home.3$x.y/sum.main.job.home.3$x.x





