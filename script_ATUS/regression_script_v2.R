combine.data.regress.v2 <- combine.data[which(combine.data$presence.own.child == 1),]





# regression


demographic.var <- c("+ age + race + sex + marital.status")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations + factor(edited.occupations.indicator)")
family.var <- c("+ num.children + num.family.member ")
time.var <- c("+ interview.year + holiday.indicator + diary.day ")
location.var <- c("+ region + fips ")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
family.inc.var <- c("+ edited.family.income2 + factor(edited.family.income2.indicator)")
childcare.service.var <- c("+ use.paid.childcare + wait.to.meet.childcare ")



############################
# Regression for wfh definition



result <- list()
robust.result <- list()

for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ wfh", demographic.var,employ.var,family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var ), data = combine.data.regress.v2, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}








stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
           covariate.labels =c("Work from home(dummy version1)","Unemployed/Not in labor force(dummy)"), out = "C:/Users/jkwok/Desktop/Feb_18_meeting_with_chuck/result_atus/wfh_def.txt",
          notes = "Sampling weights are applied and robust standard errors are used",  notes.align = "l")








stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
          title = "OLS results for working from home (version 1)", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7]), 
          keep= c("wfh" ), covariate.labels =c("Work from home(dummy version 1)","Unemployed/Not in labor force(dummy)"),  type="latex", out = "D:/ATUS_result_R/result_wfh_mom1.tex",
          notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home (version 1)", se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[8], yvariables[9], yvariables[10], yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          keep= c("wfh" ), covariate.labels =c("Work from home(dummy version 1)","Unemployed/Not in labor force(dummy)"),  type="latex", out = "D:/ATUS_result_R/result_wfh_mom2.tex",
          notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")















result <- list()
robust.result <- list()

for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ wfh.v2", demographic.var,employ.var,family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var ), data = combine.data.regress.v2, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}






stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                 robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
           covariate.labels =c("Work from home(dummy version2)","Unemployed/Not in labor force(dummy)"), out = "C:/Users/jkwok/Desktop/Feb_18_meeting_with_chuck/result_atus/wfh_defv2.txt",
          notes = "Sampling weights are applied and robust standard errors are used",  notes.align = "l")








stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
          title = "OLS results for working from home (version 2)", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7]), 
          keep= c("wfh.v2" ), covariate.labels =c("Work from home(dummy version 2)","Unemployed/Not in labor force(dummy)") , type="latex", out = "D:/ATUS_result_R/result_wfh_mom.v2_1.tex",
          notes = "Sampling weights are applied and robust standard errors are used" , notes.align = "l")





stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home (version 2)", se = list(robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          keep= c("wfh.v2" ), covariate.labels =c("Work from home(dummy version 2)","Unemployed/Not in labor force(dummy)") , type="latex", out = "D:/ATUS_result_R/result_wfh_mom.v2_2.tex",
          notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")






























result <- list()
robust.result <- list()

for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ wfh.v2*sex", demographic.var,employ.var,family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var ), data = combine.data.regress.v2, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}






stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                 robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
           out = "C:/Users/jkwok/Desktop/Feb_18_meeting_with_chuck/result_atus/wfh_gender.txt",
          notes = "Sampling weights are applied and robust standard errors are used",  notes.align = "l")





































############################
# Regression for wfh/work status with spouse work status



# controls are changed. 


#+ spouse.employ.status +  edited.spouse.work.hours + full.part.time.spouse + factor(edited.spouse.work.hours.indicator) 








result <- list()
robust.result <- list()

for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ wfh.v2*spouse.employ.status", demographic.var,employ.var,family.var, time.var, location.var, "+ edit.spouse.presence  ",  family.inc.var,  childcare.service.var ), data = combine.data.regress.v2, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}



stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for interaction of working from home and spouse employ status", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                                                    robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          out = "C:/Users/jkwok/Desktop/Feb_18_meeting_with_chuck/result_atus/wfh_spouse.employ.status.txt")





stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
          title = "OLS results for interaction of working from home and spouse working hours", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7]), 
          keep= c("wfh.v2", "edited.spouse.work.hours" ), covariate.labels =c("Work from home(dummy)","Unemployed/Not in labor force(dummy)", "Spouse work hours", "Indicator of spouse hours imputed","Work from home*Spouse work hours",  "Unemployed/Not in labor force*Spouse work hours") , type="latex", out = "D:/ATUS_result_R/result_interaction_wfh_spouse.wh1.tex",
          notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")



stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for interaction of working from home and spouse working hours", se = list(robust.result[[8]],robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[8], yvariables[9], yvariables[10],yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          keep= c("wfh.v2", "edited.spouse.work.hours" ), covariate.labels =c("Work from home(dummy)","Unemployed/Not in labor force(dummy)", "Spouse work hours", "Indicator of spouse hours imputed","Work from home*Spouse work hours",  "Unemployed/Not in labor force*Spouse work hours") , type="latex", out = "D:/ATUS_result_R/result_interaction_wfh_spouse.wh2.tex",
          notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")














result <- list()
robust.result <- list()

for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ wfh.v2*edited.spouse.work.hours", demographic.var,employ.var,family.var, time.var, location.var, " + factor(edited.spouse.work.hours.indicator) + edit.spouse.presence  ",  family.inc.var,  childcare.service.var ), data = combine.data.regress.v2, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}



stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for interaction of working from home and spouse employ status", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                                                         robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          out = "C:/Users/jkwok/Desktop/Feb_18_meeting_with_chuck/result_atus/wfh_spouse.work.hours.txt")













