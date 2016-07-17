
names.y <- c("Physical care", 
             "Grocery shopping", "Cooking", "Purchasing prepared food",
             "Playing with children", 
             "Reading to children", "Talking and listening to children", "Helping with homework", "Supervising children", "Picking or dropping off children", "Travel time for helping children",
             "Total time for primary child care", "Total time for secondary child care*", "Total time for primary and secondary child care*", "Percentage of secondary child care time*" , "Travel time to and from work", "Total grooming time", "Total time for TV and movies", "Total other time use" )

yvariables.v3 <-c( "physical.care.hh.children",
                   "grocery.shopping", "food.drink.preparation", "purchasing.food",
                   "play.with.hh.children",
                   "reading.to.hh.children","talk.listening.to.hh.children","homework.hh.children", "supervision.hh.children", "pick.drop.hh.child", "travel.caring.help.hh.child",
                   "total.time.child", "sec.child.care.hh", "total.time.child.prim.sec", "portion.sec.child.care.hh",  "total.travel.work.time",  "total.grooming.time", "TV.movies" , "other.time.use" )


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

# empty.frame2 is for checking


################*****************************************####### female

empty.frame <- data.frame(matrix(ncol = 5, nrow = length(yvariables.v3))) 
empty.frame2 <- data.frame(matrix(ncol = 5, nrow = length(yvariables.v3))) 

colnames(empty.frame) <- c("Dependent Variables", "Work from home" , "Work hours" ,"Work from home mothers", "Work at other locations mothers")
colnames(empty.frame2) <- c("Dependent Variables", "Work from home" , "Work hours","Work from home mothers", "Work at other locations mothers")



result <- list()
robust.result <- list()

for (i in 1:length(yvariables.v3) ) { 
  dep.var <- yvariables.v3[i]
  if (dep.var == "sec.child.care.hh" | dep.var == "total.time.child.prim.sec" | dep.var == "portion.sec.child.care.hh" ) {
    full.model <- lm(paste0(yvariables.v3[i]," ~   total.job.time  +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$age.youngest.child < 13),] , weights = tufnwgtp )
    
  } else {
    full.model <- lm(paste0(yvariables.v3[i]," ~   total.job.time +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ , weights = tufnwgtp )
    
  }

  robust.result[[i]] <- coeftest(full.model, vcov = vcovHC(full.model, "HC1")) 
  
  
  
  empty.frame[i,1] <- names.y[i]
  empty.frame2[i,1] <- names.y[i]
  
  P_value.4 <- robust.result[[i]][3,4]
  
  
  
  empty.frame[i,2] <- paste0(format(round(robust.result[[i]][3,1],digits=3), nsmall = 3),star.function(P_value.4),"(",format(round(robust.result[[i]][3,2],digits=3), nsmall = 3),")" )  #wfh
  empty.frame2[i,2] <- robust.result[[i]][3,1]
  
  P_value.2 <- robust.result[[i]][2,4]
  
  empty.frame[i,3] <- paste0(format(round(robust.result[[i]][2,1],digits=3), nsmall = 3),star.function(P_value.2),"(",format(round(robust.result[[i]][2,2],digits=3), nsmall = 3),")" )  #work hours
  empty.frame2[i,3] <- robust.result[[i]][2,1]  #work hours
  

  # get rid of NA in the model
  full.model.update <- full.model
  
  full.model.update$coefficients<- full.model$coefficients[!is.na(full.model$coefficients)]
  
  
  me.wfh <- summary(glht(full.model.update, linfct = c(" 232.0996*total.job.time   + 232.0996*total.job.wfh.time = 0") ))
  me.nwfh <- summary(glht(full.model.update, linfct = c("232.0996*total.job.time   =0") ))
  
  
  P_value.5 <- me.wfh$test$pvalues
  empty.frame[i,4] <- paste0(format(round(me.wfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.5), "(", format(round(me.wfh$test$sigma, digits=3), nsmall = 3), ")")  
  empty.frame2[i,4] <- me.wfh$test$coefficients 
  
  
  P_value.6 <- me.nwfh$test$pvalues
  empty.frame[i,5] <- paste0(format(round(me.nwfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.6), "(", format(round(me.nwfh$test$sigma, digits=3), nsmall = 3), ")")  
  empty.frame2[i,5] <- me.nwfh$test$coefficients 
  
  
  
  #empty.frame[i,5] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] + summary(full.model)$coefficients[4,1]  
  
  
  
  #empty.frame[i,6] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] 
  
  
  
} 


print(xtable(empty.frame, caption = "OLS Results of Working from Home and Marginal Effect of Maternal Employment"),  include.rownames = FALSE, include.colnames = TRUE  )















mean.work.hours.male <- weighted.mean(combine.data.complete.regress.male.employ$total.job.time , combine.data.complete.regress.male.employ$tufnwgtp, na.rm=TRUE)

mean.wfh.min.male <- weighted.mean(combine.data.complete.regress.male.employ$total.job.wfh.time , combine.data.complete.regress.male.employ$tufnwgtp, na.rm=TRUE)




################*****************************************####### male

empty.frame <- data.frame(matrix(ncol = 5, nrow = length(yvariables.v3))) 
empty.frame2 <- data.frame(matrix(ncol = 5, nrow = length(yvariables.v3))) 
colnames(empty.frame) <- c("Dependent Variables", "Work from home" , "Work hours","Work from home fathers", "Work at other locations fathers")

colnames(empty.frame2) <- c("Dependent Variables", "Work from home" , "Work hours","Work from home mothers", "Work at other locations mothers")




result <- list()
robust.result <- list()

for (i in 1:length(yvariables.v3) ) { 
  dep.var <- yvariables.v3[i]
  if (dep.var == "sec.child.care.hh" | dep.var == "total.time.child.prim.sec" | dep.var == "portion.sec.child.care.hh" ) {
    full.model <- lm(paste0(yvariables.v3[i]," ~   total.job.time  +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.male.employ[which(combine.data.complete.regress.male.employ$age.youngest.child < 13),] , weights = tufnwgtp )
    
  } else {
    full.model <- lm(paste0(yvariables.v3[i]," ~   total.job.time  +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.male.employ , weights = tufnwgtp )
    
  }
  
  robust.result[[i]] <- coeftest(full.model, vcov = vcovHC(full.model, "HC1")) 
  
  
  
  empty.frame[i,1] <- names.y[i]
  empty.frame2[i,1] <- names.y[i]
  
  P_value.4 <- robust.result[[i]][3,4]
  
  
  
  empty.frame[i,2] <- paste0(format(round(robust.result[[i]][3,1],digits=3), nsmall = 3),star.function(P_value.4),"(",format(round(robust.result[[i]][3,2],digits=3), nsmall = 3),")" )  #wfh
  empty.frame2[i,2] <- robust.result[[i]][3,1]  #wfh
  
  P_value.2 <- robust.result[[i]][2,4]
  
  empty.frame[i,3] <- paste0(format(round(robust.result[[i]][2,1],digits=3), nsmall = 3),star.function(P_value.2),"(",format(round(robust.result[[i]][2,2],digits=3), nsmall = 3),")" )  #work hours
  empty.frame2[i,3] <- robust.result[[i]][2,1]  #work hours
  

  

  
  
  # get rid of NA in the model
  full.model.update <- full.model
  
  full.model.update$coefficients<- full.model$coefficients[!is.na(full.model$coefficients)]
  
  
  me.wfh <- summary(glht(full.model.update, linfct = c("413.7331*total.job.time  +  413.7331*total.job.wfh.time = 0") ))
  me.nwfh <- summary(glht(full.model.update, linfct = c("413.7331*total.job.time   =0") ))
  
  
  P_value.5 <- me.wfh$test$pvalues
  empty.frame[i,4] <- paste0(format(round(me.wfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.5), "(", format(round(me.wfh$test$sigma, digits=3), nsmall = 3), ")")  
  empty.frame2[i,4] <- me.wfh$test$coefficients  
  
  
  P_value.6 <- me.nwfh$test$pvalues
  empty.frame[i,5] <- paste0(format(round(me.nwfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.6), "(", format(round(me.nwfh$test$sigma, digits=3), nsmall = 3), ")")  
  empty.frame2[i,5] <- me.nwfh$test$coefficients 
  
  
  
  #empty.frame[i,5] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] + summary(full.model)$coefficients[4,1]  
  
  
  
  #empty.frame[i,6] <- 480*summary(full.model)$coefficients[2,1] + summary(full.model)$coefficients[3,1] 
  
  
  
} 


print(xtable(empty.frame, caption = "OLS Results of Working from Home and Marginal Effect of Paternal Employment"),  include.rownames = FALSE, include.colnames = TRUE  )







# check result the same as the table printed out

#
summary(lm(paste0(yvariables.v3[1]," ~   total.job.time +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ , weights = tufnwgtp ))
summary(lm(paste0(yvariables.v3[1]," ~   total.job.time +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$age.youngest.child < 13),] , weights = tufnwgtp ))


summary(lm(paste0(yvariables.v3[1]," ~   total.job.time +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.male.employ , weights = tufnwgtp ))
summary(lm(paste0(yvariables.v3[1]," ~   total.job.time +total.job.wfh.time  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.male.employ[which(combine.data.complete.regress.female.employ$age.youngest.child < 13),] , weights = tufnwgtp ))






