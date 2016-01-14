rm(list = ls())

install.packages("plyr")


library(plyr)

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



# merge.atusact.atussum <- join(atusact, atussum, by="tucaseid")

#https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html
#http://stackoverflow.com/questions/1660124/how-to-sum-a-variable-by-group
# http://www.bls.gov/tus/lexiconnoex0314.pdf
# for aggregate: http://davetang.org/muse/2013/05/22/using-aggregate-and-apply-in-r/

# 050101 is main job
# tewhere = 1 is home = 2 is workplace

# check dplyr, data.table and sqldf and time the merge time






ID.list <- as.data.frame(atussum$tucaseid)
colnames(ID.list) <- "ID"

# generate main job total time

total.main.job <- aggregate(atusact$tuactdur24, by=list( ID = atusact$tucaseid , code = atusact$trcodep ==50101  ), FUN=sum)



# both are ok
total.main.job.true.only <- subset(total.main.job, total.main.job$code == TRUE )
total.main.job.true.only <- total.main.job.true.only[c("ID", "code", "x")] 


# 2nd way is ok too
#total.main.job$main.job.total.time <- 1440 - total.main.job$x
#total.main.job.false.only <- subset(total.main.job, total.main.job$code == FALSE )

merge.total.main.job.true.only.IDlist <- merge(ID.list, total.main.job.true.only , by="ID", all = T)
merge.total.main.job.true.only.IDlist[is.na(merge.total.main.job.true.only.IDlist )] <- 0


# change name of the file
total.main.job <- merge.total.main.job.true.only.IDlist

# for checking only
#table(total.main.job.false.only$main.job.total.time-atussum$t050101)
table(total.main.job$x-atussum$t050101)










# generate work from home time


total.main.job.wfh <- aggregate(atusact$tuactdur24, by=list( ID = atusact$tucaseid , code = atusact$trcodep ==50101, location = atusact$tewhere == 1  ), FUN=sum)

total.main.job.wfh.true.only <- subset(total.main.job.wfh, total.main.job.wfh$code == TRUE & total.main.job.wfh$location == TRUE)


colnames(total.main.job.wfh.true.only)[which(names(total.main.job.wfh.true.only) == "x")] <- "total.main.job.wfh.time" 

colnames(total.main.job)[which(names(total.main.job) == "x")] <- "total.main.job.time" 




total.main.job <- join(total.main.job, total.main.job.wfh.true.only, by="ID")


total.main.job[is.na(total.main.job )] <- 0
total.main.job$total.percent.main.job.wfh <- total.main.job$total.main.job.wfh.time/total.main.job$total.main.job.time


total.main.job[is.na(total.main.job )] <- 0




colnames(total.main.job)[which(names(total.main.job) == "ID")] <- "tucaseid" 


# final product
total.main.job <- total.main.job[c("tucaseid", "total.main.job.time", "total.main.job.wfh.time", "total.percent.main.job.wfh")]













# generate y variables


atussum$total.time.child = atussum$t030101+ atussum$t030102+ atussum$t030103+ atussum$t030104+ atussum$t030105+ atussum$t030186 + atussum$t030108+ atussum$t030109 + atussum$t030110 + atussum$t030111 + atussum$t030112 + atussum$t030199 + atussum$t030201 + atussum$t030202 + atussum$t030203 + atussum$t030204 + atussum$t030299 + atussum$t030301 + atussum$t030302 + atussum$t030303 + atussum$t030399



atussum <- rename(atussum, replace = c("t070101" = "grocery.shopping", "t020201" = "food.drink.preparation", 
                                       "t030101" = "physical.care.hh.children" , "t030102" = "reading.to.hh.children" , 
                                       "t030103" = "play.with.hh.children",
                                       "tuyear" = "interview.year", "trholiday" = "holiday.indicator" , 
                                       "tudiaryday" = "diary.day", "teage" = "age" , "tesex" = "sex" 
                                        ))

atussum.subset <- atussum[c("tucaseid", "total.time.child", "grocery.shopping", "food.drink.preparation", "physical.care.hh.children",
                            "reading.to.hh.children", "play.with.hh.children", "interview.year", "holiday.indicator", 
                            "diary.day", "age", "sex"  )]







atusresp$trspftpt[atusresp$trspftpt == -1 ] <- NA


atusresp$tehruslt[atusresp$tehruslt == -1 ] <- NA
atusresp$tehruslt[atusresp$tehruslt == -4 ] <- NA

atusresp$trdtocc1[atusresp$trdtocc1 == -1 ] <- NA



atusresp <- rename(atusresp, replace = c("tehruslt" = "work.hours", 
                                         "trdtocc1" = "occupations", "trchildnum" = "num.children",
                                         "trnumhou" = "num.family.member", "telfs"="employment.status" ,
                                         "trspftpt" = "full.part.time.spouse", "trhhchild" = "presence.child"))




atusresp.subset <- atusresp[c("tucaseid", "tulineno",  "work.hours", "occupations", "num.children", "num.family.member", "employment.status", "full.part.time.spouse", "presence.child"  )]









atuscps$hefaminc[atuscps$hefaminc == -1 ] <- NA
atuscps$ptdtrace[atuscps$ptdtrace == -1 ] <- NA
atuscps$pemaritl[atuscps$pemaritl == -1 ] <- NA




atuscps <- rename(atuscps, replace = c("gereg" = "region", "gestfips" = "fips", "hefaminc" = "edited.family.income",
                                       "ptdtrace" = "race", "pemaritl" = "marital.status"))



atuscps.subset <- atuscps[c("tucaseid", "tulineno", "region", "fips", "edited.family.income", "race" ,  "marital.status" )]
















combine.data <- join(total.main.job,atussum.subset,  by="tucaseid", type = "full")


combine.data <- join(combine.data,atuscps.subset,  by="tucaseid", type = "full")


trial <- c("tucaseid","tulineno")

combine.data <- join(combine.data,atusresp.subset, by=trial, type = "full")























# definition of wfh
combine.data$wfh <- c("")

combine.data$wfh[which(combine.data$total.percent.main.job.wfh > 0.85 & (combine.data$employment.status ==  1 | combine.data$employment.status ==  2 ) )] <- 1


combine.data$wfh[which(combine.data$total.percent.main.job.wfh <= 0.85 & (combine.data$employment.status ==  1 | combine.data$employment.status ==  2 ) )] <- 0

combine.data$wfh[which(combine.data$wfh == "")] <- NA


table(combine.data$wfh)



# definition of wfh_mom

combine.data$wfh_mom <- c("")

combine.data$wfh_mom[which(combine.data$presence.child == 1 & combine.data$sex == 2 & combine.data$wfh == 1  )] <- 1


combine.data$wfh_mom[which(combine.data$presence.child == 1 & combine.data$sex == 2 & combine.data$wfh == 0 )] <- 0

combine.data$wfh_mom[which(combine.data$wfh_mom == "")] <- NA








# only woman is included, so sex is NA

summary(lm(total.time.child ~ factor(wfh_mom)+age + sex + factor(race) + factor(marital.status)
           + work.hours + factor(occupations) + num.children + num.family.member + factor(interview.year)
           + factor(holiday.indicator) + factor(diary.day) 
           + factor(full.part.time.spouse) + factor(region) + factor(fips) + factor(edited.family.income) , data = combine.data))


   #[pweight = tufnwgtp], r



