


# regression
# factor(edited.occupations.indicator) skilled cuz it is cut out 
# factor(allocation.flag.week.earn)  cut 

demographic.var <- c("+ age + race + sex + marital.status ")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations  + total.other.job.time +  total.main.job.time + work.hours.last.week")
current.sit <- c("+ factor(current.situation) + factor(reason.not.work) + factor(reason.absent.last.week) + factor(enrolled.school) + factor(reason.absent.last.week.atus)") 
family.bus <- c("+ factor(household.own.bus) + factor(unpaid.work.family.bus)")
family.var <- c("+ num.children + num.family.member + age.youngest.child" )
time.var <- c("+ interview.year  + diary.day" )
location.var <- c("+ region + fips")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
family.inc.var <- c("+ edited.family.income2 + factor(edited.family.income2.indicator) + edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) " )
childcare.service.var <- c("+ use.paid.childcare + wait.to.meet.childcare + childcare.other + travel.use.childcare + phone.call.care.provider")
children.sick.var <- c("+ provide.medical.care.hh.children + obtain.medical.care.hh.children + wait.child.health + child.health.other")




summary(lm( total.time.child ~ wfh , data = combine.data.regress.v2, weights = tufnwgtp ))


full.model <- lm(paste0(yvariables.v2[1]," ~ wfh.v3", demographic.var,employ.var, current.sit,family.bus, family.var, time.var, 
                        location.var, spouse.var, family.inc.var,  childcare.service.var, children.sick.var  ), 
                 data = combine.data.regress.v2, weights = tufnwgtp )



# age, race, marital staus
# total.main.job.time is crazy: 
#summary(lm( total.time.child ~ wfh  , data = combine.data.regress.v2, weights = tufnwgtp ))
#summary(lm( total.time.child ~ wfh+total.main.job.time  , data = combine.data.regress.v2, weights = tufnwgtp ))


#weekly.earnings is crazy , but edited.weekly earning bias the result





############################
# Regression for wfh 
result <- list()
robust.result <- list()

for (i in 1:length(yvariables.v2) ) {
  dep.var <- yvariables.v2[i]
  full.model <- lm(paste0(yvariables.v2[i]," ~ wfh.v3", demographic.var,employ.var, current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var,children.sick.var  ), data = combine.data.regress.v2, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}



stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(yvariables.v2[1],yvariables.v2[2], yvariables.v2[3], yvariables.v2[4], yvariables.v2[5], yvariables.v2[6], yvariables.v2[7]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), out = "D:/ATUS_result_R/result_wfh.txt",
          notes = "Sampling weights are applied and robust standard errors are used. Base category is work at office of other locations. Number of observations is 22158.", notes.align = "l", omit.table.layout = "s" )


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables.v2[8], yvariables.v2[9], yvariables.v2[10], yvariables.v2[11], yvariables.v2[12], yvariables.v2[13], yvariables.v2[14]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), out = "D:/ATUS_result_R/result_wfh2.txt",
          notes = "Sampling weights are applied and robust standard errors are used. Base category is work at office of other locations. Number of observations is 22158.", notes.align = "l", omit.table.layout = "s" )










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
  full.model <- lm(paste0(yvariables.v2[i]," ~ wfh.v3", demographic.no.sex.var ,employ.var, current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var, children.sick.var  ), data = combine.data.regress.v2.male , weights = tufnwgtp )
  result[[i]] <- full.model 
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
} 



stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(yvariables.v2[1],yvariables.v2[2], yvariables.v2[3], yvariables.v2[4], yvariables.v2[5], yvariables.v2[6], yvariables.v2[7]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), out = "D:/ATUS_result_R/result_wfh.txt",
          notes = "Sampling weights are applied and robust standard errors are used. Base category is work at office of other locations. Number of observations is 10546.", notes.align = "l", omit.table.layout = "s" )


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables.v2[8], yvariables.v2[9], yvariables.v2[10], yvariables.v2[11], yvariables.v2[12], yvariables.v2[13], yvariables.v2[14]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), out = "D:/ATUS_result_R/result_wfh2.txt",
          notes = "Sampling weights are applied and robust standard errors are used. Base category is work at office of other locations. Number of observations is 10546.", notes.align = "l", omit.table.layout = "s" )



############################
# Regression for wfh and female

result <- list()
robust.result <- list()


for (i in 1:length(yvariables.v2) ) { 
  dep.var <- yvariables.v2[i]
  full.model <- lm(paste0(yvariables.v2[i]," ~ wfh.v3", demographic.no.sex.var ,employ.var, current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var, children.sick.var ), data = combine.data.regress.v2.female , weights = tufnwgtp )
  result[[i]] <- full.model 
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
} 



stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],  
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(yvariables.v2[1],yvariables.v2[2], yvariables.v2[3], yvariables.v2[4], yvariables.v2[5], yvariables.v2[6], yvariables.v2[7]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), out = "D:/ATUS_result_R/result_wfh.txt",  
          notes = "Sampling weights are applied and robust standard errors are used. Base category is work at office of other locations. Number of observations is 11612.", notes.align = "l", omit.table.layout = "s" )   


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]), 
          column.labels=c(yvariables.v2[8], yvariables.v2[9], yvariables.v2[10], yvariables.v2[11], yvariables.v2[12], yvariables.v2[13], yvariables.v2[14]), 
          keep= c("wfh.v3" ), covariate.labels =c("Work from home"), out = "D:/ATUS_result_R/result_wfh2.txt",
          notes = "Sampling weights are applied and robust standard errors are used. Base category is work at office of other locations. Number of observations is 11612.", notes.align = "l", omit.table.layout = "s" )
 



