#install.packages("stargazer")
#install.packages("plyr")
#install.packages("lmtest")
#install.packages("sandwich")
#install.packages("pastecs")
#install.packages("xtable")

library(xtable)
library(pastecs)
library(stargazer)
library(plyr)
library(lmtest)
library(sandwich)
library(Hmisc)


rm(list = ls())



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













#######################################################################













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






## fill in NA for family.income

# for finding the mode of family.income
atuscps.income.mode <- atuscps.subset[which(atuscps.subset$tulineno==1),]
sort(table(atuscps.income.mode$family.income )) 
mode <- names(which(table(atuscps.income.mode$family.income ) == max(table(atuscps.income.mode$family.income ))))

mode <- as.integer(mode)
# mode is 14!!!




combine.data$edited.family.income2 <- c("")
combine.data$edited.family.income2 <- combine.data$family.income
combine.data$edited.family.income2[is.na(combine.data$family.income)] <- mode

combine.data$edited.family.income2.indicator <- 0
combine.data$edited.family.income2.indicator[is.na(combine.data$family.income)] <- 1 
table(combine.data$edited.family.income2.indicator)





## fill in NA for occupations

combine.data$edited.occupations <- c("")
combine.data$edited.occupations <- combine.data$occupations
combine.data$edited.occupations[is.na(combine.data$occupations)] <- 23

combine.data$edited.occupations.indicator <- 0
combine.data$edited.occupations.indicator[is.na(combine.data$occupations)] <- 1 
table(combine.data$edited.occupations.indicator)




## fill in NA work.hours
combine.data$edited.work.hours <- c("")
combine.data$edited.work.hours <- combine.data$work.hours
combine.data$edited.work.hours[is.na(combine.data$work.hours)] <- 0


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









combine.data$edited.employ.status <- factor(combine.data$edited.employ.status, levels=c(0,1), labels = c("Not employed", "Employed"))





combine.data$edit.spouse.presence <- factor(combine.data$edit.spouse.presence, levels=c(1,3), labels = c("Spouse present", "Spouse not present"))



combine.data$edited.family.income2 <- ordered(combine.data$edited.family.income2 , levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16), 
                                              labels = c("Less than $5,000", 
                                                         "$5,000 to $7,499",
                                                         "$7,500 to $9,999",
                                                         "$10,000 to $12,499",
                                                         "$12,500 to $14,999",
                                                         "$15,000 to $19,999",
                                                         "$20,000 to $24,999",
                                                         "$25,000 to $29,999",
                                                         "$30,000 to $34,999",
                                                         "$35,000 to $39,999",
                                                         "$40,000 to $49,999",
                                                         "$50,000 to $59,999",
                                                         "$60,000 to $74,999",
                                                         "$75,000 to $99,999",
                                                         "$100,000 to $149,999",
                                                         "$150,000 and over"
                                              ))




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

combine.data$race <- factor(combine.data$race)



combine.data$marital.status <- factor(combine.data$marital.status, levels=c(1,2,3,4,5,6), 
                                      labels = c("Married-spouse present", "Married-spouse absent", "Widowed", "Divorced", "Separated", "Never married"))





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


combine.data$family.income <- ordered(combine.data$family.income, levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16), 
                                      labels = c("Less than $5,000", 
                                                 "$5,000 to $7,499",
                                                 "$7,500 to $9,999",
                                                 "$10,000 to $12,499",
                                                 "$12,500 to $14,999",
                                                 "$15,000 to $19,999",
                                                 "$20,000 to $24,999",
                                                 "$25,000 to $29,999",
                                                 "$30,000 to $34,999",
                                                 "$35,000 to $39,999",
                                                 "$40,000 to $49,999",
                                                 "$50,000 to $59,999",
                                                 "$60,000 to $74,999",
                                                 "$75,000 to $99,999",
                                                 "$100,000 to $149,999",
                                                 "$150,000 and over"
                                      ))






combine.data$wfh <- factor(combine.data$wfh, levels=c(0,1,2), labels = c("Work at office or other locations", "Work from home", "Unemployed/Not in labor force"))
combine.data$wfh.v2 <- factor(combine.data$wfh.v2, levels=c(0,1,2), labels = c("Work at office or other locations", "Work from home", "Unemployed/Not in labor force"))

combine.data$wfh_mom <- factor(combine.data$wfh_mom, levels=c(0,1,2), labels = c("Work at office or other locations", "Work from home", "Unemployed/Not in labor force"))
combine.data$wfh_mom.v2 <- factor(combine.data$wfh_mom.v2, levels=c(0,1,2), labels = c("Work at office or other locations", "Work from home", "Unemployed/Not in labor force"))







































# subset data for regression + sum statistics
combine.data.regress <-combine.data[which(combine.data$sex == "Female" & combine.data$presence.own.child == 1),]




# combine.data.short.years <- combine.data[which(combine.data$interview.year == 2003 | combine.data$interview.year == 2004 | combine.data$interview.year == 2005),]


#combine.data.short.years.woman <-combine.data.short.years[which(combine.data.short.years$sex == 2 & combine.data.short.years$presence.own.child == 1),]





yvariables <-c( "total.time.child", 
                "grocery.shopping", "food.drink.preparation", "purchasing.food",
                "play.with.hh.children", "play.sports.with.hh.children",
                "provide.medical.care.hh.children", "obtain.medical.care.hh.children",
                "reading.to.hh.children","talk.listening.to.hh.children", "organization.plan.for.hh.children","homework.hh.children", "home.school.hh.children", "supervision.hh.children")


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





# race is omitted
demographic.var <- c("+ age + race + marital.status")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations + factor(edited.occupations.indicator)")
family.var <- c("+ num.children + num.family.member ")
time.var <- c("+ interview.year + holiday.indicator + diary.day ")
location.var <- c("+ region + fips ")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
family.inc.var <- c("+ edited.family.income2 + factor(edited.family.income2.indicator)")
childcare.service.var <- c("+ use.paid.childcare + wait.to.meet.childcare ")



























result1 <- lm(total.time.child ~ factor(wfh_mom), data = combine.data, weights = tufnwgtp )
result2 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var), data = combine.data, weights = tufnwgtp )
result3 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var,employ.var ), data = combine.data, weights = tufnwgtp )
result4 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var,employ.var, family.var ), data = combine.data, weights = tufnwgtp )
result5 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var,employ.var, family.var, time.var ), data = combine.data, weights = tufnwgtp )
result6 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var,employ.var, family.var, time.var, location.var ), data = combine.data, weights = tufnwgtp )
result7 <- lm(paste0("total.time.child ~ factor(wfh_mom)",demographic.var,employ.var, family.var, time.var, location.var, family.inc.var ), data = combine.data, weights = tufnwgtp )




demographic.var <- c("+ age + race + marital.status")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations + factor(edited.occupations.indicator)")
family.var <- c("+ num.children + num.family.member ")
time.var <- c("+ interview.year + holiday.indicator + diary.day ")
location.var <- c("+ region + fips ")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
family.inc.var <- c("+ edited.family.income2 + factor(edited.family.income2.indicator)")
childcare.service.var <- c("+ use.paid.childcare + wait.to.meet.childcare ")







































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




















### trial


# use this to do sum stat!!!
sum.stat.data <- combine.data[!is.na(combine.data$wfh_mom),] 


sum.stat <- summary(sum.stat.data$spouse.presence.hh)
sum.stat <- stat.desc(combine.data$spouse.presence.hh, basic=F)






stargazer(sum.stat, type = "text", title="Descriptive statistics", digits=1, out="trial.txt")






ddply(dfx, .(id),summarize, mean = count(sex))

stargazer(t1, t2, type="text")



t <- ddply(sum.stat.data, .(marital.status),summarize, sum = table(marital.status))
ddply(sum.stat.data, .(marital.status), sum = count(marital.status))

t1 <- count(sum.stat.data,"marital.status")
t1$percentage <- t1$freq/sum(t1$freq)

t2 <- count(sum.stat.data,"wfh")




stargazer(t1,t2, type="text")

install.packages("tables")
library(tables)
library(Hmisc)

# The table
tabular(  (Work=wfh) ~  (Percent("row"))    ,data=sum.stat.data       )


t1 <- count(sum.stat.data,"marital.status")
t1$percentage <- t1$freq/sum(t1$freq)
xtable(t1, caption = "a")

