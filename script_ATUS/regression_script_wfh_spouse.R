

combine.data.regress.spouse.presence <-subset(combine.data.regress,edit.spouse.presence == "Spouse present" )

#spouse.work.hours
#full.part.time.spouse
#spouse.employ.status





combine.data.regress.spouse.presence$spouse.employ.status.num <- 1
combine.data.regress.spouse.presence$spouse.employ.status.num[which(combine.data.regress.spouse.presence$spouse.employ.status == "Not Employed" )]<- 0

combine.data.regress.spouse.presence$full.part.time.spouse.num <- NA
combine.data.regress.spouse.presence$full.part.time.spouse.num[which(combine.data.regress.spouse.presence$full.part.time.spouse == "Part time" )]<- 0 
combine.data.regress.spouse.presence$full.part.time.spouse.num[which(combine.data.regress.spouse.presence$full.part.time.spouse == "Full time" )]<- 1 



glm(paste0(spouse.employ.status," ~ wfh_mom.v2", demographic.var,employ.var,family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var ), family=binomial(link="probit"), data=combine.data.regress.spouse.presence  , weights = tufnwgtp )

glm(spouse.employ.status ~ wfh_mom.v2, data=combine.data.regress.spouse.presence  )



# all spouse var are taken out, data is subset

lm(paste0("spouse.work.hours"," ~ wfh_mom.v2", demographic.var,employ.var,family.var, time.var, location.var, family.inc.var,  childcare.service.var ), data = combine.data.regress.spouse.presence , weights = tufnwgtp )
lm(paste0("spouse.employ.status.num"," ~ wfh_mom.v2", demographic.var,employ.var,family.var, time.var, location.var, family.inc.var,  childcare.service.var ), data = combine.data.regress.spouse.presence , weights = tufnwgtp )
lm(paste0("full.part.time.spouse.num"," ~ wfh_mom.v2", demographic.var,employ.var,family.var, time.var, location.var, family.inc.var,  childcare.service.var ), data = combine.data.regress.spouse.presence , weights = tufnwgtp )


yvariables_spouse.work <- c("spouse.work.hours", "spouse.employ.status.num", "full.part.time.spouse.num" )

for (i in 1:length(yvariables_spouse.work) ) {
  dep.var <- yvariables_spouse.work[i]
  full.model <- lm(paste0(yvariables_spouse.work[i]," ~ wfh_mom.v2", demographic.var,employ.var,family.var, time.var, location.var, family.inc.var,  childcare.service.var ), data = combine.data.regress.spouse.presence , weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
  
  
}

stargazer(result[[1]], result[[2]],result[[3]], 
          title = "OLS results for working from home and spouse work", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]]),
          column.labels=c(yvariables_spouse.work[1],yvariables_spouse.work[2], yvariables_spouse.work[3]), 
          keep= c("wfh_mom.v2"),covariate.labels = c("Work from home(dummy version 2)","Unemployed/Not in labor force(dummy)"),  type="latex", out = "D:/ATUS_result_R/result_wfh_mom_spouse_work.tex", 
          notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")







