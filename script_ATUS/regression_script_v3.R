
names.y <- c("Total time for childcare", "Physical care", 
             "Grocery shopping", "Cooking", "Purchasing prepared food",
             "Playing with children", 
             "Reading to children", "Talking and listening to children", "Helping homework", "Supervising children", "Picking or droping off children", "Travel time for helping children",
             "Travel time for work", "Total grooming time" )


# regression
# factor(edited.occupations.indicator) skilled cuz it is cut out  ,+ factor(reason.not.work)  + factor(reason.absent.last.week) + factor(reason.absent.last.week.atus)
# factor(allocation.flag.week.earn)  cut 

demographic.var <- c("+ age + race + sex + marital.status ")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations  + total.other.job.time +  total.main.job.time + work.hours.last.week +factor(employment.status)")
current.sit <- c("+ factor(current.situation)   + factor(enrolled.school) ") 
family.bus <- c("+ factor(household.own.bus) + factor(unpaid.work.family.bus)")
family.var <- c("+ num.children + num.family.member + age.youngest.child" )
time.var <- c("+ interview.year  + diary.day" )
location.var <- c("+ region + fips")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
family.inc.var <- c("+ edited.family.income2 + factor(edited.family.income2.indicator) + edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) " )
childcare.service.var <- c("+ use.paid.childcare + wait.to.meet.childcare + childcare.other + travel.use.childcare + phone.call.care.provider")
children.sick.var <- c("+ provide.medical.care.hh.children + obtain.medical.care.hh.children + wait.child.health + child.health.other")




#summary(lm( total.time.child ~ wfh , data = combine.data.regress.v2, weights = tufnwgtp ))


#full.model <- lm(paste0(names.y[1] ," ~ wfh.v3", demographic.var,employ.var, current.sit,family.bus, family.var, time.var, 
 #                       location.var, spouse.var, family.inc.var,  childcare.service.var, children.sick.var  ), 
 #                data = combine.data.regress.v2, weights = tufnwgtp )



# age, race, marital staus
# total.main.job.time is crazy: 
#summary(lm( total.time.child ~ wfh  , data = combine.data.regress.v2, weights = tufnwgtp ))
#summary(lm( total.time.child ~ wfh+total.main.job.time  , data = combine.data.regress.v2, weights = tufnwgtp ))


#weekly.earnings is crazy , but edited.weekly earning bias the result




# hand change for all output:
# column number change from (1) (2) ...to (8) (9)...
# cross out yvariables.v2[i]
# set box
# cross out caption in the second table
# cross out notes in the first table
# change work hours table box comment line. It is too long


############################
# Regression for wfh 
result <- list()
robust.result <- list()

for (i in 1:length(yvariables.v2) ) {
  dep.var <- yvariables.v2[i]
  full.model <- lm(paste0(yvariables.v2[i]," ~ factor(wfh.v3)", demographic.var,employ.var, current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var,children.sick.var  ), data = combine.data.regress.v2, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}



stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(names.y[1] ,names.y[2], names.y[3], names.y[4], names.y[5], names.y[6], names.y[7]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), type = "latex", out = "D:/ATUS_result_R/result_wfh.tex",
           notes.align = "l", omit.table.layout = "s" )


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
           se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(names.y[8], names.y[9], names.y[10], names.y[11], names.y[12], names.y[13], names.y[14]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), type = "latex", out = "D:/ATUS_result_R/result_wfh2.tex",
          notes = "Sampling weights are applied and robust standard errors are used. Base category is work at office or other locations. Number of observations is 22158.", notes.align = "l", omit.table.layout = "s" )








############################
# Regression for wfh and male
combine.data.regress.v2.male$sex <- factor(combine.data.regress.v2.male$sex)


combine.data.regress.v2.female$sex <- factor(combine.data.regress.v2.female$sex)


result <- list()
robust.result <- list()



# becareful of this one!!!! sex is taken away!!!
demographic.no.sex.var <- c("+ age + race  + marital.status") 



for (i in 1:length(yvariables.v2) ) { 
  dep.var <- yvariables.v2[i]
  full.model <- lm(paste0(yvariables.v2[i]," ~ factor(wfh.v3)", demographic.no.sex.var ,employ.var, current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var, children.sick.var  ), data = combine.data.regress.v2.male , weights = tufnwgtp )
  result[[i]] <- full.model 
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
} 



stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
          title = "OLS results for working from home: Father", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(names.y[1] ,names.y[2], names.y[3], names.y[4], names.y[5], names.y[6], names.y[7]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), type = "latex", out = "D:/ATUS_result_R/result_wfh_male.tex",
           notes.align = "l", omit.table.layout = "s" )


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
           se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(names.y[8], names.y[9], names.y[10], names.y[11], names.y[12], names.y[13], names.y[14]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), type = "latex", out = "D:/ATUS_result_R/result_wfh2_male.tex",
          notes = "Sampling weights are applied and robust standard errors are used. Base category is work at office or other locations. Number of observations is 10546.", notes.align = "l", omit.table.layout = "s" )



############################
# Regression for wfh and female

result <- list()
robust.result <- list()


for (i in 1:length(yvariables.v2) ) { 
  dep.var <- yvariables.v2[i]
  full.model <- lm(paste0(yvariables.v2[i]," ~ factor(wfh.v3)", demographic.no.sex.var ,employ.var, current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var, children.sick.var ), data = combine.data.regress.v2.female , weights = tufnwgtp )
  result[[i]] <- full.model 
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
} 



stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],  
          title = "OLS results for working from home: Mother", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(names.y[1] ,names.y[2], names.y[3], names.y[4], names.y[5], names.y[6], names.y[7]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), type = "latex", out = "D:/ATUS_result_R/result_wfh_female.tex",  
           notes.align = "l", omit.table.layout = "s" )   


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
           se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]), 
          column.labels=c(names.y[8], names.y[9], names.y[10], names.y[11], names.y[12], names.y[13], names.y[14]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), type = "latex", out = "D:/ATUS_result_R/result_wfh2_female.tex", 
          notes = "Sampling weights are applied and robust standard errors are used. Base category is work at office or other locations. Number of observations is 11612.", notes.align = "l", omit.table.layout = "s" )
 











############################
# Regression for work hours and female

# employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations  + total.other.job.time +  total.main.job.time + work.hours.last.week +factor(employment.status)")


#remember to factor wfh!!!!!

employ.no.wh.var <- c("     ")

combine.data.regress.female.employ$total.job.time.2 <- (combine.data.regress.female.employ$total.job.time)/480



result <- list()
robust.result <- list()


for (i in 1:length(yvariables.v2) ) { 
  dep.var <- yvariables.v2[i]
  full.model <- lm(paste0(yvariables.v2[i]," ~ total.job.time.2 + edited.employ.status + factor(wfh.v3) + edited.occupations + work.hours.last.week ", demographic.no.sex.var , current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var, children.sick.var ), data = combine.data.regress.female.employ , weights = tufnwgtp )
  result[[i]] <- full.model 
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
} 


stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
          title = "OLS results for maternal employment", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(names.y[1] ,names.y[2], names.y[3], names.y[4], names.y[5], names.y[6], names.y[7]), 
          keep= c("total.job.time.2", "edited.employ.status" ), covariate.labels =c("Work hours (divided by 8)",  "Employed"), out = "D:/ATUS_result_R/result_wh.tex",
          notes.align = "l", omit.table.layout = "s")


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(names.y[8], names.y[9], names.y[10], names.y[11], names.y[12], names.y[13], names.y[14]), 
          keep= c("total.job.time.2", "edited.employ.status" ), covariate.labels =c("Work hours (divided by 8)",  "Employed"),  type = "latex", out = "D:/ATUS_result_R/result_wh_2.tex",
          notes = "Sampling weights are applied and robust standard errors are used. Work hours is a continuous variable from the work hours on diary day divided by 8 hours. Employed is a dichotomous variable indicating employment status. Base category is unemployed/out of labor force. Number of observations is 16914.", notes.align = "l", omit.table.layout = "s")








# edited.work.hours + factor(edited.work.hours.indicator)

combine.data.regress.female.employ$work.hours.2<- (combine.data.regress.female.employ$work.hours)/40


result <- list()
robust.result <- list()


for (i in 1:length(yvariables.v2) ) { 
  dep.var <- yvariables.v2[i]
  full.model <- lm(paste0(yvariables.v2[i]," ~ work.hours.2 + edited.employ.status + factor(wfh.v3) + edited.occupations + work.hours.last.week ", demographic.no.sex.var , current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var, children.sick.var ), data = combine.data.regress.female.employ, weights = tufnwgtp )
  result[[i]] <- full.model 
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
} 


stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
          title = "OLS results for maternal employment", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(names.y[1] ,names.y[2], names.y[3], names.y[4], names.y[5], names.y[6], names.y[7]), 
          keep= c("work.hours.2", "edited.employ.status" ), covariate.labels =c("Work hours (divided by 40)", "Employed"), out = "D:/ATUS_result_R/result_wh_v2.tex",
          notes.align = "l", omit.table.layout = "s" )


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(names.y[8], names.y[9], names.y[10], names.y[11], names.y[12], names.y[13], names.y[14]), 
          keep= c("work.hours.2", "edited.employ.status" ), covariate.labels =c("Work hours (divided by 40)", "Employed"),  type = "latex", out = "D:/ATUS_result_R/result_wh_v2_2.tex",
          notes = "Sampling weights are applied and robust standard errors are used. Work hours is a continuous variable from weekly work hours divided by 40 hours. Employed is a dichotomous variable indicating employment status. Base category is unemployed/out of labor force. Number of observations is 16385.", notes.align = "l", omit.table.layout = "s" )













# average effect of employment

combine.data.regress.v2




result <- list()
robust.result <- list()


for (i in 1:length(yvariables.v2) ) { 
  dep.var <- yvariables.v2[i]
  full.model <- lm(paste0(yvariables.v2[i]," ~ total.job.time.2 + edited.employ.status + factor(wfh.v3) + edited.occupations + work.hours.last.week ", demographic.no.sex.var , current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var, children.sick.var ), data = combine.data.regress.female.employ, weights = tufnwgtp )
  result[[i]] <- full.model 
  <-predict(full.model)
  
} 


full.model <- lm(paste0(yvariables.v2[2]," ~ total.job.time.2 + edited.employ.status + factor(wfh.v3) + edited.occupations + work.hours.last.week ", demographic.no.sex.var , current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var, children.sick.var ), data = combine.data.regress.female.employ, weights = tufnwgtp , na.action=na.exclude)
combine.data.regress.female.employ$predict <- predict(full.model, na.action=na.exclude)

mean(combine.data.regress.female.employ$predict[which(combine.data.regress.female.employ$edited.employ.status=="Employed")], na.rm=TRUE)

# in case he wants just 2 variables 
#summary(full.model)$coefficients[2,1]
#summary(full.model)$coefficients[3,1]

combine.data.regress.female.employ$predict2 <- combine.data.regress.female.employ$edited.employ.status*summary(full.model)$coefficients[3,1]

