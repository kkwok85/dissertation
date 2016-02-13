install.packages('devtools')
devtools::install_github('msaidf/robusta')


xvariables.v2 <- c("wfh", "wfh.v2")

xvariables <- c("wfh_mom", "wfh_mom.v2")
interaction <- c("edit.spouse.presence")









result <- list()
robust.result <- list()





for (i in 1:length(yvariables) ) {
  dep.var <- yvariables[i]
  full.model <- lm(paste0(yvariables[i],"~", "wfh_mom.v2*edit.spouse.presence" , demographic.var,employ.var,family.var, time.var, location.var, "+ edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   ", family.inc.var,  childcare.service.var ), data = combine.data.regress, weights = tufnwgtp )
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 


}

  stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
            title = "OLS results for interaction of working from home and spouse presence", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
            column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7]), 
            keep= c("wfh_mom.v2", "edit.spouse.presence" ),covariate.labels = c("Work from home(dummy version 2)","Unemployed/Not in labor force(dummy)", "Spouse not present(dummy)", "Work from home*Spouse not present", "Unemployed/Not in labor force*Spouse not present" ),  type="latex", out = "D:/ATUS_result_R/result_wfh_mom_interaction_wfh_presence.tex", 
            notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")
  
  
  stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
            title = "OLS results for interaction of working from home and spouse presence", se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
            column.labels=c(yvariables[8], yvariables[9], yvariables[10], yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
            keep= c("wfh_mom.v2", "edit.spouse.presence"),covariate.labels = c("Work from home(dummy version 2)","Unemployed/Not in labor force(dummy)", "Spouse not present(dummy)", "Work from home*Spouse not present", "Unemployed/Not in labor force*Spouse not present" ),  type="latex", out = "D:/ATUS_result_R/result_wfh_mom_interaction_wfh_presence2.tex",
            notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")
  



  
  
  
  
  
  
  
  
  
  #try 4 things wfh.v2, wfh, wfh_mom wfh_mom.v2 interaction
  #try wfh too
  
  # trial: be careful. different variables and diff dataset!!! wfh looks way better than wfh.v2!!!!!
  
  for (i in 1:length(yvariables) ) {
    dep.var <- yvariables[i]
    full.model <- lm(paste0(yvariables[i],"~", "wfh*num.children" , demographic.var,employ.var,family.var, time.var, location.var, "+ edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   ", family.inc.var,  childcare.service.var ), data = combine.data, weights = tufnwgtp )
    result[[i]] <- full.model
    robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
    
    
  }
  
  stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
            title = "OLS results for interaction of working from home and spouse presence", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
            column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7]), 
            keep= c("wfh.v2", "num.children" ), type="latex", out = "D:/ATUS_result_R/result_num.children.txt", 
            notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")
  
  
  stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
            title = "OLS results for interaction of working from home and spouse presence", se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
            column.labels=c(yvariables[8], yvariables[9], yvariables[10], yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
            keep= c("wfh.v2", "num.children"),type="latex",out = "D:/ATUS_result_R/result_num.children2.txt",
            notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")
  
  
  
  
  
  
  
  
  for (i in 1:length(yvariables) ) {
    dep.var <- yvariables[i]
    full.model <- lm(paste0(yvariables[i],"~", "wfh*num.family.member" , demographic.var,employ.var,family.var, time.var, location.var, "+ edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   ", family.inc.var,  childcare.service.var ), data = combine.data, weights = tufnwgtp )
    result[[i]] <- full.model
    robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
    
    
  }
  
  stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],
            title = "OLS results for interaction of working from home and spouse presence", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
            column.labels=c(yvariables[1],yvariables[2], yvariables[3], yvariables[4], yvariables[5], yvariables[6], yvariables[7]), 
            keep= c("wfh.v2", "num.family.members"),type="latex",out = "D:/ATUS_result_R/result_num.fam.txt",
            notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")
  
  
  stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
            title = "OLS results for interaction of working from home and spouse presence", se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
            column.labels=c(yvariables[8], yvariables[9], yvariables[10], yvariables[11], yvariables[12], yvariables[13], yvariables[14]), 
            keep= c("wfh.v2", "num.family.members"),type="latex",out = "D:/ATUS_result_R/result_num.fam2.txt",
            notes = "Sampling weights are applied and robust standard errors are used", notes.align = "l")
  
  
  
  
