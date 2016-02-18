
result <- list()
robust.result <- list()

for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ wfh_mom*edited.spouse.work.hours", demographic.var,"+ edited.occupations + factor(edited.occupations.indicator)",family.var, time.var, location.var, spouse.var, family.inc.var ), data = combine.data.regress, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}


stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          keep= c("edited.employ.status", "edited.spouse.work.hours" ),   type="text",
          notes = "Sampling weights are applied and robust standard errors are used",  notes.align = "l")


















# include men and include ppl with children over 18 and with children not at home and woman/men who does not have children



combine.data.child <- combine.data[which(combine.data$presence.own.child == 1),]





result <- list()
robust.result <- list()

for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ wfh.v2 + factor(presence.own.child) + sex ", demographic.var,employ.var,family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var ), data = combine.data, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}




stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                 robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          keep= c("wfh.v2", "edited.spouse.work.hours" ),   type="text",
          notes = "Sampling weights are applied and robust standard errors are used",  notes.align = "l")












### this is what i want

result <- list()
robust.result <- list()

for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ wfh_mom.v2*edit.spouse.presence + factor(presence.own.child) + sex", demographic.var,employ.var,family.var, time.var, location.var, "+ edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   ",  family.inc.var,  childcare.service.var ), data = combine.data, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}



stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for interaction", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                 robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          keep= c("wfh_mom.v2", "edit.spouse.presence" ),   type="text",
          notes = "Sampling weights are applied and robust standard errors are used",  notes.align = "l", out = "D:/ATUS_result_R/result_interaction_2.txt")






result <- list()
robust.result <- list()

for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ edited.employ.status + factor(presence.own.child) + sex ", demographic.var,employ.var,family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var ), data = combine.data, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}




stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                 robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          keep= c("edited.employ.status", "edited.spouse.work.hours" ),   type="text",
          notes = "Sampling weights are applied and robust standard errors are used",  notes.align = "l")









### wtf??!!

result <- list()
robust.result <- list()

for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ edited.employ.status*edited.spouse.work.hours + factor(presence.own.child) + sex ", demographic.var,employ.var,family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var ), data = combine.data, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}




stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                 robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          keep= c("edited.employ.status", "edited.spouse.work.hours" ),   type="text",
          notes = "Sampling weights are applied and robust standard errors are used",  notes.align = "l")







result <- list()
robust.result <- list()

for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ edited.employ.status*edit.spouse.presence + factor(presence.own.child) + sex ", demographic.var,employ.var,family.var, time.var, location.var, "+ spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ", family.inc.var,  childcare.service.var ), data = combine.data, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}




stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                 robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          keep= c("edited.employ.status", "edited.spouse.work.hours" ),   type="text",
          notes = "Sampling weights are applied and robust standard errors are used",  notes.align = "l")


