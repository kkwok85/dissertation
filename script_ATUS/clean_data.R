rm(list = ls())


install.packages("stargazer")


install.packages("plyr")


install.packages("lmtest")
install.packages("sandwich")
install.packages("pastecs")



library(pastecs)
library(stargazer)
library(plyr)
library(lmtest)
library(sandwich)

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



atussum <- rename(atussum, replace = c("t070101" = "grocery.shopping", "t020201" = "food.drink.preparation", "t070103" = "purchasing.food",
                                       "t030101" = "physical.care.hh.children" , "t030102" = "reading.to.hh.children" , 
                                       "t030103" = "play.with.hh.children", "t030105" = "play.sports.with.hh.children",
                                       "t030186" = "talk.listening.to.hh.children", 
                                       "t030108" = "organization.plan.for.hh.children", "t030109" = "supervision.hh.children",
                                       "t030201" = "homework.hh.children", "t030202" = "meetings.school.conference.hh.children",
                                       "t030203" = "home.school.hh.children",
                                       "t030301" = "provide.medical.care.hh.children", "t030302" = "obtain.medical.care.hh.children",
                                       "t080101" = "use.paid.childcare", "t080102" = "wait.to.meet.childcare", 
                                       "tuyear" = "interview.year", "trholiday" = "holiday.indicator" , 
                                       "tudiaryday" = "diary.day", "teage" = "age" , "tesex" = "sex",  "ptdtrace" = "race"
                                        ))

atussum.subset <- atussum[c("tucaseid", "total.time.child", "grocery.shopping", "food.drink.preparation", "purchasing.food",
                            "physical.care.hh.children", "reading.to.hh.children", 
                            "play.with.hh.children", "play.sports.with.hh.children", "talk.listening.to.hh.children", 
                            "organization.plan.for.hh.children", "supervision.hh.children",
                            "homework.hh.children", "meetings.school.conference.hh.children",
                            "home.school.hh.children",
                            "provide.medical.care.hh.children", "obtain.medical.care.hh.children",
                            "use.paid.childcare", "wait.to.meet.childcare", 
                            "interview.year", "holiday.indicator", 
                            "diary.day", "age", "sex", "race", "tufnwgtp")]







# this question is assked only if there is a partner and the partner is employed full time. no problem to edit this way
atusresp$trspftpt[atusresp$trspftpt == -1 ] <- 4



# number of hours dropped if numbers are varied or number is out of universe, edit -1 to 0 is fine since -1 means those r not employed or not in labor force
atusresp$tehruslt[atusresp$tehruslt == -1 ] <- 0
atusresp$tehruslt[atusresp$tehruslt == -4 ] <- NA

atusresp$trdtocc1[atusresp$trdtocc1 == -1 ] <- NA






##****checked, no problem
atusresp$tespempnot[atusresp$tespempnot == -1 ] <- 3


## -1 is the add up of not employed and -1 of tespempnot
atusresp$tespuhrs[atusresp$tespuhrs == -1 ] <- 0
atusresp$tespuhrs[atusresp$tespuhrs == -4 ] <- NA





atusresp <- rename(atusresp, replace = c("tehruslt" = "work.hours", "trsppres" = "spouse.presence.hh",
                                         "tespempnot" = "spouse.employ.status", "tespuhrs" ="spouse.work.hours",
                                         "trdtocc1" = "occupations", "trchildnum" = "num.children",
                                         "trnumhou" = "num.family.member", "telfs"="employment.status" ,
                                         "trspftpt" = "full.part.time.spouse", "trhhchild" = "presence.child", "trohhchild" = "presence.own.child"))




atusresp.subset <- atusresp[c("tucaseid", "tulineno",  "work.hours", "spouse.presence.hh", "spouse.employ.status", "spouse.work.hours", 
                              "occupations", "num.children", "num.family.member", "employment.status", "full.part.time.spouse", "presence.child", "presence.own.child"  )]









atuscps$hefaminc[atuscps$hefaminc == -1 ] <- NA

atuscps$hufaminc[atuscps$hufaminc == -3 ] <- NA
atuscps$hufaminc[atuscps$hufaminc == -2 ] <- NA
atuscps$hufaminc[atuscps$hufaminc == -1 ] <- NA


atuscps$ptdtrace[atuscps$ptdtrace == -1 ] <- NA

# marital status -1 = not valid
atuscps$pemaritl[atuscps$pemaritl == -1 ] <- 7




atuscps <- rename(atuscps, replace = c("gereg" = "region", "gestfips" = "fips", "hefaminc" = "edited.family.income", "hufaminc" = "family.income",
                                        "pemaritl" = "marital.status"))



atuscps.subset <- atuscps[c("tucaseid", "tulineno", "region", "fips", "edited.family.income", "family.income",  "marital.status" )]














combine.data <- join(total.main.job,atussum.subset,  by="tucaseid", type = "full")
combine.data <- join(combine.data,atuscps.subset,  by="tucaseid", type = "full")
combine.data <- join(combine.data,atusresp.subset, by=c("tucaseid","tulineno"), type = "full")























# definition of wfh
combine.data$wfh <- c("")

combine.data$wfh[which(combine.data$total.percent.main.job.wfh > 0.85 & (combine.data$employment.status ==  1 | combine.data$employment.status ==  2 ) )] <- 1


combine.data$wfh[which(combine.data$total.percent.main.job.wfh <= 0.85 & (combine.data$employment.status ==  1 | combine.data$employment.status ==  2 ) )] <- 0

combine.data$wfh[which(combine.data$wfh == "")] <- NA


table(combine.data$wfh)


#################################################
# definition of wfh_mom

combine.data$wfh_mom <- c("")

combine.data$wfh_mom[which(combine.data$presence.own.child == 1 & combine.data$sex == 2 & combine.data$wfh == 1  )] <- 1


combine.data$wfh_mom[which(combine.data$presence.own.child == 1 & combine.data$sex == 2 & combine.data$wfh == 0 )] <- 0

combine.data$wfh_mom[which(combine.data$wfh_mom == "")] <- NA







# only woman is included, so sex is NA





demographic.var <- c("+ age + sex + factor(race) + factor(marital.status)")

employ.var <- c("+ work.hours + factor(occupations)")
family.var <- c("+ num.children + num.family.member ")
time.var <- c("+ factor(interview.year) + factor(holiday.indicator) + factor(diary.day) ")
location.var <- c("+ factor(region) + factor(fips) ")
spouse.var <- c("+ factor(spouse.presence.hh) + factor(spouse.employ.status) +  spouse.work.hours + factor(full.part.time.spouse) ")
family.inc.var <- c("+ factor(family.income)")
childcare.service.var <- c("+ use.paid.childcare + wait.to.meet.childcare ")

yvariables <-c( "total.time.child", "grocery.shopping", "food.drink.preparation", "physical.care.hh.children","reading.to.hh.children", "play.with.hh.children")


summary(lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var, employ.var, family.var, time.var , location.var , spouse.var, family.inc.var,childcare.service.var  ), data = combine.data, weights = tufnwgtp ))


summary(lm(paste0("supervision.hh.children ~ factor(wfh_mom)*factor(spouse.presence.hh)",demographic.var, employ.var, family.var, time.var , location.var, family.inc.var,childcare.service.var  ), data = combine.data, weights = tufnwgtp ))






result1 <- lm(total.time.child ~ factor(wfh_mom), data = combine.data, weights = tufnwgtp )

result2 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var), data = combine.data, weights = tufnwgtp )





result3 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var,employ.var ), data = combine.data, weights = tufnwgtp )



result4 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var,employ.var, family.var ), data = combine.data, weights = tufnwgtp )






result5 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var,employ.var, family.var, time.var ), data = combine.data, weights = tufnwgtp )





result6 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var,employ.var, family.var, time.var, location.var ), data = combine.data, weights = tufnwgtp )





result7 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var,employ.var, family.var, time.var, location.var, family.inc.var ), data = combine.data, weights = tufnwgtp )






yvariables <-c( "total.time.child", "grocery.shopping", "food.drink.preparation", "physical.care.hh.children","reading.to.hh.children", "play.with.hh.children")








# construct another definition of wfh

#combine.data$total.percent.main.job.wfh.mom <- combine.data$total.percent.main.job.wfh


# change all wfh to NA

#for ( i in 1:nrow(combine.data)) {
#  if (is.na(combine.data$wfh_mom[i])==TRUE) {
    
#    combine.data$total.percent.main.job.wfh.mom[i]  <- NA
#  }
#}






r.full.model <- as.list("")

for (i in 1:length(yvariables)) {
  
  full.model <- lm(paste0(yvariables[i],"~ wfh_mom +age + sex + factor(race) + factor(marital.status) + work.hours  + factor(occupations) + num.children + num.family.member + factor(interview.year)+ factor(holiday.indicator) + factor(diary.day) + factor(full.part.time.spouse) + factor(region) + factor(fips) + factor(edited.family.income)" ), data = combine.data, weights = tufnwgtp )
  
  r.full.model[[i]] <- coeftest(full.model, vcov = vcovHC(full.model, "HC1"))
}




#r.full.model <- as.list("")

#for (i in 1:length(yvariables)) {
  
#  full.model <- lm(paste0(yvariables[i],"~ total.percent.main.job.wfh.mom +age + sex + factor(race) + factor(marital.status) + work.hours + factor(occupations) + num.children + num.family.member + factor(interview.year)+ factor(holiday.indicator) + factor(diary.day) + factor(full.part.time.spouse) + factor(region) + factor(fips) + factor(edited.family.income)" ), data = combine.data, weights = tufnwgtp )
  
#  r.full.model[[i]] <- coeftest(full.model, vcov = vcovHC(full.model, "HC1"))
#}












sum(!is.na(combine.data$edited.family.income))


sum(!is.na(combine.data$diary.day))



sum(!is.na(combine.data$num.family.member))









coeftest(result, vcov = vcovHC(result, "HC1"))
nrow(model.frame(result)) 

coeftest(result2, vcov = vcovHC(result2, "HC1"))
nrow(model.frame(result2))


# for cleaning data http://www.princeton.edu/~otorres/sessions/s2r.pdf


# http://www.personality-project.org/r/html/describe.by.html
#http://www.ats.ucla.edu/stat/r/faq/basic_desc.htm




combine.data$sex <- factor(combine.data$sex, levels = c(1,2), labels = c("male", "female")) 
combine.data$wfh_mom <- factor(combine.data$wfh_mom, levels = c(0,1), labels = c("not work from home", "work from home"))
combine.data$spouse.presence.hh <- factor(combine.data$spouse.presence.hh, levels = c(1,2,3), labels = c("a", "b", "c"))

#lm(total.time.child ~ spouse.presence.hh, data = combine.data, weights = tufnwgtp )

#lm(total.time.child ~ factor(spouse.presence.hh), data = combine.data, weights = tufnwgtp )




# use this to do sum stat!!!
sum.stat.data <- combine.data[!is.na(combine.data$wfh_mom),] 


sum.stat <- summary(sum.stat.data$spouse.presence.hh)
sum.stat <- stat.desc(combine.data$spouse.presence.hh, basic=F)



stargazer(sum.stat, type = "text", title="Descriptive statistics", digits=1, out="trial.txt")

