# this is the script for flexible work in ATUS



install.packages("readstata13")
library(readstata13)



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



names.y <- c("Total time for child care", "Physical care", 
             "Grocery shopping", "Cooking", "Purchasing prepared food",
             "Playing with children", 
             "Reading to children", "Talking and listening to children", "Helping homework", "Supervising children", "Picking or dropping off children", "Travel time for helping children",
             "Travel time for work", "Total grooming time" )



lv.data <-  read.dta13("D:/lvresp_2011/lvresp_2011.dta", convert.factors = T, generate.factors=T)



lvwgts.data <-  read.dta13("D:/lvwgts_2011/lvwgts_2011.dta", convert.factors = T, generate.factors=T)

combine.data.regress.test <- combine.data[which(combine.data$lufinlwgt != "NA" & combine.data$presence.own.child == 1 & combine.data$wfh != "Unemployed/Not in labor force" &
                                                  combine.data$diary.day != "Saturday"  & combine.data$diary.day != "Sunday" & combine.data$holiday.indicator == "Not holiday"),] 





combine.data.regress.test$luadloc <- as.numeric(combine.data.regress.test$luadloc)
combine.data.regress.test$luadloc[which(combine.data.regress.test$luadloc== 1 )] <- NA
combine.data.regress.test$luadloc[which(combine.data.regress.test$luadloc== 2 )] <- 4
combine.data.regress.test$luadloc[which(combine.data.regress.test$luadloc== 3 )] <- 5



combine.data.regress.test$luaddy <- as.numeric(combine.data.regress.test$luaddy)
combine.data.regress.test$luaddy[which(combine.data.regress.test$luaddy== 1 )] <- NA
combine.data.regress.test$luaddy[which(combine.data.regress.test$luaddy== 2 )] <- 4
combine.data.regress.test$luaddy[which(combine.data.regress.test$luaddy== 3 )] <- 5


combine.data.regress.test$luadhr <- as.numeric(combine.data.regress.test$luadhr)
combine.data.regress.test$luadhr[which(combine.data.regress.test$luadhr== 1 )] <- NA
combine.data.regress.test$luadhr[which(combine.data.regress.test$luadhr== 2 )] <- 4
combine.data.regress.test$luadhr[which(combine.data.regress.test$luadhr== 3 )] <- 5

combine.data.regress.test$legnhth <- as.numeric(combine.data.regress.test$legnhth)



combine.data.regress.test$edited.family.income2 <- as.numeric(combine.data.regress.test$edited.family.income2)
















# luadloc vs child care



result <- list()
robust.result <- list()

for (i in 1:length(yvariables.v2) ) {
  dep.var <- yvariables.v2[i]
  full.model <-  lm(paste0(yvariables.v2[i]," ~ factor(luadloc)", demographic.var,employ.var, 
                           current.sit,family.bus, family.var, "+ diary.day", 
                           location.var, spouse.var, 
                           "+ edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) ",
                           childcare.service.var,children.sick.var  ), data = combine.data.regress.test, weights = lufinlwgt )
  
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
  
  result[[i]] <- full.model
}









stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],  
          title = "OLS results for flexible location vs child care minutes", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(names.y[1] ,names.y[2], names.y[3], names.y[4], names.y[5], names.y[6], names.y[7]), 
          keep= c("luadloc" ), covariate.labels =c("flexible location"), type = "latex", out = "D:/result_test1.tex",  
          notes.align = "l", omit.table.layout = "s" )   


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]), 
          column.labels=c(names.y[8], names.y[9], names.y[10], names.y[11], names.y[12], names.y[13], names.y[14]), 
          keep= c("luadloc" ), covariate.labels =c("flexible location"), type = "latex", out = "D:/result_test2.tex", 
          notes = "Sampling weights are applied and robust standard errors are used. Base category is no flexible location. Number of observations is 1454.", notes.align = "l", omit.table.layout = "s" )



























# luaddy vs child care




result <- list()
robust.result <- list()

for (i in 1:length(yvariables.v2) ) {
  dep.var <- yvariables.v2[i]
  full.model <-  lm(paste0(yvariables.v2[i]," ~ factor(luaddy)", demographic.var,employ.var, 
                           current.sit,family.bus, family.var, "+ diary.day", 
                           location.var, spouse.var, 
                           "+ edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) ",
                           childcare.service.var,children.sick.var  ), data = combine.data.regress.test, weights = lufinlwgt )
  
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
  
  result[[i]] <- full.model
}









stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],  
          title = "OLS results for flexible days vs child care minutes", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(names.y[1] ,names.y[2], names.y[3], names.y[4], names.y[5], names.y[6], names.y[7]), 
          keep= c("luaddy" ), covariate.labels =c("flexible day"), type = "latex", out = "D:/result_test3.tex",  
          notes.align = "l", omit.table.layout = "s" )   


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]), 
          column.labels=c(names.y[8], names.y[9], names.y[10], names.y[11], names.y[12], names.y[13], names.y[14]), 
          keep= c("luaddy" ), covariate.labels =c("flexible day"), type = "latex", out = "D:/result_test4.tex", 
          notes = "Sampling weights are applied and robust standard errors are used. Base category is no flexible days. Number of observations is 1454.", notes.align = "l", omit.table.layout = "s" )





































# luadhr vs child care



result <- list()
robust.result <- list()

for (i in 1:length(yvariables.v2) ) {
  dep.var <- yvariables.v2[i]
  full.model <-  lm(paste0(yvariables.v2[i]," ~ factor(luadhr)", demographic.var,employ.var, 
                           current.sit,family.bus, family.var, "+ diary.day", 
                           location.var, spouse.var, 
                           "+ edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) ",
                           childcare.service.var,children.sick.var  ), data = combine.data.regress.test, weights = lufinlwgt )
  
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
  
  result[[i]] <- full.model
}









stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],  
          title = "OLS results for flexible hours vs child care minutes", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(names.y[1] ,names.y[2], names.y[3], names.y[4], names.y[5], names.y[6], names.y[7]), 
          keep= c("luadhr" ), covariate.labels =c("flexible hour"), type = "latex", out = "D:/result_test5.tex",  
          notes.align = "l", omit.table.layout = "s" )   


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]), 
          column.labels=c(names.y[8], names.y[9], names.y[10], names.y[11], names.y[12], names.y[13], names.y[14]), 
          keep= c("luadhr" ), covariate.labels =c("flexible hour"), type = "latex", out = "D:/result_test6.tex", 
          notes = "Sampling weights are applied and robust standard errors are used. Base category is no flexible hours. Number of observations is 1454.", notes.align = "l", omit.table.layout = "s" )














# any.flexible vs child care



result <- list()
robust.result <- list()

for (i in 1:length(yvariables.v2) ) {
  dep.var <- yvariables.v2[i]
  full.model <-  lm(paste0(yvariables.v2[i]," ~ factor(any.flexible)", demographic.var,employ.var, 
                           current.sit,family.bus, family.var, "+ diary.day", 
                           location.var, spouse.var, 
                           "+ edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) ",
                           childcare.service.var,children.sick.var  ), data = combine.data.regress.test, weights = lufinlwgt )
  
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
  
  result[[i]] <- full.model
}









stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]],  
          title = "OLS results for any flexible work arrangements vs child care minutes", se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]]),
          column.labels=c(names.y[1] ,names.y[2], names.y[3], names.y[4], names.y[5], names.y[6], names.y[7]), 
          keep= c("any.flexible" ), covariate.labels =c("Any flexible"), type = "latex", out = "D:/result_test7.tex",  
          notes.align = "l", omit.table.layout = "s" )   


stargazer(result[[8]], result[[9]], result[[10]], result[[11]], result[[12]], result[[13]], result[[14]],
          se = list( robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]), 
          column.labels=c(names.y[8], names.y[9], names.y[10], names.y[11], names.y[12], names.y[13], names.y[14]), 
          keep= c("any.flexible" ), covariate.labels =c("Any flexible"), type = "latex", out = "D:/result_test8.tex", 
          notes = "Sampling weights are applied and robust standard errors are used. Base category is no flexible work arrangements. Number of observations is 1454.", notes.align = "l", omit.table.layout = "s" )











empty.frame <- data.frame(matrix(ncol = 5, nrow = 2)) 

z <- svydesign(id=~1, weights=~lufinlwgt, data=combine.data.regress.test)


for (i in 1: length(yvariables.v2)) {    
  
  
  
  a <- svyby( ~get(yvariables.v2[i]),~sex, z, svymean)
  b <- svyby( ~get(yvariables.v2[i]),~sex, z, svyvar)
  
  
  
  
  colnames(empty.frame) <-c("Variables" ,"Mean", "SD", "Mean", "SD") 
  
  
  
  
  empty.frame[i,1] <- yvariables.v2[i]
  empty.frame[i,2] <- signif(a[2,2], digits = 3)
  empty.frame[i,3] <- signif(sqrt(b[2,2]), digits = 3)
  empty.frame[i,4] <- signif(a[1,2], digits = 3) 
  empty.frame[i,5] <- signif(sqrt(b[1,2]), digits = 3)
  
  
}   

addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c(" & Women & & Men &  \\\\\n",
                      "Variables & Mean & SD & Mean & SD \\\\\n")
print(xtable(empty.frame, caption = "Summary Statistics for the dependent variables")
      , add.to.row = addtorow, include.rownames = FALSE, include.colnames = FALSE )









empty.frame <- data.frame(matrix(ncol = 5, nrow = 2)) 

z <- svydesign(id=~1, weights=~lufinlwgt, data=combine.data.regress.test)
colnames(empty.frame) <-c("Variables group" ,"Variables","Mean(SD)", "Mean(SD) (Women)", "Mean(SD) (Men)") 

row <- seq(from = 1 , to = 500, by = 2)

for (i in 1:length(yvariables.v2)) {    
  
  
  
  a <- svyby( ~get(yvariables.v2[i]),~sex, z, svymean, na.rm = TRUE)
  b <- svyby( ~get(yvariables.v2[i]),~sex, z, svyvar, na.rm = TRUE)
  
  c <- svymean( ~get(yvariables.v2[i]) , z , na.rm = TRUE)
  d <- sqrt(svyvar( ~get(yvariables.v2[i]) , z , na.rm = TRUE))
  
  
  
  
  
  
  empty.frame[row[i],2] <- names.y[i]
  empty.frame[row[i],3] <- signif(c, digits=3)
  empty.frame[row[i]+1,3] <- paste0( "(",signif(d, digits = 3),")")
  
  empty.frame[row[i],4] <- signif(a[2,2], digits = 3)
  empty.frame[row[i]+1,4] <- paste0( "(",signif(sqrt(b[2,2]), digits = 3),")")
  empty.frame[row[i],5] <- signif(a[1,2], digits = 3) 
  empty.frame[row[i]+1,5] <- paste0( "(",signif(sqrt(b[1,2]), digits = 3),")")
  
  
  
}   



addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c("  & & Mean(SD) & Mean(SD) (Women) & Mean(SD) (Men) \\\\\n",
                      " Variables group & Variables   &  Full & Women & Men \\\\\n")
print(xtable(empty.frame, caption = "Summary Statistics for the dependent variables")
      , add.to.row = addtorow, include.rownames = FALSE, include.colnames = FALSE )















table(combine.data.regress.test$wfh.v3, combine.data.regress.test$luadloc)

table(combine.data.regress.test$wfh.v3, combine.data.regress.test$luadhr)
table(combine.data.regress.test$wfh.v3, combine.data.regress.test$luaddy)




combine.data.regress.test$any.flexible <- "NA"
combine.data.regress.test$any.flexible[which( combine.data.regress.test$luadloc == 5 | combine.data.regress.test$luadhr == 5 |
                                combine.data.regress.test$luaddy == 5 ) ] <- 1


combine.data.regress.test$any.flexible[which( combine.data.regress.test$luadloc == 4 & combine.data.regress.test$luadhr == 4 &
                                                combine.data.regress.test$luaddy == 4) ] <- 0

table(combine.data.regress.test$any.flexible)

table(combine.data.regress.test$wfh.v3, combine.data.regress.test$any.flexible)




























############## flexible vs wfh


result <- list()
robust.result <- list()



  full.model1 <-  lm(paste0("wfh.v3"," ~ factor(luadloc)", demographic.var,employ.var, 
                           current.sit,family.bus, family.var, "+ diary.day", 
                           location.var, spouse.var, 
                           "+ edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) ",
                           childcare.service.var,children.sick.var  ), data = combine.data.regress.test, weights = lufinlwgt )
  
  full.model2 <-  lm(paste0("wfh.v3"," ~ factor(luaddy)", demographic.var,employ.var, 
                           current.sit,family.bus, family.var, "+ diary.day", 
                           location.var, spouse.var, 
                           "+ edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) ",
                           childcare.service.var,children.sick.var  ), data = combine.data.regress.test, weights = lufinlwgt )
  
  full.model3 <-  lm(paste0("wfh.v3"," ~ factor(luadhr)", demographic.var,employ.var, 
                           current.sit,family.bus, family.var, "+ diary.day", 
                           location.var, spouse.var, 
                           "+ edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) ",
                           childcare.service.var,children.sick.var  ), data = combine.data.regress.test, weights = lufinlwgt )
  
  full.model4 <-  lm(paste0("wfh.v3"," ~ factor(any.flexible)", demographic.var,employ.var, 
                           current.sit,family.bus, family.var, "+ diary.day", 
                           location.var, spouse.var, 
                           "+ edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) ",
                           childcare.service.var,children.sick.var  ), data = combine.data.regress.test, weights = lufinlwgt )
  
  
  
  
  result[[1]] <- full.model1
  result[[2]] <- full.model2
  result[[3]] <- full.model3
  result[[4]] <- full.model4
  
  robust.result[[1]] <- sqrt(diag(vcovHC(full.model1, type = "HC1"))) 
  robust.result[[2]] <- sqrt(diag(vcovHC(full.model2, type = "HC1"))) 
  robust.result[[3]] <- sqrt(diag(vcovHC(full.model3, type = "HC1"))) 
  robust.result[[4]] <- sqrt(diag(vcovHC(full.model4, type = "HC1"))) 
  







stargazer(result[[1]], result[[2]], result[[3]], result[[4]], 
          se = list( robust.result[[1]], robust.result[[2]], robust.result[[3]], robust.result[[4]]),  
          column.labels=c("wfh", "wfh", "wfh", "wfh"), 
          keep= c("luadloc", "luaddy", "luadhr","any.flexible" ),
          covariate.labels =c("flexible location", "flexible day", "flexible hour","any flexible"),
          type = "latex", out = "D:/result_wfh.tex", 
          notes = "Sampling weights are applied and robust standard errors are used. Base category is no flexible work arrangements. Number of observations is 1454.", notes.align = "l", omit.table.layout = "s" )




