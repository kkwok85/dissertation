############################################################################################################################################################################################
############################################################################################################################################################################################
# This regression_script.R script is responsible for running regressions
# I assume you have the data and have already run clean_data.R to clean the data
############################################################################################################################################################################################
############################################################################################################################################################################################


############ generate names that contain the dependent variables names for regressions  ###################


names.y <- c("Physical care", 
             "Grocery shopping", "Cooking", "Purchasing prepared food",
             "Playing with children", 
             "Reading to children", "Talking and listening to children", "Helping with homework", "Supervising children", "Picking or dropping off children", "Travel time for helping children",
             "Second. child care - work", "Second. child care - social act.", "Second. child care - household act.", "Second. child care - eating and drinking",
             "Total time for primary child care", "Total time for secondary child care*", "Total time for primary and secondary child care*" , "Proportion of secondary child care", "Travel time to and from work", "Total grooming time", "Total other time use" )

yvariables.v3 <-c( "physical.care.hh.children",
                   "grocery.shopping", "food.drink.preparation", "purchasing.food",
                   "play.with.hh.children",
                   "reading.to.hh.children","talk.listening.to.hh.children","homework.hh.children", "supervision.hh.children", "pick.drop.hh.child", "travel.caring.help.hh.child",
                   "sec.child.care_total.job", "sec.child.care_social.act", "sec.child.care_house.act", "sec.child.care_eat.drink", 
                   "total.time.child", "sec.child.care.hh", "total.time.child.prim.sec",  "portion.sec.child.care.hh",  "total.travel.work.time",  "total.grooming.time", "other.time.use" )






############ generate names that contain the independent variables names for regression  ###################


demographic.no.sex.var <- c("+ age + race.edit  +  marital.status.edit + school.level.completed.edit") 
demographic.var <- c("+ age + race.edit + sex + marital.status.edit + school.level.completed.edit ")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator)   + total.other.job.time +  total.main.job.time + work.hours.last.week ")
family.bus <- c("+ factor(household.own.bus) + factor(unpaid.work.family.bus)")
family.var <- c("+ num.children + num.family.member + age.youngest.child" )
time.var <- c("+ interview.year  + factor(diary.day)" )
location.var <- c("+ region + fips")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
earnings.var <- c("+ edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded)")
family.inc.var <- c("+ factor(edited.family.income3)" )
children.sick.var <- c("+ factor(children.sick.indicator)")




############ generate temporary variables for later use (they are generated since the original factor variables create problems in running regression)  ###################


combine.data.complete.regress.female.employ$wfh.dum <- 0
combine.data.complete.regress.female.employ$wfh.dum[combine.data.complete.regress.female.employ$wfh.v3 == "wfh"] <- 1






combine.data.complete.regress.male.employ$wfh.dum <- 0
combine.data.complete.regress.male.employ$wfh.dum[combine.data.complete.regress.male.employ$wfh.v3 == "wfh"] <- 1



occupations.dum.female  <- combine.data.complete.regress.female.employ[c("tucaseid", "edited.occupations")]
occupations.dum.female$edited.occupations <- factor(occupations.dum.female$edited.occupations)
occupations.dum.female <- dummy.data.frame(occupations.dum.female) 
names(occupations.dum.female ) <- c("tucaseid","edited.occupationsManagement","edited.occupationsBusiness",
                                    "edited.occupationsComputer", "edited.occupationsArchitecture",
                                    "edited.occupationsLife", "edited.occupationsCommunity",
                                    "edited.occupationsLegal", "edited.occupationsEducation", 
                                    "edited.occupationsArts", "edited.occupationsHealthcare", 
                                    "edited.occupationsHealthcaresupport", "edited.occupationsProtective",
                                    "edited.occupationsFood", "edited.occupationsBuilding",
                                    "edited.occupationsPersonal", "edited.occupationsSales",
                                    "edited.occupationsOffice", "edited.occupationsFarming",
                                    "edited.occupationsConstruction", "edited.occupationsInstallation" ,
                                    "edited.occupationsProduction", "edited.occupationsTransportation", "edited.occupationsNotemployed"
)

combine.data.complete.regress.female.employ <- join(combine.data.complete.regress.female.employ ,occupations.dum.female  , by="tucaseid")



occupations.dum.male  <- combine.data.complete.regress.male.employ[c("tucaseid", "edited.occupations")]
occupations.dum.male$edited.occupations  <- factor(occupations.dum.male$edited.occupations)
occupations.dum.male <- dummy.data.frame(occupations.dum.male) 
names(occupations.dum.male ) <- c("tucaseid","edited.occupationsManagement","edited.occupationsBusiness",
                                  "edited.occupationsComputer", "edited.occupationsArchitecture",
                                  "edited.occupationsLife", "edited.occupationsCommunity",
                                  "edited.occupationsLegal", "edited.occupationsEducation", 
                                  "edited.occupationsArts", "edited.occupationsHealthcare", 
                                  "edited.occupationsHealthcaresupport", "edited.occupationsProtective",
                                  "edited.occupationsFood", "edited.occupationsBuilding",
                                  "edited.occupationsPersonal", "edited.occupationsSales",
                                  "edited.occupationsOffice", "edited.occupationsFarming",
                                  "edited.occupationsConstruction", "edited.occupationsInstallation" ,
                                  "edited.occupationsProduction", "edited.occupationsTransportation", "edited.occupationsNotemployed")
combine.data.complete.regress.male.employ <- join(combine.data.complete.regress.male.employ ,occupations.dum.male  , by="tucaseid")







############ a function to print the stars that can indicate significant levels  ###################

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



############ a function to run all the regressions  ###################


reg_result_table <- function(data_wfh) {

# set up empty frame
empty.frame <- data.frame(matrix(ncol = 4, nrow = length(yvariables.v3))) 

# empty.frame2 is for checking 
empty.frame2 <- data.frame(matrix(ncol = 4, nrow = length(yvariables.v3))) 

colnames(empty.frame) <- c("Dependent Variables", "Work from home (units of 480 minutes)" , "Work hours (units of 480 minutes)" , "Total association")
colnames(empty.frame2) <- c("Dependent Variables", "Work from home (units of 480 minutes)" , "Work hours (units of 480 minutes)",  "Total association")



result <- list()
robust.result <- list()





for (i in 1:length(yvariables.v3) ) { 
  dep.var <- yvariables.v3[i]
  # regressions
  if (dep.var == "sec.child.care.hh" | dep.var == "total.time.child.prim.sec" | dep.var == "portion.sec.child.care.hh" | dep.var == "sec.child.care_total.job" | dep.var == "sec.child.care_social.act" | dep.var == "sec.child.care_house.act" | dep.var == "sec.child.care_eat.drink") {
    full.model <- lm(paste0(yvariables.v3[i]," ~   total.job.time2  + wfh.dum +  edited.occupationsManagement + edited.occupationsBusiness + edited.occupationsComputer + edited.occupationsArchitecture + edited.occupationsLife + edited.occupationsCommunity + edited.occupationsLegal + edited.occupationsEducation +  edited.occupationsArts + edited.occupationsHealthcare + edited.occupationsHealthcaresupport + edited.occupationsProtective + edited.occupationsFood + edited.occupationsBuilding + edited.occupationsPersonal + edited.occupationsSales + edited.occupationsOffice + edited.occupationsFarming + edited.occupationsConstruction + edited.occupationsInstallation + edited.occupationsProduction + edited.occupationsTransportation   + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + total.other.job.time", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data_wfh[which(data_wfh$age.youngest.child < 13),] , weights = tufnwgtp )
    
  } else {
    full.model <- lm(paste0(yvariables.v3[i]," ~   total.job.time2  + wfh.dum  + edited.occupationsManagement + edited.occupationsBusiness + edited.occupationsComputer + edited.occupationsArchitecture + edited.occupationsLife + edited.occupationsCommunity + edited.occupationsLegal + edited.occupationsEducation +  edited.occupationsArts + edited.occupationsHealthcare + edited.occupationsHealthcaresupport + edited.occupationsProtective + edited.occupationsFood + edited.occupationsBuilding + edited.occupationsPersonal + edited.occupationsSales + edited.occupationsOffice + edited.occupationsFarming + edited.occupationsConstruction + edited.occupationsInstallation + edited.occupationsProduction + edited.occupationsTransportation  + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + total.other.job.time", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data_wfh , weights = tufnwgtp )
    
  }
  # robust standard error
  robust.result[[i]] <- coeftest(full.model, vcov = vcovHC(full.model, "HC1")) 
  
  
  
  empty.frame[i,1] <- names.y[i]
  empty.frame2[i,1] <- names.y[i]
  
  P_value.4 <- robust.result[[i]][3,4]
  
  
  empty.frame[i,2] <- paste0(format(round(robust.result[[i]][3,1],digits=3), nsmall = 3),star.function(P_value.4),"(",format(round(robust.result[[i]][3,2],digits=3), nsmall = 3),")" )  #wfh result
  empty.frame2[i,2] <- robust.result[[i]][3,1]
  
  P_value.2 <- robust.result[[i]][2,4]
  
  empty.frame[i,3] <- paste0(format(round(robust.result[[i]][2,1],digits=3), nsmall = 3),star.function(P_value.2),"(",format(round(robust.result[[i]][2,2],digits=3), nsmall = 3),")" )  #work hours result
  empty.frame2[i,3] <- robust.result[[i]][2,1]  
  

  
  
  # get rid of NA in the model
  full.model.update <- full.model
  
  full.model.update$coefficients<- full.model$coefficients[!is.na(full.model$coefficients)]
  
  # compute predicted values
  me.wfh <- summary(glht(full.model.update, linfct = c("1*total.job.time2 + 1*wfh.dum    = 0") ))
  me.nwfh <- summary(glht(full.model.update, linfct = c("1*total.job.time2   =0") ))
  
  
  P_value.5 <- me.wfh$test$pvalues
  empty.frame[i,4] <- paste0(format(round(me.wfh$test$coefficients,digits=3), nsmall = 3), star.function(P_value.5), "(", format(round(me.wfh$test$sigma, digits=3), nsmall = 3), ")")  
  empty.frame2[i,4] <- me.wfh$test$coefficients 
  

  
  
} 


result_list <- list("table.output" = empty.frame, "table.check" = empty.frame2)

}


############ use the above functions and generate result tables  ###################


answer.mom <- reg_result_table(combine.data.complete.regress.female.employ)

answer.dad <- reg_result_table(combine.data.complete.regress.male.employ)


# Table 3 results in the paper
print(xtable(answer.mom$table.output, caption = "OLS Results of Working from Home and Marginal Effect of Maternal Employment"),  include.rownames = FALSE, include.colnames = TRUE  )


# Table 4 results in the paper
print(xtable(answer.dad$table.output, caption = "OLS Results of Working from Home and Paternal Effect of Paternal Employment"),  include.rownames = FALSE, include.colnames = TRUE  )




# for calucalating the percentage of compensation of negative maternal employment effect
answer.mom$table.check$total <- (answer.mom$table.check$`Work hours (units of 480 minutes)` )
answer.mom$table.check$percent <- (answer.mom$table.check$total - answer.mom$table.check$`Total association`)/answer.mom$table.check$total


# for calucalating the percentage of compensation of negative paternal employment effect
answer.dad$table.check$total <- (answer.dad$table.check$`Work hours (units of 480 minutes)` )
answer.dad$table.check$percent <- (answer.dad$table.check$total - answer.dad$table.check$`Total association`)/answer.dad$table.check$total











