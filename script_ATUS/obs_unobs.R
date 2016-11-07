############################################################################################################################################################################################
############################################################################################################################################################################################
# This obs_unobs.R script is responsible for generating results for the identification in the paper
# I assume you have the data and have already run clean_data.R to clean the data
############################################################################################################################################################################################
############################################################################################################################################################################################


############ generate temporary variables for later use   ###################


combine.data.complete.regress.female.employ$wfh.dum <- 0
combine.data.complete.regress.female.employ$wfh.dum[combine.data.complete.regress.female.employ$wfh.v3 == "wfh"] <- 1






combine.data.complete.regress.male.employ$wfh.dum <- 0
combine.data.complete.regress.male.employ$wfh.dum[combine.data.complete.regress.male.employ$wfh.v3 == "wfh"] <- 1



############ a function to print the stars that can indicate significant levels  ###################


table.obs.unobs <- function(data.input, dep.var) {
  
  

  result <- lm(paste0(dep.var," ~   total.job.time2  + edited.occupationsManagement + edited.occupationsBusiness + edited.occupationsComputer + edited.occupationsArchitecture + edited.occupationsLife + edited.occupationsCommunity + edited.occupationsLegal + edited.occupationsEducation +  edited.occupationsArts + edited.occupationsHealthcare + edited.occupationsHealthcaresupport + edited.occupationsProtective + edited.occupationsFood + edited.occupationsBuilding + edited.occupationsPersonal + edited.occupationsSales + edited.occupationsOffice + edited.occupationsFarming + edited.occupationsConstruction + edited.occupationsInstallation + edited.occupationsProduction + edited.occupationsTransportation  + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + total.other.job.time", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  
  data.input$predicted.yhat <- predict(result, newdata = data.input) 
  
  
  
  
  
  a <- weighted.mean(data.input$predicted.yhat[which(data.input$wfh.dum == 1)], data.input$tufnwgtp[which(data.input$wfh.dum == 1)] , na.rm=TRUE)
  
  b <- weighted.mean(data.input$predicted.yhat[which(data.input$wfh.dum == 0)], data.input$tufnwgtp[which(data.input$wfh.dum == 0)] , na.rm=TRUE)
  
  
  
  
  
  col1 <- (a - b)/var(data.input$predicted.yhat, na.rm = TRUE)
  
  
  col2 <- var(resid(result), na.rm=TRUE)
  #col2 <- var(data.input$predicted.yhat, na.rm = TRUE) # another possible option. But the difference is very small
  
  col3 <- (a - b)
  
  
  
  result2 <- lm(paste0("wfh.dum"," ~   total.job.time2  + edited.occupationsManagement + edited.occupationsBusiness + edited.occupationsComputer + edited.occupationsArchitecture + edited.occupationsLife + edited.occupationsCommunity + edited.occupationsLegal + edited.occupationsEducation +  edited.occupationsArts + edited.occupationsHealthcare + edited.occupationsHealthcaresupport + edited.occupationsProtective + edited.occupationsFood + edited.occupationsBuilding + edited.occupationsPersonal + edited.occupationsSales + edited.occupationsOffice + edited.occupationsFarming + edited.occupationsConstruction + edited.occupationsInstallation + edited.occupationsProduction + edited.occupationsTransportation + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + total.other.job.time", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  
  
  
  variance.ratio <- var(data.input$wfh.dum, na.rm = TRUE)/var(resid(result2), na.rm=TRUE)
  
  col4 <- (a - b)*variance.ratio
  
  

  full.reg <- lm(paste0(dep.var," ~   total.job.time2  + wfh.dum  + edited.occupationsManagement + edited.occupationsBusiness + edited.occupationsComputer + edited.occupationsArchitecture + edited.occupationsLife + edited.occupationsCommunity + edited.occupationsLegal + edited.occupationsEducation +  edited.occupationsArts + edited.occupationsHealthcare + edited.occupationsHealthcaresupport + edited.occupationsProtective + edited.occupationsFood + edited.occupationsBuilding + edited.occupationsPersonal + edited.occupationsSales + edited.occupationsOffice + edited.occupationsFarming + edited.occupationsConstruction + edited.occupationsInstallation + edited.occupationsProduction + edited.occupationsTransportation  + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + total.other.job.time", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  
  
  wfh.coeff <- summary(full.reg)$coefficients[3, 1]
  
  col5 <- wfh.coeff
  col6 <-  wfh.coeff/ ((a - b)*variance.ratio)
  col7 <- summary(full.reg)$adj.r.squared
  
  result.array <-array(0,7)
  
  
  result.array[1] <- col1
  result.array[2] <- col2 
  result.array[3] <- col3
  result.array[4] <- col4
  result.array[5] <- col5
  result.array[6] <- col6
  result.array[7] <- col7
  return(result.array)
  
}



############ generate results talbes for mothers   ###################


# empty frame
empty.frame.total <- data.frame(matrix(ncol = 8, nrow = length(yvariables.v3))) 

# use the above functions to generate results
for (i in 1:length(yvariables.v3)) {
dep.var <-  yvariables.v3[i]
if (dep.var == "sec.child.care.hh" | dep.var == "total.time.child.prim.sec" | dep.var == "portion.sec.child.care.hh" | dep.var == "sec.child.care_total.job" | dep.var == "sec.child.care_social.act" | dep.var == "sec.child.care_house.act" | dep.var == "sec.child.care_eat.drink") {
  result.all <- table.obs.unobs(combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$age.youngest.child < 13 & combine.data.complete.regress.female.employ$interview.year != "2003"),] , yvariables.v3[i])
} else {
  result.all <- table.obs.unobs(combine.data.complete.regress.female.employ, yvariables.v3[i])
}
  
for (j in 1:7) {
  empty.frame.total[i,j+1] <- round(result.all[j], digits = 3)
  empty.frame.total[i,1] <- names.y[i]
}

}


empty.frame.total$diff <- empty.frame.total$X6 - empty.frame.total$X5 

empty.frame.total <- empty.frame.total[,c(1,2, 3, 4,5,6,7,9,8)]

# Table 5 results in the paper
print(xtable(empty.frame.total, caption = "The Amount of Selection on Unobservables Relative to Selection on Observables
Required to Attribute the Entire Working from Home Effect to Selection Bias - Mothers",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )




############ generate results talbes for fathers   ###################


# empty frame
empty.frame.total <- data.frame(matrix(ncol = 8, nrow = length(yvariables.v3))) 

# use the above functions to generate results
for (i in 1:length(yvariables.v3)) {
  dep.var <-  yvariables.v3[i]
  if (dep.var == "sec.child.care.hh" | dep.var == "total.time.child.prim.sec" | dep.var == "portion.sec.child.care.hh" | dep.var == "sec.child.care_total.job" | dep.var == "sec.child.care_social.act" | dep.var == "sec.child.care_house.act" | dep.var == "sec.child.care_eat.drink") {
    result.all <- table.obs.unobs(combine.data.complete.regress.male.employ[which(combine.data.complete.regress.male.employ$age.youngest.child < 13 & combine.data.complete.regress.male.employ$interview.year != "2003"),] , yvariables.v3[i])
  } else {
    result.all <- table.obs.unobs(combine.data.complete.regress.male.employ, yvariables.v3[i])
  }
  
  for (j in 1:7) {
    empty.frame.total[i,j+1] <- round(result.all[j], digits = 3)
    empty.frame.total[i,1] <- names.y[i]
    
  }
  
}


empty.frame.total$diff <- empty.frame.total$X6 - empty.frame.total$X5 

empty.frame.total <- empty.frame.total[,c(1,2, 3, 4,5,6,7,9,8)]

# Table 6 results in the paper
print(xtable(empty.frame.total, caption = "The Amount of Selection on Unobservables Relative to Selection on Observables
Required to Attribute the Entire Working from Home Effect to Selection Bias - Fathers",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )

