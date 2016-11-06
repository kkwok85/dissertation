install.packages("stargazer")
install.packages("plyr")
install.packages("lmtest")
install.packages("sandwich")
install.packages("pastecs")
install.packages("xtable")
install.packages("survey")
install.packages("dummies")
install.packages("dplyr")
install.packges("srvyr")
install.packages("dummies")
install.packages("ggplot2")
install.packages("reshape")
install.packages("haven")
install.packages("readstata13")
install.packages("multcomp")
install.packages("Matching") 


library(readstata13)
library(haven)

library(dummies)

library(dplyr)
library(srvyr)

library(xtable)
library(pastecs)
library(stargazer)
library(plyr)
library(lmtest)
library(sandwich)
library(Hmisc)
library(survey)
library(dummies)
library(ggplot2)
library(reshape)
library(foreign)
require(MASS)
library(multcomp)
library(Matching)


rm(list = ls())



load('E:/ATUS/0314/atusact.rda')
load('E:/ATUS/0314/atuscps.rda')
load('E:/ATUS/0314/atusresp.rda')
load('E:/ATUS/0314/atusrost.rda')
load('E:/ATUS/0314/atusrost.rda')
load('E:/ATUS/0314/atussum.rda')
load('E:/ATUS/0314/atuswgts.rda')
load('E:/ATUS/0314/atuswho.rda')
#lv.data <-  read.dta13("D:/lvresp_2011/lvresp_2011.dta", convert.factors = T, generate.factors=T)
#lvwgts.data <-  read.dta13("D:/lvwgts_2011/lvwgts_2011.dta", convert.factors = T, generate.factors=T)



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

#atusact$work.hr.indicator <- c(0)
#for (i in 1:nrow(atusact)) {

#  if (atusact$tucumdur24[i] > 240 & atusact$tucumdur24[i] <960) {
#    atusact$work.hr.indicator[i] <- 1
#  }

#}



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







# for creating secondary job wfh


total.other.job <- aggregate(atusact$tuactdur24, by=list( ID = atusact$tucaseid , code = atusact$trcodep ==50102  ), FUN=sum)



# both are ok
total.other.job.true.only <- subset(total.other.job, total.other.job$code == TRUE )
total.other.job.true.only <- total.other.job.true.only[c("ID", "code", "x")] 


# 2nd way is ok too
#total.other.job$other.job.total.time <- 1440 - total.other.job$x
#total.other.job.false.only <- subset(total.other.job, total.other.job$code == FALSE )

merge.total.other.job.true.only.IDlist <- merge(ID.list, total.other.job.true.only , by="ID", all = T)
merge.total.other.job.true.only.IDlist[is.na(merge.total.other.job.true.only.IDlist )] <- 0


# change name of the file
total.other.job <- merge.total.other.job.true.only.IDlist

# for checking only
#table(total.other.job.false.only$other.job.total.time-atussum$t050101)
table(total.other.job$x-atussum$t050102)





total.other.job.wfh <- aggregate(atusact$tuactdur24, by=list( ID = atusact$tucaseid , code = atusact$trcodep ==50102, location = atusact$tewhere == 1  ), FUN=sum)

total.other.job.wfh.true.only <- subset(total.other.job.wfh, total.other.job.wfh$code == TRUE & total.other.job.wfh$location == TRUE)


colnames(total.other.job.wfh.true.only)[which(names(total.other.job.wfh.true.only) == "x")] <- "total.other.job.wfh.time" 

colnames(total.other.job)[which(names(total.other.job) == "x")] <- "total.other.job.time" 




total.other.job <- join(total.other.job, total.other.job.wfh.true.only, by="ID")


total.other.job[is.na(total.other.job )] <- 0
total.other.job$total.percent.other.job.wfh <- total.other.job$total.other.job.wfh.time/total.other.job$total.other.job.time


total.other.job[is.na(total.other.job )] <- 0




colnames(total.other.job)[which(names(total.other.job) == "ID")] <- "tucaseid" 


# final product
total.other.job <- total.other.job[c("tucaseid", "total.other.job.time", "total.other.job.wfh.time", "total.percent.other.job.wfh")]


















###### construct data for secondary #####

atusact$sec.child.care_main.job <- 0
atusact$sec.child.care_sec.job <- 0
atusact$sec.child.care_house.act <- 0
atusact$sec.child.care_cosumer.pur <- 0

atusact$sec.child.care_prof.personal.care <- 0
atusact$sec.child.care_house.ser <- 0
atusact$sec.child.care_govt.ser <- 0
atusact$sec.child.care_eat.drink <- 0
atusact$sec.child.care_social.act <- 0
atusact$sec.child.care_sport.act <- 0
atusact$sec.child.care_religion.act <- 0
atusact$sec.child.care_volunt.act <- 0
atusact$sec.child.care_phone.call <- 0
atusact$sec.child.care_traveling <- 0



atusact$sec.child.care_main.job[which(atusact$trcodep ==50101 & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(atusact$trcodep ==50101 & atusact$trtcc_ln > 0 )]
atusact$sec.child.care_sec.job[which(atusact$trcodep ==50102 & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(atusact$trcodep ==50102 & atusact$trtcc_ln > 0 )]


atusact$sec.child.care_house.act[which(  (atusact$trcodep >= 20101 & atusact$trcodep <= 29999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 20101 & atusact$trcodep <= 29999) & atusact$trtcc_ln > 0 )]

atusact$sec.child.care_cosumer.pur[which(  (atusact$trcodep >= 70101 & atusact$trcodep <= 79999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 70101 & atusact$trcodep <= 79999) & atusact$trtcc_ln > 0 )]
atusact$sec.child.care_prof.personal.care[which(  (atusact$trcodep >= 80101 & atusact$trcodep <= 89999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 80101 & atusact$trcodep <= 89999) & atusact$trtcc_ln > 0 )]
atusact$sec.child.care_house.ser[which(  (atusact$trcodep >= 90101 & atusact$trcodep <= 99999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 90101 & atusact$trcodep <= 99999) & atusact$trtcc_ln > 0 )]
atusact$sec.child.care_govt.ser[which(  (atusact$trcodep >= 100101 & atusact$trcodep <= 109999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 100101 & atusact$trcodep <= 109999) & atusact$trtcc_ln > 0 )]

atusact$sec.child.care_eat.drink[which(  (atusact$trcodep >= 110101 & atusact$trcodep <= 119999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 110101 & atusact$trcodep <= 119999) & atusact$trtcc_ln > 0 )]
atusact$sec.child.care_social.act[which(  (atusact$trcodep >= 120101 & atusact$trcodep <= 129999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 120101 & atusact$trcodep <= 129999) & atusact$trtcc_ln > 0 )]
atusact$sec.child.care_sport.act[which(  (atusact$trcodep >= 130101 & atusact$trcodep <= 139999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 130101 & atusact$trcodep <= 139999) & atusact$trtcc_ln > 0 )]

atusact$sec.child.care_religion.act[which(  (atusact$trcodep >= 140101 & atusact$trcodep <= 149999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 140101 & atusact$trcodep <= 149999) & atusact$trtcc_ln > 0 )]
atusact$sec.child.care_volunt.act[which(  (atusact$trcodep >= 150101 & atusact$trcodep <= 159999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 150101 & atusact$trcodep <= 159999) & atusact$trtcc_ln > 0 )]

atusact$sec.child.care_phone.call[which(  (atusact$trcodep >= 160101 & atusact$trcodep <= 169999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 160101 & atusact$trcodep <= 169999) & atusact$trtcc_ln > 0 )]
atusact$sec.child.care_traveling[which(  (atusact$trcodep >= 180101 & atusact$trcodep <= 189999)  & atusact$trtcc_ln > 0 )] <- atusact$trtcc_ln[which(   (atusact$trcodep >= 180101 & atusact$trcodep <= 189999) & atusact$trtcc_ln > 0 )]


atusact$sec.child.care_total.job <- atusact$sec.child.care_main.job + atusact$sec.child.care_sec.job

# atusact$sec.child.care_traveling[ which( atusact$trtcc_ln > 0  & atusact$tucaseid == 20030101031654)]









# use these to check: 20030101031654 20030101031749 20030101032030  20030101032943

# check aggregate
# atusact$sec.child.care_main.job[which(atusact$tucaseid == 20030101031654)]
# head(total.sec.child.care_main.job.data[which(total.sec.child.care_main.job.data$ID == 20030101031654),])   # seond line and this line should be equal





get.ID.data <- aggregate(atusact$sec.child.care_main.job , by=list( ID = atusact$tucaseid  ), FUN=sum)



#names(total.sec.child.care_main.job.data)[names(total.sec.child.care_main.job.data)=="x"] <- "sec.child.care_main.job"



# sec.child.care_house.act , sec.child.care_eat.drink, sec.child.care_social.act


temp.name <- c("sec.child.care_main.job", "sec.child.care_sec.job" ,"sec.child.care_house.act", "sec.child.care_cosumer.pur" , "sec.child.care_prof.personal.care" , "sec.child.care_house.ser" , "sec.child.care_govt.ser",  
               "sec.child.care_eat.drink", "sec.child.care_social.act" , "sec.child.care_sport.act", "sec.child.care_religion.act", "sec.child.care_volunt.act", "sec.child.care_phone.call", "sec.child.care_traveling" , "sec.child.care_total.job")



combine.sec.child.care <- as.data.frame(get.ID.data$ID)
names(combine.sec.child.care  )[names(combine.sec.child.care  )=="get.ID.data$ID"] <- "ID"



for (i in 1:length(temp.name)) {
  

  
  temp.data.sec <- eval((parse(text=    paste0("aggregate(atusact$", temp.name[i], " , by=list( ID = atusact$tucaseid  ), FUN=sum)")    )))
  
  names(temp.data.sec )[names(temp.data.sec )=="x"] <- temp.name[i]
  
  combine.sec.child.care <- join(temp.data.sec , combine.sec.child.care , by="ID", type = "full")


}


# check aggregate
# atusact$sec.child.care_main.job[which(atusact$tucaseid == 20030101031654)]
# head(total.sec.child.care_main.job.data[which(total.sec.child.care_main.job.data$ID == 20030101031654),])   # seond line and this line should be equal



names(combine.sec.child.care)[names(combine.sec.child.care)=="ID"] <- "tucaseid"




# 110101 ,2


# generate y variables
# this is just to test this function
#atussum$total.time.child <- as.data.frame(rowSums(subset(atussum, select=grep("^t0301|^t0302|t0303", names(atussum), value = TRUE))))

#temp.data <- ""
#for ( i in 1:3){ 
#  if (i <10) {
#    num <-paste0("0",i)
#  }
#  else {
#    num <-i 
#  } 
  
#  search.head <- paste0("^t",num)
  
#  temp.data <- subset(atussum, select=c(grep(search.head, names(atussum), value = TRUE) )) 
#  temp.data <-cbind(atussum$tucaseid, temp.data)

#  result[[i]] <- as.data.frame(rowSums(temp.data[,-1] ,na.rm=TRUE)) 

#} 
 


# for test 
#test.care <- as.data.frame(rowSums(subset(atussum, select=grep("^t03", names(atussum), value = TRUE))))

#table(result[[3]]- test.care)










########### create total01 to total18
temp.data2 <- ""
temp.data <- ""
for ( i in c(1:16, 18)){ 
  if (i <10) {
    num <-paste0("0",i)
  }
  else {
    num <-i 
  } 

  search.head <- paste0("^t",num)

  temp.data <- subset(atussum, select=c(grep(search.head, names(atussum), value = TRUE) )) 
  temp.data <-cbind(atussum$tucaseid, temp.data)

  temp.data2 <- as.data.frame(rowSums(temp.data[,-1] ,na.rm=TRUE)) 
  temp.data2 <-cbind(atussum$tucaseid, temp.data2)
  colnames(temp.data2) <- c("tucaseid", paste0("total",num) )
  atussum  <- join(atussum, temp.data2, by=c("tucaseid"), type = "full")
  
  
} 


# for testing. Table should have everything zero
test.care <- as.data.frame(rowSums(subset(atussum, select=grep("^t03", names(atussum), value = TRUE))))
table(atussum$total03 - test.care)




atussum$total.time.child = atussum$t030101+ atussum$t030102+ atussum$t030103+ atussum$t030104+ atussum$t030105+ 
  atussum$t030186 + atussum$t030108+ atussum$t030109 + atussum$t030110 + atussum$t030111 + atussum$t030112 + 
  atussum$t030199 + atussum$t030201 + atussum$t030202 + atussum$t030203 + atussum$t030204 + atussum$t030299 + 
  atussum$t030301 + atussum$t030302 + atussum$t030303 + atussum$t030399


atussum$total.time.adults = atussum$t030401 + atussum$t030402 + atussum$t030403 + atussum$t030404 + atussum$t030405 +
                            atussum$t030499 + atussum$t030501 + atussum$t030502 + atussum$t030503 + atussum$t030504 + 
                            atussum$t030599

atussum$total.travel.work.time <- atussum$t180501 + atussum$t180502 + atussum$t180589

atussum$total.grooming.time <- atussum$t010201 + atussum$t010299 





atussum$teschenr[atussum$teschenr == -1 ] <- NA
atussum$teschenr[atussum$teschenr == -3 ] <- NA

atussum$teschenr[atussum$teage >= 50 &  atussum$teage <= 100] <- 2



atussum$edited.teschenr.indicator <- 0
atussum$edited.teschenr.indicator[atussum$teage >= 50 &  atussum$teage <= 100] <- 1 
table(atussum$edited.teschenr.indicator)




#combine.data$total.travel.work.time <- combine.data$travel.work + combine.data$travel.work.related + combine.data$travel.work.other

atussum <- rename(atussum, replace = c("t070101" = "grocery.shopping", "t020201" = "food.drink.preparation", "t070103" = "purchasing.food",
                                       "t030101" = "physical.care.hh.children" , "t030102" = "reading.to.hh.children" , 
                                       "t030103" = "play.with.hh.children", "t030105" = "play.sports.with.hh.children", "t030112" = "pick.drop.hh.child",
                                       "t030186" = "talk.listening.to.hh.children", 
                                       "t030108" = "organization.plan.for.hh.children", "t030109" = "supervision.hh.children",
                                       "t030201" = "homework.hh.children", "t030202" = "meetings.school.conference.hh.children",
                                       "t030203" = "home.school.hh.children",
                                       "t030301" = "provide.medical.care.hh.children", "t030302" = "obtain.medical.care.hh.children", 
                                       "t030303" = "wait.child.health", "t030399" = "child.health.other", 
                                       "t120303" = "TV.movies",
                                       "t180381" = "travel.caring.help.hh.child", "t180501" = "travel.work", "t180502" = "travel.work.related", "t180589" ="travel.work.other",
                                       "t080101" = "use.paid.childcare", "t080102" = "wait.to.meet.childcare", "t080199" = "childcare.other", "t180801" = "travel.use.childcare", "t160107" = "phone.call.care.provider", 
                                       "t050101" = "work.main.job", "t050102" = "work.other.job", 
                                       "tuyear" = "interview.year", "trholiday" = "holiday.indicator" , "pehspnon" = "hispanic", 
                                       "peeduca" = "school.level.completed", "teschenr" = "enrolled.school.atus", 
                                       "tudiaryday" = "diary.day", "teage" = "age" , "tesex" = "sex",  "ptdtrace" = "race"
))





atussum.subset <- atussum[c("tucaseid","total.travel.work.time", "total.grooming.time", "total.time.child", "total.time.adults", "grocery.shopping", "food.drink.preparation", "purchasing.food",
                            "physical.care.hh.children", "reading.to.hh.children", 
                            "play.with.hh.children", "play.sports.with.hh.children", "pick.drop.hh.child", "talk.listening.to.hh.children", 
                            "organization.plan.for.hh.children", "supervision.hh.children",
                            "homework.hh.children", "meetings.school.conference.hh.children",
                            "home.school.hh.children",
                            "provide.medical.care.hh.children", "obtain.medical.care.hh.children",
                            "wait.child.health", "child.health.other", "TV.movies",
                            "travel.caring.help.hh.child", "travel.work", "travel.work.related", "travel.work.other", 
                            "use.paid.childcare", "wait.to.meet.childcare", "childcare.other", "travel.use.childcare", "phone.call.care.provider",
                            "work.main.job", "work.other.job",
                            "interview.year", "holiday.indicator", "school.level.completed", "enrolled.school.atus", "edited.teschenr.indicator", 
                            "total01", "total02", "total03", "total04", "total05", "total06", "total07" , "total08", "total09" , "total10", "total11",
                            "total12", "total13", "total14", "total15", "total16", "total18",
                            "diary.day", "age", "sex", "race", "hispanic", "tufnwgtp")]







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

atusresp$trernwa[atusresp$trernwa == -1 ] <- NA
atusresp$trwernal[atusresp$trwernal == -1 ] <- NA


atusresp$tudis[atusresp$tudis == -1 ] <- 0
atusresp$tudis[atusresp$tudis == -2 ] <- NA
atusresp$tudis[atusresp$tudis == -3 ] <- NA



atusresp$tryhhchild[atusresp$tryhhchild == -1 ] <- NA



atusresp$tubus[atusresp$tubus == -1 ] <- NA
atusresp$tubus[atusresp$tubus == -2 ] <- NA
atusresp$tubus[atusresp$tubus == -3 ] <- NA


atusresp$tubus1[atusresp$tubus1 == -2 ] <- NA
atusresp$tubus1[atusresp$tubus1 == -1 ] <- 2



atusresp$teabsrsn[which(atusresp$telfs == 1)] <- 1
atusresp$teabsrsn[which(atusresp$telfs >= 3)] <- 16



atusresp$teio1cow[which(atusresp$teio1cow == -1)] <- 9

atusresp$trthh[which(atusresp$trthh == -1)] <- NA


atusresp <- rename(atusresp, replace = c("tehruslt" = "work.hours", "trsppres" = "spouse.presence.hh",
                                         "tespempnot" = "spouse.employ.status", "tespuhrs" ="spouse.work.hours",
                                         "trdtocc1" = "occupations", "trchildnum" = "num.children",
                                         "trernwa" = "weekly.earnings", "ttwk" = "weekly.earning.top.coded", "trwernal" = "allocation.flag.week.earn",
                                         "trnumhou" = "num.family.member", "telfs"="employment.status" ,"teernhry" = "hourly.status", "teernper" = "earnings.report.way", "teio1cow" = "class.worker",
                                         "teernrt" = "hourly.rate.if.report.other", 
                                         "teabsrsn" = "reason.absent.last.week.atus",
                                         "tudis" = "disability", "tryhhchild" = "age.youngest.child", 
                                         "tubus" = "household.own.bus", "tubus1" = "unpaid.work.family.bus",
                                         "trspftpt" = "full.part.time.spouse", "trhhchild" = "presence.child", "trohhchild" = "presence.own.child", "trtcc" = "sec.child.care.hh.nhh", "trthh" = "sec.child.care.hh" ))




atusresp.subset <- atusresp[c("tucaseid", "tulineno",  "work.hours", "spouse.presence.hh", "spouse.employ.status", "spouse.work.hours", 
                              "occupations", "num.children", "num.family.member", "employment.status", "hourly.status", "earnings.report.way", "class.worker","hourly.rate.if.report.other", 
                              "weekly.earnings", "weekly.earning.top.coded", "allocation.flag.week.earn", "reason.absent.last.week.atus", "disability", "age.youngest.child", 
                              "hourly.rate.if.report.other", "full.part.time.spouse", "presence.child", "presence.own.child" , "household.own.bus", "unpaid.work.family.bus", "sec.child.care.hh.nhh", "sec.child.care.hh"  )]









atuscps$hefaminc[atuscps$hefaminc == -1 ] <- NA

atuscps$hufaminc[atuscps$hufaminc == -3 ] <- NA
atuscps$hufaminc[atuscps$hufaminc == -2 ] <- NA
atuscps$hufaminc[atuscps$hufaminc == -1 ] <- NA


atuscps$ptdtrace[atuscps$ptdtrace == -1 ] <- NA

# marital status -1 = not valid
atuscps$pemaritl[atuscps$pemaritl == -1 ] <- 7



atuscps$pehractt[atuscps$pehractt == -1 ] <- 0



atuscps$pehractt[atuscps$pehractt == -1 ] <- 0

atuscps$penlfact[atuscps$penlfact == -1 ] <- 7


atuscps$peschenr[atuscps$peschenr == -1 ] <- 3

atuscps$peschft[atuscps$peschft == -1 ] <- 3

atuscps$peschlvl[atuscps$peschlvl == -1 ] <- 3

atuscps$prabsrea[atuscps$prabsrea == -1 ] <- 0

atuscps$prabsrea[which(atuscps$pemlr>=3)] <- 41
atuscps$prabsrea[which(atuscps$pemlr==1)] <- 42
atuscps$prabsrea[which(atuscps$prpertyp==1)] <- 43
atuscps$prabsrea[which(atuscps$prpertyp==3)] <- 44


atuscps$peabsrsn[which(atuscps$pemlr>=3)] <- 41
atuscps$peabsrsn[which(atuscps$pemlr==1)] <- 42
atuscps$peabsrsn[which(atuscps$prpertyp==1)] <- 43
atuscps$peabsrsn[which(atuscps$prpertyp==3)] <- 44




atuscps$prptrea[which(atuscps$pemlr==2)] <- 40
atuscps$prptrea[which(atuscps$pemlr>=3)] <- 41
atuscps$prptrea[which(atuscps$prpertyp==1)] <- 43
atuscps$prptrea[which(atuscps$prpertyp==3)] <- 44
atuscps$prptrea[atuscps$prptrea == -1 ] <- 45 #dont mess up with the order!!!!






atuscps <- rename(atuscps, replace = c("gereg" = "region", "gestfips" = "fips", "hefaminc" = "edited.family.income", "hufaminc" = "family.income",
                                       "pemaritl" = "marital.status", "pehractt" = "work.hours.last.week", "penlfact" = "current.situation", "prabsrea" = "reason.not.work", 
                                       "peschenr" = "enrolled.school", "peschft" = "full.part.stud", "peschlvl" = "hs.college",
                                       "peabsrsn" = "reason.absent.last.week", "prptrea" = "reason.pt.work", "gtmetsta" = "metropolitan.status" , "tratusr" = "respond.atus" ))



atuscps.subset <- atuscps[c("tucaseid", "tulineno", "region", "fips", "edited.family.income", "family.income",  "marital.status", "work.hours.last.week", "current.situation", "reason.not.work", "reason.absent.last.week" ,
                            "enrolled.school", "full.part.stud","hs.college", "reason.pt.work", "metropolitan.status" , "respond.atus")]


















combine.data <- join(total.main.job,atussum.subset,  by="tucaseid", type = "full")
combine.data <- join(combine.data, total.other.job,  by="tucaseid", type = "full")
combine.data <- join(combine.data, combine.sec.child.care,  by="tucaseid", type = "full")




combine.data <- join(combine.data,atuscps.subset,  by="tucaseid", type = "full")
combine.data <- join(combine.data,atusresp.subset, by=c("tucaseid","tulineno"), type = "full")







combine.data <- join(combine.data,lv.data , by=c("tucaseid","tulineno"), type = "full")

combine.data <- join(combine.data,lvwgts.data , by=c("tucaseid"), type = "full")










#######################################################################
# creation of variables
combine.data$school.level.completed.edit <- c("")
combine.data$school.level.completed.edit[which(combine.data$school.level.completed <= 38 )] <- 1   # less than HS
combine.data$school.level.completed.edit[which(combine.data$school.level.completed == 39 )] <- 2   # HS
combine.data$school.level.completed.edit[which(combine.data$school.level.completed == 40 | combine.data$school.level.completed == 41 | 
                                               combine.data$school.level.completed == 42)] <- 3   # Some College/asso
combine.data$school.level.completed.edit[which(combine.data$school.level.completed >= 43 )] <- 4   # college or above
combine.data$school.level.completed.edit[which(combine.data$school.level.completed.edit == "")] <- NA




combine.data$school.level.completed.edit <- factor(combine.data$school.level.completed.edit, levels=c(1,2,3,4), labels = c("Less than HS", "HS", "Some college/Associate Degree", "College or above"))






# definition of employment
combine.data$edited.employ.status <- c("")
combine.data$edited.employ.status[which(combine.data$employment.status ==  1 | combine.data$employment.status ==  2 ) ] <- 1
combine.data$edited.employ.status[which(combine.data$employment.status ==  3 | combine.data$employment.status ==  4 | combine.data$employment.status ==  5) ] <- 0
combine.data$edited.employ.status[which(combine.data$edited.employ.status == "")] <- NA
table(combine.data$edited.employ.status)





# definition of wfh
combine.data$wfh <- c("")
combine.data$wfh[which(combine.data$total.percent.main.job.wfh > 0.85 & (combine.data$employment.status ==  1 | combine.data$employment.status ==  2 ) )] <- 1
combine.data$wfh[which(combine.data$total.percent.main.job.wfh <= 0.85 & (combine.data$employment.status ==  1 | combine.data$employment.status ==  2 ) )] <- 0
combine.data$wfh[which(combine.data$employment.status ==  3 | combine.data$employment.status ==  4 | combine.data$employment.status ==  5 ) ] <- 2
combine.data$wfh[which(combine.data$wfh == "")] <- NA
table(combine.data$wfh)



combine.data$wfh.v2 <- c(0)
combine.data$wfh.v2[which(combine.data$total.percent.main.job.wfh > 0.50 & (combine.data$employment.status ==  1 | combine.data$employment.status ==  2 )
                          & combine.data$holiday.indicator == 0 & (combine.data$diary.day >1 & combine.data$diary.day < 7  ) &  combine.data$total.main.job.time > 60  ) ] <- 1
combine.data$wfh.v2[which(combine.data$employment.status ==  3 | combine.data$employment.status ==  4 | combine.data$employment.status ==  5 ) ] <- 2
combine.data$wfh.v2[which(combine.data$wfh == "")] <- NA
table(combine.data$wfh.v2)





# wfh.v3 combine first job and second job
combine.data$total.job.time <- combine.data$total.main.job.time + combine.data$total.other.job.time
combine.data$total.job.wfh.time <- combine.data$total.main.job.wfh.time + combine.data$total.other.job.wfh.time
combine.data$total.percent.total.job.wfh <-  combine.data$total.job.wfh.time/combine.data$total.job.time

combine.data$wfh.v3 <- c(0)
combine.data$wfh.v3[which(combine.data$total.percent.total.job.wfh > 0.50 & (combine.data$employment.status ==  1 | combine.data$employment.status ==  2 )
                          & combine.data$holiday.indicator == 0 & (combine.data$diary.day >1 & combine.data$diary.day < 7  ) &  combine.data$total.job.time > 60  ) ] <- 1
combine.data$wfh.v3[which(combine.data$employment.status ==  3 | combine.data$employment.status ==  4 | combine.data$employment.status ==  5 ) ] <- 2
combine.data$wfh.v3[which(combine.data$wfh == "")] <- NA
table(combine.data$wfh.v3)

combine.data$wfh.v3 <- factor(combine.data$wfh.v3, levels=c(0,1,2), 
                                           labels = c("nwfh", "wfh", "Unemployed"))


# definition of wfh_mom
combine.data$wfh_mom <- c("")
combine.data$wfh_mom[which(combine.data$presence.own.child == 1 & combine.data$sex == 2 & combine.data$wfh == 1  )] <- 1
combine.data$wfh_mom[which(combine.data$presence.own.child == 1 & combine.data$sex == 2 & combine.data$wfh == 0 )] <- 0
combine.data$wfh_mom[which(combine.data$presence.own.child == 1 & combine.data$sex == 2 & combine.data$wfh == 2 )] <- 2
combine.data$wfh_mom[which(combine.data$wfh_mom == "")] <- NA
table(combine.data$wfh_mom)





combine.data$wfh_mom.v2 <- c("")
combine.data$wfh_mom.v2[which(combine.data$presence.own.child == 1 & combine.data$sex == 2 & combine.data$wfh.v2 == 1  )] <- 1
combine.data$wfh_mom.v2[which(combine.data$presence.own.child == 1 & combine.data$sex == 2 & combine.data$wfh.v2 == 0 )] <- 0
combine.data$wfh_mom.v2[which(combine.data$presence.own.child == 1 & combine.data$sex == 2 & combine.data$wfh.v2 == 2 )] <- 2
combine.data$wfh_mom.v2[which(combine.data$wfh_mom.v2 == "")] <- NA
table(combine.data$wfh_mom.v2)







# edit definition of spouse presence ( not fill in NA)
combine.data$edit.spouse.presence <- ""
combine.data$edit.spouse.presence <- combine.data$spouse.presence.hh
combine.data$edit.spouse.presence[which(combine.data$edit.spouse.presence == 2) ]<- 1 # this is correct, dont change it
combine.data$edit.spouse.presence[which(combine.data$edit.spouse.presence == "")] <- NA
table(combine.data$edit.spouse.presence)


combine.data$children.sick.indicator <- as.numeric(c(""))
combine.data$children.sick.indicator[which(combine.data$provide.medical.care.hh.children > 0 | combine.data$obtain.medical.care.hh.children > 0 |
                                          combine.data$wait.child.health > 0 | combine.data$child.health.other > 0)] <- 1
                                                                                                        
combine.data$children.sick.indicator[which(combine.data$provide.medical.care.hh.children == 0 & combine.data$obtain.medical.care.hh.children == 0 &
                                          combine.data$wait.child.health == 0 & combine.data$child.health.other == 0)] <- 0


## fill in NA for family.income

# for finding the mode of family.income

# another way to see weighted mode:
#sum((combine.data.regress.v2$family.income[which(combine.data.regress.v2$family.income==14)])*(combine.data.regress.v2$tufnwgtp[which(combine.data.regress.v2$family.income==14)]))









############old impute start here############

#atuscps.income.mode <- atuscps.subset[which(atuscps.subset$tulineno==1),]
#sort(table(atuscps.income.mode$family.income )) 
#mode <- names(which(table(atuscps.income.mode$family.income ) == max(table(atuscps.income.mode$family.income ))))

#mode <- as.integer(mode)

# mode is 14!!




#combine.data$edited.family.income2 <- c("")
#combine.data$edited.family.income2 <- combine.data$family.income
#combine.data$edited.family.income2[is.na(combine.data$family.income)] <- mode

#combine.data$edited.family.income2.indicator <- 0
#combine.data$edited.family.income2.indicator[is.na(combine.data$family.income)] <- 1 
#table(combine.data$edited.family.income2.indicator)














# check mean and match it with ATUS example. The first answer is 24.62, the second one is 114
#weighted.mean(combine.data.complete$total.time.child[which(combine.data.complete$interview.year==2006)], combine.data.complete$tufnwgtp[which(combine.data.complete$interview.year==2006)], na.rm=TRUE)


#b <- combine.data.complete[which(combine.data.complete$total.time.child > 0), ]
#weighted.mean(b$total.time.child[which(b$interview.year==2006)], b$tufnwgtp[which(b$interview.year==2006)], na.rm=TRUE)

# num.children is taken simply to drop those NA. It is ok to use num.children
data.for.earnings <- combine.data[which(is.na(combine.data$num.children)==FALSE), ]


# at this moment use weighted mean

mean.weekly.earnings <- weighted.mean(data.for.earnings$weekly.earnings, data.for.earnings$tufnwgtp, na.rm=TRUE)






#combine.data$edited.weekly.earnings <- c("")
#combine.data$edited.weekly.earnings <- combine.data$weekly.earnings
#combine.data$edited.weekly.earnings[is.na(combine.data$weekly.earnings)] <- mean.weekly.earnings
#combine.data$edited.weekly.earnings <- combine.data$edited.weekly.earnings/100



#combine.data$edited.weekly.earnings.indicator <- 0
#combine.data$edited.weekly.earnings.indicator[is.na(combine.data$weekly.earnings)] <- 1 
#table(combine.data$edited.weekly.earnings.indicator)






## fill in NA for occupations

combine.data$edited.occupations <- c("")
combine.data$edited.occupations <- combine.data$occupations
combine.data$edited.occupations[is.na(combine.data$occupations)] <- 23

combine.data$edited.occupations.indicator <- 0
combine.data$edited.occupations.indicator[is.na(combine.data$occupations)] <- 1 
table(combine.data$edited.occupations.indicator)



mean.work.hours <- weighted.mean(data.for.earnings$work.hours, data.for.earnings$tufnwgtp, na.rm=TRUE)
## fill in NA work.hours
combine.data$edited.work.hours <- c("")
combine.data$edited.work.hours <- combine.data$work.hours
combine.data$edited.work.hours[is.na(combine.data$work.hours)] <- mean.work.hours


combine.data$edited.work.hours.indicator <- 0
combine.data$edited.work.hours.indicator[is.na(combine.data$work.hours)] <- 1 
table(is.na(combine.data$work.hours))
table(combine.data$edited.work.hours.indicator)





## fill in NA for spouse.work.hours (be careful or this!!!)
## if no spouse, or spouse not employed, then they are 0 work hours
combine.data$edited.spouse.work.hours <- c("")

combine.data$edited.spouse.work.hours <- combine.data$spouse.work.hours
combine.data$edited.spouse.work.hours[is.na(combine.data$spouse.work.hours)] <- 0


combine.data$edited.spouse.work.hours.indicator <- 0
combine.data$edited.spouse.work.hours.indicator[is.na(combine.data$spouse.work.hours)] <- 1 
table(is.na(combine.data$spouse.work.hours))
table(combine.data$edited.spouse.work.hours.indicator)





combine.data$hourly.status <- factor(combine.data$hourly.status, levels = c(1,2,-1), labels = c("hourly", "not hourly", "invalid"))




combine.data$edited.employ.status <- factor(combine.data$edited.employ.status, levels=c(0,1), labels = c("Not employed", "Employed"))





combine.data$edit.spouse.presence <- factor(combine.data$edit.spouse.presence, levels=c(1,3), labels = c("Spouse present", "Spouse not present"))



#combine.data$edited.family.income2 <- ordered(combine.data$edited.family.income2 , levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16), 
 #                                             labels = c("Less than $5,000", 
  #                                                       "$5,000 to $7,499",
   #                                                      "$7,500 to $9,999",
    #                                                     "$10,000 to $12,499",
     #                                                    "$12,500 to $14,999",
      #                                                   "$15,000 to $19,999",
       #                                                  "$20,000 to $24,999",
        #                                                 "$25,000 to $29,999",
         #                                                "$30,000 to $34,999",
          #                                               "$35,000 to $39,999",
           #                                              "$40,000 to $49,999",
            #                                             "$50,000 to $59,999",
             #                                            "$60,000 to $74,999",
              #                                           "$75,000 to $99,999",
               #                                          "$100,000 to $149,999",
                #                                         "$150,000 and over"
                 #                             ))




combine.data$edited.occupations <- factor(combine.data$edited.occupations, 
                                          levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17, 18, 19, 20, 21, 22,23), 
                                          labels = c("Management",
                                                     "Business and financial operations",
                                                     "Computer and mathematical science",
                                                     "Architecture and engineering",
                                                     "Life, physical, and social science",
                                                     "Community and social service",
                                                     "Legal",
                                                     "Education, training, and library",
                                                     "Arts, design, entertainment, sports, and media",
                                                     "Healthcare practitioner and technical",
                                                     "Healthcare support",
                                                     "Protective service",
                                                     "Food preparation and serving related",
                                                     "Building and grounds cleaning and maintenance",
                                                     "Personal care and service",
                                                     "Sales and related",
                                                     "Office and administrative support",
                                                     "Farming, fishing, and forestry",
                                                     "Construction and extraction",
                                                     "Installation, maintenance, and repair",
                                                     "Production",
                                                     "Transportation and material moving",
                                                     "Not employed"
                                          ))







combine.data$sex <- factor(combine.data$sex, levels=c(1,2), labels = c("Male", "Female"))

#combine.data$race <- factor(combine.data$race)


# checked, totall correct
#http://kfoster.ccny.cuny.edu/classes/spring2011/eco290/ATUS_overview.html tells how to classify
combine.data$race.edit <- c("")
combine.data$race.edit[which(combine.data$hispanic == 2 & combine.data$race == 1)] <- 1   #white
combine.data$race.edit[which(combine.data$hispanic == 2 & combine.data$race == 2)] <- 2   #black
combine.data$race.edit[which(combine.data$hispanic == 2 & combine.data$race == 4)] <- 4  # Asian
combine.data$race.edit[which(combine.data$hispanic == 2 & 
                              (combine.data$race != 1 & combine.data$race != 2 & combine.data$race != 4  ))] <- 5  # other


combine.data$race.edit[which(combine.data$hispanic == 1 )] <- 3  # Hispanic

combine.data$race.edit[which(combine.data$race.edit == "" )] <- NA
combine.data$marital.status.edit <- factor(combine.data$marital.status.edit, levels=c(1,2,3, 4, 5), 
                                           labels = c("Non-hispanic White", "Non-hispanic Black", "Hispanic", "Non-hispanic Asian", "Others"))
head(combine.data[,c("hispanic","race", "race.edit")])











combine.data$marital.status <- factor(combine.data$marital.status, levels=c(1,2,3,4,5,6), 
                                      labels = c("Married-spouse present", "Married-spouse absent", "Widowed", "Divorced", "Separated", "Never married"))


combine.data$marital.status.edit <- c("")
combine.data$marital.status.edit[which(combine.data$marital.status == "Married-spouse present" | combine.data$marital.status == "Married-spouse absent")] <- 1
combine.data$marital.status.edit[which(combine.data$marital.status == "Widowed" | combine.data$marital.status == "Divorced" | combine.data$marital.status == "Separated" )] <- 2
combine.data$marital.status.edit[which(combine.data$marital.status == "Never married")] <- 3


combine.data$marital.status.edit <- factor(combine.data$marital.status.edit, levels=c(1,2,3), 
                                      labels = c("Married", "Divorced, separated or widowed", "Never married"))









combine.data$occupations <- factor(combine.data$occupations, 
                                   levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17, 18, 19, 20, 21, 22), 
                                   labels = c("Management",
                                              "Business and financial operations",
                                              "Computer and mathematical science",
                                              "Architecture and engineering",
                                              "Life, physical, and social science",
                                              "Community and social service",
                                              "Legal",
                                              "Education, training, and library",
                                              "Arts, design, entertainment, sports, and media",
                                              "Healthcare practitioner and technical",
                                              "Healthcare support",
                                              "Protective service",
                                              "Food preparation and serving related",
                                              "Building and grounds cleaning and maintenance",
                                              "Personal care and service",
                                              "Sales and related",
                                              "Office and administrative support",
                                              "Farming, fishing, and forestry",
                                              "Construction and extraction",
                                              "Installation, maintenance, and repair",
                                              "Production",
                                              "Transportation and material moving"
                                   ))






combine.data$interview.year <- ordered(combine.data$interview.year)





combine.data$holiday.indicator <- factor(combine.data$holiday.indicator, levels=c(0,1), labels = c("Not holiday", "Holiday"))





combine.data$diary.day <- factor(combine.data$diary.day, levels=c(1,2,3,4,5,6,7), 
                                 labels = c("Sunday",
                                            "Monday",
                                            "Tuesday",
                                            "Wednesday",
                                            "Thursday",
                                            "Friday",
                                            "Saturday"))





combine.data$region <- factor(combine.data$region)
combine.data$fips <- factor(combine.data$fips)



combine.data$spouse.presence.hh <- factor(combine.data$spouse.presence.hh, levels=c(1,2,3), labels = c("Spouse present", "Unmarried partner present", "No spouse/partner present" ))




combine.data$spouse.employ.status <- factor(combine.data$spouse.employ.status, levels=c(1,2,3), labels = c("Employed", "Not Employed", "No spouse/partner present"))
combine.data$full.part.time.spouse <- factor(combine.data$full.part.time.spouse, levels=c(1,2,3,4), labels = c("Full time", "Part time", "Hours vary", "No partner/not employed"))


#combine.data$family.income <- ordered(combine.data$family.income, levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16), 
#                                      labels = c("Less than $5,000", 
#                                                 "$5,000 to $7,499",
#                                                 "$7,500 to $9,999",
#                                                 "$10,000 to $12,499",
#                                                 "$12,500 to $14,999",
#                                                 "$15,000 to $19,999",
#                                                 "$20,000 to $24,999",
#                                                 "$25,000 to $29,999",
#                                                 "$30,000 to $34,999",
#                                                 "$35,000 to $39,999",
#                                                 "$40,000 to $49,999",
#                                                 "$50,000 to $59,999",
#                                                 "$60,000 to $74,999",
#                                                 "$75,000 to $99,999",
#                                                "$100,000 to $149,999",
#                                                 "$150,000 and over"
#                                      ))






combine.data$wfh <- factor(combine.data$wfh, levels=c(0,1,2), labels = c("Work at office or other locations", "Work from home", "Unemployed/Not in labor force"))
combine.data$wfh.v2 <- factor(combine.data$wfh.v2, levels=c(0,1,2), labels = c("Work at office or other locations", "Work from home", "Unemployed/Not in labor force"))

combine.data$wfh_mom <- factor(combine.data$wfh_mom, levels=c(0,1,2), labels = c("Work at office or other locations", "Work from home", "Unemployed/Not in labor force"))
combine.data$wfh_mom.v2 <- factor(combine.data$wfh_mom.v2, levels=c(0,1,2), labels = c("Work at office or other locations", "Work from home", "Unemployed/Not in labor force"))





###################################################  create new variable for imputation #########################



# estimate miner equation and impute for self-employed



combine.data$school.years <- as.numeric(c(""))

combine.data$school.years[which(combine.data$school.level.completed == 31)] <- 1
combine.data$school.years[which(combine.data$school.level.completed == 32)] <- 2
combine.data$school.years[which(combine.data$school.level.completed == 33)] <- 5.5
combine.data$school.years[which(combine.data$school.level.completed == 34)] <- 7.5
combine.data$school.years[which(combine.data$school.level.completed == 35)] <- 9
combine.data$school.years[which(combine.data$school.level.completed == 36)] <- 10
combine.data$school.years[which(combine.data$school.level.completed == 37)] <- 11
combine.data$school.years[which(combine.data$school.level.completed == 38)] <- 12
combine.data$school.years[which(combine.data$school.level.completed == 39)] <- 12
combine.data$school.years[which(combine.data$school.level.completed == 40)] <- 14
combine.data$school.years[which(combine.data$school.level.completed == 41)] <- 14
combine.data$school.years[which(combine.data$school.level.completed == 42)] <- 14
combine.data$school.years[which(combine.data$school.level.completed == 43)] <- 16
combine.data$school.years[which(combine.data$school.level.completed == 44)] <- 18
combine.data$school.years[which(combine.data$school.level.completed == 45)] <- 20
combine.data$school.years[which(combine.data$school.level.completed == 46)] <- 21

combine.data$school.years[which(combine.data$school.level.completed == "")] <- NA

head(combine.data[,c("school.years","school.level.completed")], n = 10)




combine.data$experience.years <- as.numeric(c(""))
combine.data$experience.years <- combine.data$age - combine.data$school.years - 6
combine.data$experience.years[which(combine.data$experience.years < 0)] <- 0



head(combine.data[,c("school.years","age", "experience.years")], n = 10)


combine.data$experience.years_sq <- combine.data$experience.years*combine.data$experience.years
combine.data$age_sq <- combine.data$age*combine.data$age

combine.data$ln_wage <- log(combine.data$weekly.earnings/100)
combine.data$ln_wage[which(combine.data$ln_wage== "-Inf")] <- 0
combine.data$ln_wage[which(combine.data$edited.occupations== "Not employed")] <- 0




# check the data

table(combine.data$school.years)

table(combine.data$age)
table(combine.data$experience.years)  # make sure it has no zero





# all unemployed are NA
#head( combine.data.complete$weekly.earnings[which(combine.data.complete$employment.status==5)], n = 10)

#head(combine.data.complete$weekly.earnings[which(combine.data.complete$edited.occupations== "Not employed")])

#head(combine.data.complete$ln_wage[which(combine.data.complete$edited.occupations== "Not employed")])







combine.data$treatment <- as.numeric(c(""))
combine.data$treatment[which(combine.data$class.worker == 6 | combine.data$class.worker == 7)] <- 1
combine.data$treatment[which(combine.data$class.worker == 1 | combine.data$class.worker == 2 |
                               combine.data$class.worker == 3 | combine.data$class.worker == 4 |
                               combine.data$class.worker == 5 | combine.data$class.worker == 8 | 
                               combine.data$employment.status == 3 | combine.data$employment.status == 4 |
                               combine.data$employment.status == 5)] <- 0

# checking: these 2 numbers are the same
#table(combine.data$employment.status)
#table( combine.data$treatment)








# http://www.nber.org/papers/w4259.pdf

# https://tel.archives-ouvertes.fr/tel-00780563v1/document

#full.model <- lm( ln_wage ~ school.years + experience.years + experience.years_sq +   age + age_sq + marital.status.edit + 
#                   + region + fips + edited.occupations + num.children + num.family.member + interview.year , data = combine.data.complete , weights = tufnwgtp )

full.model <- lm( ln_wage ~ school.years + experience.years + experience.years_sq +   age + age_sq + marital.status.edit + 
                    + fips + edited.occupations + num.children + num.family.member + interview.year , data = combine.data , weights = tufnwgtp )


full.model <- lm( ln_wage ~ school.years + experience.years + experience.years_sq +   age + age_sq + marital.status.edit + 
                    + fips + edited.occupations + num.children + num.family.member + interview.year , data = combine.data , weights = tufnwgtp )




combine.data$predicted.wage <- predict(full.model, combine.data, weights = tufnwgtp )











combine.data$total.time.child.prim.sec <- combine.data$sec.child.care.hh + combine.data$total.time.child


combine.data$portion.sec.child.care.hh <- combine.data$sec.child.care.hh/(combine.data$sec.child.care.hh + combine.data$total.time.child)

combine.data$portion.primary.child.care <- combine.data$total.time.child/(combine.data$sec.child.care.hh + combine.data$total.time.child)


yvariables.v3 <-c( "physical.care.hh.children",
                   "grocery.shopping", "food.drink.preparation", "purchasing.food",
                   "play.with.hh.children",
                   "reading.to.hh.children","talk.listening.to.hh.children","homework.hh.children", "supervision.hh.children", "pick.drop.hh.child", "travel.caring.help.hh.child",
                   "total.time.child", "sec.child.care.hh", "total.time.child.prim.sec", "portion.sec.child.care.hh",  "total.travel.work.time",  "total.grooming.time", "TV.movies"  )




combine.data$other.time.use <- 1440 - combine.data$physical.care.hh.children - combine.data$grocery.shopping - combine.data$food.drink.preparation -
                                      combine.data$purchasing.food - combine.data$play.with.hh.children - combine.data$reading.to.hh.children - 
                                      combine.data$talk.listening.to.hh.children - combine.data$homework.hh.children - combine.data$supervision.hh.children -
                                      combine.data$pick.drop.hh.child - combine.data$pick.drop.hh.child - 
                                      combine.data$total.travel.work.time - combine.data$total.grooming.time 
  
  

combine.data$total.job.time2  <- (combine.data$total.job.time)/480

combine.data$total.job.wfh.time2 <-  (combine.data$total.job.wfh.time)/480




# subset data for regression + sum statistics, remember to combine with atussum!!!!

combine.data.complete <-combine.data[which(combine.data$respond.atus==1), ]


#combine.data.complete2 <-combine.data[which(is.na(combine.data$num.children)==FALSE), ] # should have 159937 obs

# just to check this is correct
#table(combine.data.complete$work.hours - combine.data.complete2$work.hours)



###################### family income imputation #########
#head(combine.data.complete[,c("edited.family.income", "family.income")], n = 10) 


combine.data.complete$edited.family.income3 <- combine.data.complete$family.income 


combine.data.complete$edited.family.income3[which(is.na(combine.data.complete$edited.family.income3 ) == TRUE)] <- combine.data.complete$edited.family.income[which(is.na(combine.data.complete$edited.family.income3 ) == TRUE)]

# check
tail(combine.data.complete[,c("edited.family.income", "family.income", "edited.family.income3")], n = 10)   



length(which(is.na(combine.data.complete$edited.family.income3 )==TRUE ))
# 13698: it is fine





















combine.data.regress.female.employ <- combine.data[which(combine.data$sex == "Female"& combine.data$presence.own.child == 1 &
                                                combine.data$diary.day != "Saturday"  & combine.data$diary.day != "Sunday"  & combine.data$holiday.indicator == "Not holiday" ),] 



combine.data.regress.male.employ <- combine.data[which(combine.data$sex == "Male"& combine.data$presence.own.child == 1 &
                                                           combine.data$diary.day != "Saturday"  & combine.data$diary.day != "Sunday"  & combine.data$holiday.indicator == "Not holiday" ),] 








combine.data.complete.regress.female.employ <- combine.data.complete[which(combine.data.complete$sex == "Female"& combine.data.complete$presence.own.child == 1 &
                                                                             combine.data.complete$diary.day != "Saturday"  & combine.data.complete$diary.day != "Sunday"  & combine.data.complete$holiday.indicator == "Not holiday" ),] 



combine.data.complete.regress.male.employ <- combine.data.complete[which(combine.data.complete$sex == "Male"& combine.data.complete$presence.own.child == 1 &
                                                                           combine.data.complete$diary.day != "Saturday"  & combine.data.complete$diary.day != "Sunday"  & combine.data.complete$holiday.indicator == "Not holiday" ),] 









combine.data.regress.v2 <- combine.data[which(combine.data$presence.own.child == 1 & combine.data$wfh != "Unemployed/Not in labor force" &
                                                combine.data$diary.day != "Saturday"  & combine.data$diary.day != "Sunday"  & combine.data$holiday.indicator == "Not holiday" ),] 







combine.data.regress.v2.male <- combine.data.regress.v2[which(combine.data.regress.v2$sex == "Male"),] 
combine.data.regress.v2.female <- combine.data.regress.v2[which(combine.data.regress.v2$sex == "Female"),] 





table(combine.data.regress.v2$holiday.indicator)
table(combine.data.regress.v2$diary.day)
table(combine.data.regress.v2$wfh)
table(combine.data.regress.v2$wfh.v2)

table(combine.data.regress.v2$presence.own.child)


combine.data.regress.v2$holiday.indicator <- factor(combine.data.regress.v2$holiday.indicator)
combine.data.regress.v2$diary.day <- factor(combine.data.regress.v2$diary.day)
combine.data.regress.v2$wfh <- factor(combine.data.regress.v2$wfh)
combine.data.regress.v2$wfh.v2 <- factor(combine.data.regress.v2$wfh.v2)
combine.data.regress.v2$wfh.v3 <- factor(combine.data.regress.v2$wfh.v3)

combine.data.regress.v2$edited.occupations <- factor(combine.data.regress.v2$edited.occupations)


table(duplicated(combine.data.regress.v2$tucaseid) )















# combine.data.short.years <- combine.data[which(combine.data$interview.year == 2003 | combine.data$interview.year == 2004 | combine.data$interview.year == 2005),]


#combine.data.short.years.woman <-combine.data.short.years[which(combine.data.short.years$sex == 2 & combine.data.short.years$presence.own.child == 1),]





yvariables <-c( "total.time.child", 
                "grocery.shopping", "food.drink.preparation", "purchasing.food",
                "play.with.hh.children", "play.sports.with.hh.children",
                "provide.medical.care.hh.children", "obtain.medical.care.hh.children",
                "reading.to.hh.children","talk.listening.to.hh.children", "organization.plan.for.hh.children","homework.hh.children", "home.school.hh.children", "supervision.hh.children")




yvariables.v2 <-c( "total.time.child", "physical.care.hh.children",
                "grocery.shopping", "food.drink.preparation", "purchasing.food",
                "play.with.hh.children",
                "reading.to.hh.children","talk.listening.to.hh.children","homework.hh.children", "supervision.hh.children", "pick.drop.hh.child", "travel.caring.help.hh.child",
                "total.travel.work.time",  "total.grooming.time" )





yvariables.agg <-c("total01", "total02", "total.time.adults", "total04", "total05", "total06", "total07" , "total08", "total09" , "total10", "total11",
                   "total12", "total13", "total14", "total15", "total16", "total18")




## control
#original
#demographic.var <- c("+ age + sex+ factor(race) + marital.status")
#employ.var <- c("+ work.hours + factor(occupations)")
#family.var <- c("+ num.children + num.family.member ")
#time.var <- c("+ factor(interview.year) + factor(holiday.indicator) + factor(diary.day) ")
#location.var <- c("+ factor(region) + factor(fips) ")
#spouse.var <- c("+ factor(spouse.presence.hh) + factor(spouse.employ.status) +  spouse.work.hours + factor(full.part.time.spouse) ")
#family.inc.var <- c("+ factor(family.income)")
#childcare.service.var <- c("+ use.paid.childcare + wait.to.meet.childcare ")




source("E:/github/dissertation/script_ATUS/impute_wage_women.R") 
source("E:/github/dissertation/script_ATUS/impute_wage_men.R") 



combine.data.complete.self.employed.regress.female.employ <- combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$class.worker == 6 | combine.data.complete.regress.female.employ$class.worker == 7),] 



combine.data.complete.self.employed.regress.male.employ <- combine.data.complete.regress.male.employ[which(combine.data.complete.regress.male.employ$class.worker == 6 | combine.data.complete.regress.male.employ$class.worker == 7 ),] 




combine.data.complete.sum.stat <- rbind(combine.data.complete.regress.female.employ, combine.data.complete.regress.male.employ)
combine.data.complete.sum.stat <- combine.data.complete.sum.stat[order(combine.data.complete.sum.stat$tucaseid),]




# drop unemployed

combine.data.complete.regress.female.no.unemploy <- combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$wfh.v3 != 2) ,] 


combine.data.complete.regress.male.no.unemploy <- combine.data.complete.regress.male.employ[which(combine.data.complete.regress.male.employ$wfh.v3 != 2) ,] 


combine.data.complete.sum.stat.no.employ <- rbind(combine.data.complete.regress.female.no.unemploy , combine.data.complete.regress.male.no.unemploy)
combine.data.complete.sum.stat.no.employ <- combine.data.complete.sum.stat[order(combine.data.complete.sum.stat$tucaseid),]





#combine.data.complete.sum.stat <- combine.data.complete[which(combine.data.complete$presence.own.child == 1 &
      #                                                          combine.data.complete$diary.day != "Saturday"  & combine.data.complete$diary.day != "Sunday"  & combine.data.complete$holiday.indicator == "Not holiday" ),] 


#for testing
#table(combine.data.complete.sum.stat$total.time.child-combine.data.complete.sum.stat1$total.time.child)


