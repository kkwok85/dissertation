



install.packages("lrmest")
library(lrmest)

+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse 

# dim(model.matrix(test))
# 139 coefficients
test <-lm(total.time.child ~  full.part.time.spouse , data = combine.data.complete.regress.female.employ , weights = tufnwgtp) 
dim(model.matrix(test))

r <- c(0)
R <- rep(0, 139)
R[3] <- 1
d <- c(0)

summary(lm(paste0("total.time.child" ," ~   total.job.time2  +total.job.wfh.time2  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ , weights = tufnwgtp) )



rls(paste0("total.time.child ~   total.job.time2  +total.job.wfh.time2  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), r, R, d, data = combine.data.complete.regress.female.employ  )


earnings.var, family.inc.var,  children.sick.var


#fips, spouse.employ.status, + full.part.time.spouse    has problem

62


r <- c(0)
R <- rep(0, 84)
R[3] <- 1
d <- c(0)

rls(paste0("total.time.child  ~   total.job.time2  +total.job.wfh.time2  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + interview.year  + factor(diary.day) +region + edit.spouse.presence + edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)  ", demographic.no.sex.var, family.bus, family.var, earnings.var, family.inc.var,  children.sick.var) , r, R, d, data = combine.data.complete.regress.female.employ)     




first part:
  
  
combine.data.complete.regress.female.employ$wfh.v4 <- 0

combine.data.complete.regress.female.employ$wfh.v4[which(combine.data.complete.regress.female.employ$total.job.wfh.time2 > 0 )] <- 1 

combine.data.complete.regress.female.employ$wfh.v5 <- combine.data.complete.regress.female.employ$wfh.v3

combine.data.complete.regress.female.employ$wfh.v5[which(combine.data.complete.regress.female.employ$wfh.v3 == 2 )] <- 0 




combine.data.complete.regress.male.employ$wfh.v4 <- 0

combine.data.complete.regress.male.employ$wfh.v4[which(combine.data.complete.regress.male.employ$total.job.wfh.time2 > 0 )] <- 1 

combine.data.complete.regress.male.employ$wfh.v5 <- combine.data.complete.regress.female.employ$wfh.v3

combine.data.complete.regress.male.employ$wfh.v5[which(combine.data.complete.regress.female.employ$wfh.v3 == 2)] <- 1 










#r <- c(0)
#R <- rep(0, 84)
#R[3] <- 1
#d <- c(0)

#t <- rls(paste0("total.time.child  ~   total.job.time2  + wfh.v4  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + interview.year  + factor(diary.day) +region + edit.spouse.presence + edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)  ", demographic.no.sex.var, family.bus, family.var, earnings.var, family.inc.var,  children.sick.var) , r, R, d, data = combine.data.complete.regress.female.employ)     
#t <- rls(paste0("total.time.child  ~   total.job.time2  + wfh.v4  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + interview.year  + factor(diary.day) +region + edit.spouse.presence + edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)  ", demographic.no.sex.var, family.bus, family.var, earnings.var, family.inc.var,  children.sick.var) , r, R, d, data = combine.data.complete.regress.female.employ)     
#t1 <- as.data.frame(t)
#t2 <- as.matrix(t1[,1])






# total primary


# add quotation if u input dep.var name 

# add quotation if u input dep.var name 
table.obs.unobs <- function(data.input, dep.var) {
  
  
  
  # result<- lm(paste0(dep.var," ~   total.job.time2   + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  # result <- lm(paste0(dep.var," ~   total.job.time2   + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  result <- lm(paste0(dep.var," ~   total.job.time2  + edited.occupationsManagement + edited.occupationsBusiness + edited.occupationsComputer + edited.occupationsArchitecture + edited.occupationsLife + edited.occupationsCommunity + edited.occupationsLegal + edited.occupationsEducation +  edited.occupationsArts + edited.occupationsHealthcare + edited.occupationsHealthcaresupport + edited.occupationsProtective + edited.occupationsFood + edited.occupationsBuilding + edited.occupationsPersonal + edited.occupationsSales + edited.occupationsOffice + edited.occupationsFarming + edited.occupationsConstruction + edited.occupationsInstallation + edited.occupationsProduction + edited.occupationsTransportation  + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + total.other.job.time", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  
  data.input$predicted.yhat <- predict(result, newdata = data.input) 
  
  
  
  
  
  a <- weighted.mean(data.input$predicted.yhat[which(data.input$wfh.dum == 1)], data.input$tufnwgtp[which(data.input$wfh.dum == 1)] , na.rm=TRUE)
  
  b <- weighted.mean(data.input$predicted.yhat[which(data.input$wfh.dum == 0)], data.input$tufnwgtp[which(data.input$wfh.dum == 0)] , na.rm=TRUE)
  
  
  
  
  
  col1 <- (a - b)/var(data.input$predicted.yhat, na.rm = TRUE)
  
  
  col2 <- var(resid(result), na.rm=TRUE)
  #col2 <- var(data.input$predicted.yhat, na.rm = TRUE)
  col3 <- (a - b)
  
  
  
  #result2 <- lm(paste0("wfh.dum"," ~   total.job.time2   + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  
  
  
  #result2 <- lm(paste0("wfh.dum"," ~   total.job.time2   + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  result2 <- lm(paste0("wfh.dum"," ~   total.job.time2  + edited.occupationsManagement + edited.occupationsBusiness + edited.occupationsComputer + edited.occupationsArchitecture + edited.occupationsLife + edited.occupationsCommunity + edited.occupationsLegal + edited.occupationsEducation +  edited.occupationsArts + edited.occupationsHealthcare + edited.occupationsHealthcaresupport + edited.occupationsProtective + edited.occupationsFood + edited.occupationsBuilding + edited.occupationsPersonal + edited.occupationsSales + edited.occupationsOffice + edited.occupationsFarming + edited.occupationsConstruction + edited.occupationsInstallation + edited.occupationsProduction + edited.occupationsTransportation + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + total.other.job.time", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  
  
  
  variance.ratio <- var(data.input$wfh.dum, na.rm = TRUE)/var(resid(result2), na.rm=TRUE)
  
  col4 <- (a - b)*variance.ratio
  
  
  #full.reg <- lm(paste0(dep.var," ~   total.job.time2 + wfh.dum  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  #full.reg <- lm(paste0(dep.var," ~   total.job.time2   + wfh.dum  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input, weights = tufnwgtp )
  
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











# total primary + secondary

#combine.data.complete.regress.female.employ.temp <- combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$wfh.v3 <=1 ),]

#combine.data.complete.regress.female.employ.temp <- combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$edited.employ.status == "Employed" ),]

#combine.data.complete.regress.female.employ.temp <- combine.data.complete.regress.female.employ

#combine.data.complete.regress.female.employ.temp.under13 <- combine.data.complete.regress.female.employ.temp[which(combine.data.complete.regress.female.employ.temp$age.youngest.child < 13 & combine.data.complete.regress.female.employ.temp$interview.year != "2003"),]

#combine.data.complete.regress.female.employ.under13.v2 <- combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$age.youngest.child < 13 & combine.data.complete.regress.female.employ$interview.year != "2003"),]




# all other variables
empty.frame.total <- data.frame(matrix(ncol = 8, nrow = length(yvariables.v3))) 


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

print(xtable(empty.frame.total, caption = "The Amount of Selection on Unobservables Relative to Selection on Observables
Required to Attribute the Entire Working from Home Effect to Selection Bias - Mothers",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )




# for presentation 
wfh.bias.table <- data.frame(cbind( empty.frame.total$X5, empty.frame.total$X6, empty.frame.total$X8), stringsAsFactors = FALSE)
wfh.bias.table$true.value.wfh <- wfh.bias.table$X2  - wfh.bias.table$X1

wfh.bias.table <- data.frame(cbind( empty.frame.total$X1, wfh.bias.table))

wfh.bias.table <- wfh.bias.table[,c(1,2, 3, 5,4)]



print(xtable(wfh.bias.table, caption = "The Amount of Selection on Unobservables Relative to Selection on Observables
Required to Attribute the Entire Working from Home Effect to Selection Bias - Mothers",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )


















# total primary + secondary

#combine.data.complete.regress.male.employ.temp <- combine.data.complete.regress.male.employ[which(combine.data.complete.regress.male.employ$wfh.v3 <=1 ),]


#combine.data.complete.regress.male.employ.temp <- combine.data.complete.regress.male.employ


#combine.data.complete.regress.male.employ.temp.under13 <- combine.data.complete.regress.male.employ.temp[which(combine.data.complete.regress.male.employ.temp$age.youngest.child < 13 & combine.data.complete.regress.male.employ.temp$interview.year != "2003"),]

#combine.data.complete.regress.male.employ.under13.v2 <- combine.data.complete.regress.male.employ[which(combine.data.complete.regress.male.employ$age.youngest.child < 13 & combine.data.complete.regress.male.employ$interview.year != "2003"),]





# all other variables
empty.frame.total <- data.frame(matrix(ncol = 8, nrow = length(yvariables.v3))) 


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

print(xtable(empty.frame.total, caption = "The Amount of Selection on Unobservables Relative to Selection on Observables
Required to Attribute the Entire Working from Home Effect to Selection Bias - Fathers",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )



# for presentation 
wfh.bias.table.fathers <- data.frame(cbind( empty.frame.total$X5, empty.frame.total$X6, empty.frame.total$X8), stringsAsFactors = FALSE)
wfh.bias.table.fathers$true.value.wfh <- wfh.bias.table.fathers$X2  - wfh.bias.table.fathers$X1

wfh.bias.table.fathers <- data.frame(cbind( empty.frame.total$X1, wfh.bias.table.fathers))

wfh.bias.table.fathers <- wfh.bias.table.fathers[,c(1,2, 3, 5,4)]



print(xtable(wfh.bias.table.fathers, caption = "The Amount of Selection on Unobservables Relative to Selection on Observables
             Required to Attribute the Entire Working from Home Effect to Selection Bias - Mothers",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )


