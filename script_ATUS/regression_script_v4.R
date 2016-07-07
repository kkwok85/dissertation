
names.y <- c("Physical care", 
             "Grocery shopping", "Cooking", "Purchasing prepared food",
             "Playing with children", 
             "Reading to children", "Talking and listening to children", "Helping with homework", "Supervising children", "Picking or dropping off children", "Travel time for helping children",
             "Total time for primary child care", "Total time for secondary child care*", "Total time for primary and secondary child care*", "Percentage of secondary child care time*" , "Travel time to and from work", "Total grooming time", "Total time for TV and movies" )

yvariables.v3 <-c( "physical.care.hh.children",
                   "grocery.shopping", "food.drink.preparation", "purchasing.food",
                   "play.with.hh.children",
                   "reading.to.hh.children","talk.listening.to.hh.children","homework.hh.children", "supervision.hh.children", "pick.drop.hh.child", "travel.caring.help.hh.child",
                   "total.time.child", "sec.child.care.hh", "total.time.child.prim.sec", "portion.sec.child.care.hh",  "total.travel.work.time",  "total.grooming.time", "TV.movies"  )


# regression
# factor(edited.occupations.indicator) skilled cuz it is cut out  ,+ factor(reason.not.work)  + factor(reason.absent.last.week) + factor(reason.absent.last.week.atus)
# factor(allocation.flag.week.earn)  cut 
# becareful of this one!!!! sex is taken away!!!
demographic.no.sex.var <- c("+ age + race.edit  +  marital.status.edit + school.level.completed.edit") 
demographic.var <- c("+ age + race.edit + sex + marital.status.edit + school.level.completed.edit ")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations  + total.other.job.time +  total.main.job.time + work.hours.last.week +factor(edited.employ.status)")
family.bus <- c("+ factor(household.own.bus) + factor(unpaid.work.family.bus)")
family.var <- c("+ num.children + num.family.member + age.youngest.child" )
time.var <- c("+ interview.year  + diary.day" )
location.var <- c("+ region + fips")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
earnings.var <- c("+ edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded)")
family.inc.var <- c("+ edited.family.income3" )
children.sick.var <- c("+ children.sick.indicator")





star.function <- function(p.value)  {
  if (p.value < 0.01) {
    star <- "***"
  } else if (p.value < 0.05) {
    star <- "**"
  } else if (p.value < 0.1) {
    star <- "*"
  }  else {
    star <- ""
  }
  return(star)
}





#combine.data.complete.regress.female.employ$wfh.v3 <- factor(combine.data.complete.regress.female.employ$wfh.v3, levels=c(0,1,2), labels = c("Work.at.office", "Work.from.home", "Unemployed/out.of.labor.force"))




mean.work.hours.female <- weighted.mean(combine.data.complete.regress.female.employ$total.job.time , combine.data.complete.regress.female.employ$tufnwgtp, na.rm=TRUE)

mean.wfh.min.female <- weighted.mean(combine.data.complete.regress.female.employ$total.job.wfh.time , combine.data.complete.regress.female.employ$tufnwgtp, na.rm=TRUE)




################*****************************************####### female

empty.frame <- data.frame(matrix(ncol = 6, nrow = length(yvariables.v3))) 
colnames(empty.frame) <- c("Dependent Variables", "Work from home" , "Work hours", "Employ. status" ,"Work from home mothers", "Work at other locations mothers")



result <- list()
robust.result <- list()

for (i in 1:length(yvariables.v3) ) { 
  dep.var <- yvariables.v3[i]
  if (dep.var == "sec.child.care.hh" | dep.var == "total.time.child.prim.sec" | dep.var == "portion.sec.child.care.hh" ) {
    full.model <- lm(paste0(yvariables.v3[i]," ~   total.job.time + edited.employ.status +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$age.youngest.child < 13),] , weights = tufnwgtp )
    
  } else {
    full.model <- lm(paste0(yvariables.v3[i]," ~   total.job.time + edited.employ.status +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ , weights = tufnwgtp )
    
  }

  robust.result[[i]] <- coeftest(full.model, vcov = vcovHC(full.model, "HC1")) 
  
  
  
  empty.frame[i,1] <- names.y[i]
  
  P_value.4 <- robust.result[[i]][4,4]
  
  
  
  empty.frame[i,2] <- paste0(format(round(robust.result[[i]][4,1],digits=3), nsmall = 3),star.function(P_value.4),"(",format(round(robust.result[[i]][4,2],digits=3), nsmall = 3),")" )  #wfh
  
  P_value.2 <- robust.result[[i]][2,4]
  
  empty.frame[i,3] <- paste0(format(round(robust.result[[i]][2,1],digits=3), nsmall = 3),star.function(P_value.2),"(",format(round(robust.result[[i]][2,2],digits=3), nsmall = 3),")" )  #work hours
  
  P_value.3 <- robust.result[[i]][3,4]
  
  empty.frame[i,4] <- paste0(format(round(robust.result[[i]][3,1],digits=3), nsmall = 3),star.function(P_value.3),"(",format(round(robust.result[[i]][3,2],digits=3), nsmall = 3),")" )   #employ.status
  

  # get rid of NA in the model
  full.model.update <- full.model
  
  full.model.update$coefficients<- full.model$coefficients[!is.na(full.model$coefficients)]
  
  
  me.wfh <- summary(glht(full.model.update, linfct = c(" 232.0996*total.job.time + edited.employ.statusEmployed  + 232.0996*total.job.wfh.time = 0") ))
  me.nwfh <- summary(glht(full.model.update, linfct = c("232.0996*total.job.time + edited.employ.statusEmployed  =0") ))
  
  
  P_value.5 <- me.wfh$test$pvalues
  empty.frame[i,5] <- paste0(format(round(me.wfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.5), "(", format(round(me.wfh$test$sigma, digits=3), nsmall = 3), ")")  
  
  
  P_value.6 <- me.nwfh$test$pvalues
  empty.frame[i,6] <- paste0(format(round(me.nwfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.6), "(", format(round(me.nwfh$test$sigma, digits=3), nsmall = 3), ")")  
  
  
  
  #empty.frame[i,5] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] + summary(full.model)$coefficients[4,1]  
  
  
  
  #empty.frame[i,6] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] 
  
  
  
} 


print(xtable(empty.frame, caption = "OLS Results of Working from Home and Marginal Effect of Maternal Employment"),  include.rownames = FALSE, include.colnames = TRUE  )















mean.work.hours.male <- weighted.mean(combine.data.complete.regress.male.employ$total.job.time , combine.data.complete.regress.male.employ$tufnwgtp, na.rm=TRUE)

mean.wfh.min.male <- weighted.mean(combine.data.complete.regress.male.employ$total.job.wfh.time , combine.data.complete.regress.male.employ$tufnwgtp, na.rm=TRUE)




################*****************************************####### male

empty.frame <- data.frame(matrix(ncol = 6, nrow = length(yvariables.v3))) 
colnames(empty.frame) <- c("Dependent Variables", "Work from home" , "Work hours", "Employ. status" ,"Work from home fathers", "Work at other locations fathers")





result <- list()
robust.result <- list()

for (i in 1:length(yvariables.v3) ) { 
  dep.var <- yvariables.v3[i]
  if (dep.var == "sec.child.care.hh" | dep.var == "total.time.child.prim.sec" | dep.var == "portion.sec.child.care.hh" ) {
    full.model <- lm(paste0(yvariables.v3[i]," ~   total.job.time + edited.employ.status +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.male.employ[which(combine.data.complete.regress.male.employ$age.youngest.child < 13),] , weights = tufnwgtp )
    
  } else {
    full.model <- lm(paste0(yvariables.v3[i]," ~   total.job.time + edited.employ.status +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.male.employ , weights = tufnwgtp )
    
  }
  
  robust.result[[i]] <- coeftest(full.model, vcov = vcovHC(full.model, "HC1")) 
  
  
  
  empty.frame[i,1] <- names.y[i]
  
  P_value.4 <- robust.result[[i]][4,4]
  
  
  
  empty.frame[i,2] <- paste0(format(round(robust.result[[i]][4,1],digits=3), nsmall = 3),star.function(P_value.4),"(",format(round(robust.result[[i]][4,2],digits=3), nsmall = 3),")" )  #wfh
  
  P_value.2 <- robust.result[[i]][2,4]
  
  empty.frame[i,3] <- paste0(format(round(robust.result[[i]][2,1],digits=3), nsmall = 3),star.function(P_value.2),"(",format(round(robust.result[[i]][2,2],digits=3), nsmall = 3),")" )  #work hours
  
  P_value.3 <- robust.result[[i]][3,4]
  
  empty.frame[i,4] <- paste0(format(round(robust.result[[i]][3,1],digits=3), nsmall = 3),star.function(P_value.3),"(",format(round(robust.result[[i]][3,2],digits=3), nsmall = 3),")" )   #employ.status
  
  
  

  
  
  # get rid of NA in the model
  full.model.update <- full.model
  
  full.model.update$coefficients<- full.model$coefficients[!is.na(full.model$coefficients)]
  
  
  me.wfh <- summary(glht(full.model.update, linfct = c("413.7331*total.job.time + edited.employ.statusEmployed +  413.7331*total.job.wfh.time = 0") ))
  me.nwfh <- summary(glht(full.model.update, linfct = c("413.7331*total.job.time + edited.employ.statusEmployed  =0") ))
  
  
  P_value.5 <- me.wfh$test$pvalues
  empty.frame[i,5] <- paste0(format(round(me.wfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.5), "(", format(round(me.wfh$test$sigma, digits=3), nsmall = 3), ")")  
  
  
  P_value.6 <- me.nwfh$test$pvalues
  empty.frame[i,6] <- paste0(format(round(me.nwfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.6), "(", format(round(me.nwfh$test$sigma, digits=3), nsmall = 3), ")")  
  
  
  
  #empty.frame[i,5] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] + summary(full.model)$coefficients[4,1]  
  
  
  
  #empty.frame[i,6] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] 
  
  
  
} 


print(xtable(empty.frame, caption = "OLS Results of Working from Home and Marginal Effect of Paternal Employment"),  include.rownames = FALSE, include.colnames = TRUE  )






####### aggregate!!!#############









# try to see the 







names.y.agg <-c("Personal care", "Household act.", "Caring for adults", "Caring for nonhousehold children", "Work related act.", "Education", 
                    "Consumer purchases", "Professional & personal care services", "Household services", "Govt services and civic obligations",
                    "Eating and drinking" , "Socializing, relaxing and leisure" , "Sports, exercise & recreation", "Religious and spiritual act.",
                    "Volunteer act.", "Telephone calls", "Traveling")


yvariables.agg <-c("total01", "total02", "total.time.adults", "total04", "total05", "total06", "total07" , "total08", "total09" , "total10", "total11",
                   "total12", "total13", "total14", "total15", "total16", "total18")




################*****************************************####### female

empty.frame <- data.frame(matrix(ncol = 6, nrow = length(yvariables.agg))) 
colnames(empty.frame) <- c("Dependent Variables", "Work from home" , "Work hours", "Employ. status" ,"Work from home mothers", "Work at other locations mothers")



result <- list()
robust.result <- list()

for (i in 1:length(yvariables.agg) ) { 
  dep.var <- yvariables.agg[i]
  
  full.model <- lm(paste0(yvariables.agg[i]," ~   total.job.time + edited.employ.status +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ , weights = tufnwgtp )
  
  
  
  robust.result[[i]] <- coeftest(full.model, vcov = vcovHC(full.model, "HC1")) 
  
  
  
  empty.frame[i,1] <- names.y.agg[i]
  
  P_value.4 <- robust.result[[i]][4,4]
  
  
  
  empty.frame[i,2] <- paste0(format(round(robust.result[[i]][4,1],digits=3), nsmall = 3),star.function(P_value.4),"(",format(round(robust.result[[i]][4,2],digits=3), nsmall = 3),")" )  #wfh
  
  P_value.2 <- robust.result[[i]][2,4]
  
  empty.frame[i,3] <- paste0(format(round(robust.result[[i]][2,1],digits=3), nsmall = 3),star.function(P_value.2),"(",format(round(robust.result[[i]][2,2],digits=3), nsmall = 3),")" )  #work hours
  
  P_value.3 <- robust.result[[i]][3,4]
  
  empty.frame[i,4] <- paste0(format(round(robust.result[[i]][3,1],digits=3), nsmall = 3),star.function(P_value.3),"(",format(round(robust.result[[i]][3,2],digits=3), nsmall = 3),")" )   #employ.status
  
  
  # get rid of NA in the model
  full.model.update <- full.model
  
  full.model.update$coefficients<- full.model$coefficients[!is.na(full.model$coefficients)]
  
  
  me.wfh <- summary(glht(full.model.update, linfct = c(" 232.0996*total.job.time + edited.employ.statusEmployed  + 232.0996*total.job.wfh.time = 0") ))
  me.nwfh <- summary(glht(full.model.update, linfct = c("232.0996*total.job.time + edited.employ.statusEmployed  =0") ))
  
  
  P_value.5 <- me.wfh$test$pvalues
  empty.frame[i,5] <- paste0(format(round(me.wfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.5), "(", format(round(me.wfh$test$sigma, digits=3), nsmall = 3), ")")  
  
  
  P_value.6 <- me.nwfh$test$pvalues
  empty.frame[i,6] <- paste0(format(round(me.nwfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.6), "(", format(round(me.nwfh$test$sigma, digits=3), nsmall = 3), ")")  
  
  
  
  #empty.frame[i,5] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] + summary(full.model)$coefficients[4,1]  
  
  
  
  #empty.frame[i,6] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] 
  
  
  
} 


print(xtable(empty.frame, caption = "OLS Results of Working from Home and Marginal Effect of Maternal Employment"),  include.rownames = FALSE, include.colnames = TRUE  )
















################*****************************************####### male

empty.frame <- data.frame(matrix(ncol = 6, nrow = length(yvariables.agg))) 
colnames(empty.frame) <- c("Dependent Variables", "Work from home" , "Work hours", "Employ. status" ,"Work from home mothers", "Work at other locations mothers")



result <- list()
robust.result <- list()

for (i in 1:length(yvariables.agg) ) { 
  dep.var <- yvariables.agg[i]
  
  full.model <- lm(paste0(yvariables.agg[i]," ~   total.job.time + edited.employ.status +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.male.employ , weights = tufnwgtp )
  
  
  
  robust.result[[i]] <- coeftest(full.model, vcov = vcovHC(full.model, "HC1")) 
  
  
  
  empty.frame[i,1] <- names.y.agg[i]
  
  P_value.4 <- robust.result[[i]][4,4]
  
  
  
  empty.frame[i,2] <- paste0(format(round(robust.result[[i]][4,1],digits=3), nsmall = 3),star.function(P_value.4),"(",format(round(robust.result[[i]][4,2],digits=3), nsmall = 3),")" )  #wfh
  
  P_value.2 <- robust.result[[i]][2,4]
  
  empty.frame[i,3] <- paste0(format(round(robust.result[[i]][2,1],digits=3), nsmall = 3),star.function(P_value.2),"(",format(round(robust.result[[i]][2,2],digits=3), nsmall = 3),")" )  #work hours
  
  P_value.3 <- robust.result[[i]][3,4]
  
  empty.frame[i,4] <- paste0(format(round(robust.result[[i]][3,1],digits=3), nsmall = 3),star.function(P_value.3),"(",format(round(robust.result[[i]][3,2],digits=3), nsmall = 3),")" )   #employ.status
  
  
  # get rid of NA in the model
  full.model.update <- full.model
  
  full.model.update$coefficients<- full.model$coefficients[!is.na(full.model$coefficients)]
  
  
  me.wfh <- summary(glht(full.model.update, linfct = c(" 413.7331*total.job.time + edited.employ.statusEmployed  + 413.7331*total.job.wfh.time = 0") ))
  me.nwfh <- summary(glht(full.model.update, linfct = c("413.7331*total.job.time + edited.employ.statusEmployed  =0") ))
  
  
  P_value.5 <- me.wfh$test$pvalues
  empty.frame[i,5] <- paste0(format(round(me.wfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.5), "(", format(round(me.wfh$test$sigma, digits=3), nsmall = 3), ")")  
  
  
  P_value.6 <- me.nwfh$test$pvalues
  empty.frame[i,6] <- paste0(format(round(me.nwfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.6), "(", format(round(me.nwfh$test$sigma, digits=3), nsmall = 3), ")")  
  
  
  
  #empty.frame[i,5] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] + summary(full.model)$coefficients[4,1]  
  
  
  
  #empty.frame[i,6] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] 
  
  
  
} 


print(xtable(empty.frame, caption = "OLS Results of Working from Home and Marginal Effect of Paternal Employment"),  include.rownames = FALSE, include.colnames = TRUE  )





























