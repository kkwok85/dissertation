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
050101 is main job
# tewhere = 1 is home = 2 is workplace

# check dplyr and time the merge time




sum.main.job <- aggregate(atusact$tuactdur24, by=list( ID = atusact$tucaseid , code = atusact$trcodep ==50101  ), FUN=sum)

sum.main.job$main <- 1440 - sum.main.job$x




sum.main.job2 <- subset(sum.main.job, sum.main.job$code == TRUE )
  
sum.main.job3 <- subset(sum.main.job, sum.main.job$code == FALSE )

# for checking only
table(sum.main.job3$main-atussum$t050101)


sum.main.job <- aggregate(atusact$tuactdur24, by=list( ID = atusact$tucaseid , code = atusact$trcodep ==50101  ), FUN=sum)




# for aggregate: http://davetang.org/muse/2013/05/22/using-aggregate-and-apply-in-r/



sum.main.job.home <- aggregate(atusact$tuactdur24, by=list( ID = atusact$tucaseid , code = atusact$trcodep ==50101, location = atusact$tewhere == 1  ), FUN=sum)

sum.main.job.office <- aggregate(atusact$tuactdur24, by=list( ID = atusact$tucaseid , code = atusact$trcodep ==50101, location = atusact$tewhere == 2  ), FUN=sum)


