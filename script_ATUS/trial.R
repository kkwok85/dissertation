trial

result <- list()
robust.result <- list()




# result no good, only simple OLS result decent, result interact with num.children bad, spouse presence very bad , spouse.employ.status is ok, full.part.time.spousePart time ok


for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i]," ~ wfh.v2", demographic.var,employ.var,family.var, time.var, location.var,  family.inc.var,  childcare.service.var ), data = combine.data.regress.child.in.hh, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}








stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          title = "OLS results for working from home", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]], robust.result[[8]],
                                                                robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7], yvariables[8], yvariables[9], yvariables[10],
                          yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
          keep= c("wfh.v2" ), type="latex",out = "D:/ATUS_result_R/new_data.txt",
          notes = "Sampling weights are applied and robust standard errors are used",  notes.align = "l")




# very significant
summary(lm(paste0("spouse.work.hours"," ~ wfh.v2", demographic.var,employ.var,family.var, time.var, location.var, family.inc.var,  childcare.service.var ), data = combine.data.regress.child.in.hh, weights = tufnwgtp ))
summary(lm(paste0("spouse.employ.status.num"," ~ wfh.v2", demographic.var,employ.var,family.var, time.var, location.var, family.inc.var,  childcare.service.var ), data = combine.data.regress.spouse.presence, weights = tufnwgtp ))



# all signficant! wfh.v2 is good even no interaction!

summary(lm(paste0("edited.work.hours"," ~ wfh.v2*num.children", demographic.var,employ.var,family.var, time.var, location.var, family.inc.var,  childcare.service.var ), data = combine.data, weights = tufnwgtp ))


summary(lm(paste0("spouse.work.hours"," ~ wfh.v2*num.children", demographic.var,employ.var,family.var, time.var, location.var, family.inc.var,  childcare.service.var ), data = combine.data, weights = tufnwgtp ))

summary(lm(paste0("edited.work.hours"," ~ wfh.v2*num.family.member", demographic.var,employ.var,family.var, time.var, location.var, family.inc.var,  childcare.service.var ), data = combine.data, weights = tufnwgtp ))



# very interesting, put total time child change the coefficient a lot!!!

full.model <- lm(paste0("total.main.job.time"," ~ wfh.v2+hourly.status ",demographic.var,family.var, location.var, spouse.var, family.inc.var,  childcare.service.var ), data = combine.combine.reg.atussum, weights = tufnwgtp )


full.model <- lm(paste0("total.main.job.time"," ~ wfh.v2 + hourly.status + total.time.child",demographic.var,family.var, location.var, spouse.var, family.inc.var,  childcare.service.var ), data = combine.combine.reg.atussum, weights = tufnwgtp )

# no effect

full.model <- lm(paste0("total.main.job.time"," ~ wfh.v2*hourly.status + total.time.child",demographic.var,family.var, location.var, spouse.var, family.inc.var,  childcare.service.var ), data = combine.combine.reg.atussum, weights = tufnwgtp )



*  hourly status affect a lot, especially work hours

full.model <- lm(paste0("edited.work.hours"," ~ wfh.v2*hourly.status" ), data = combine.data.regress.v2, weights = tufnwgtp )
