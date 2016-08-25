



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

combine.data.complete.regress.female.employ$wfh.v5 <- combine.data.complete.regress.female.employ$wfh.v3

combine.data.complete.regress.female.employ$wfh.v5[which(combine.data.complete.regress.female.employ$wfh.v3 == 2)] <- 1 



combine.data.complete.regress.female.employ.temp <- combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$wfh.v3 <=1 ),]


r <- c(0)
R <- rep(0, 84)
R[3] <- 1
d <- c(0)




t <- rls(paste0("total.time.child  ~   total.job.time2  + wfh.v4  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + interview.year  + factor(diary.day) +region + edit.spouse.presence + edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)  ", demographic.no.sex.var, family.bus, family.var, earnings.var, family.inc.var,  children.sick.var) , r, R, d, data = combine.data.complete.regress.female.employ)     

  
t <- rls(paste0("total.time.child  ~   total.job.time2  + wfh.v4  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment) + interview.year  + factor(diary.day) +region + edit.spouse.presence + edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)  ", demographic.no.sex.var, family.bus, family.var, earnings.var, family.inc.var,  children.sick.var) , r, R, d, data = combine.data.complete.regress.female.employ)     

t1 <- as.data.frame(t)

t2 <- as.matrix(t1[,1])


# total time child 

result <- lm(paste0("total.time.child" ," ~   total.job.time2  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ.temp , weights = tufnwgtp )


combine.data.complete.regress.female.employ.temp$predicted.yhat <- predict(result, newdata = combine.data.complete.regress.female.employ.temp) 






a <- weighted.mean(combine.data.complete.regress.female.employ.temp$predicted.yhat[which(combine.data.complete.regress.female.employ.temp$wfh.v3 == 1)], combine.data.complete$tufnwgtp[which(combine.data.complete.regress.female.employ.temp$wfh.v3 == 1)] , na.rm=TRUE)

b <- weighted.mean(combine.data.complete.regress.female.employ.temp$predicted.yhat[which(combine.data.complete.regress.female.employ.temp$wfh.v3 == 0)], combine.data.complete$tufnwgtp[which(combine.data.complete.regress.female.employ.temp$wfh.v3 == 0)] , na.rm=TRUE)





 (a - b) /var(combine.data.complete.regress.female.employ.temp$predicted.yhat, na.rm = TRUE)



result2 <- lm(paste0("wfh.v3" ," ~   total.job.time2  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ.temp , weights = tufnwgtp )

combine.data.complete.regress.female.employ.temp$residual.wfh <- resid(result2)



variance.ratio <- var(combine.data.complete.regress.female.employ.temp$wfh.v3, na.rm = TRUE)/var(resid(result2), na.rm=TRUE)

col4 <- (a - b)*variance.ratio



col6 <-  21.883410/ ((a - b)*variance.ratio)










combine.data.complete.regress.female.employ.temp.under13 <- combine.data.complete.regress.female.employ.temp[which(combine.data.complete.regress.female.employ.temp$age.youngest.child < 13 & combine.data.complete.regress.female.employ.temp$interview.year != "2003"),]



# total time child 

result <- lm(paste0("total.time.child.prim.sec" ," ~   total.job.time2  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ.temp.under13 , weights = tufnwgtp )


combine.data.complete.regress.female.employ.temp.under13$predicted.yhat <- predict(result, newdata = combine.data.complete.regress.female.employ.temp.under13) 






a <- weighted.mean(combine.data.complete.regress.female.employ.temp.under13$predicted.yhat[which(combine.data.complete.regress.female.employ.temp.under13$wfh.v3 == 1)], combine.data.complete$tufnwgtp[which(combine.data.complete.regress.female.employ.temp.under13$wfh.v3 == 1)] , na.rm=TRUE)

b <- weighted.mean(combine.data.complete.regress.female.employ.temp.under13$predicted.yhat[which(combine.data.complete.regress.female.employ.temp.under13$wfh.v3 == 0)], combine.data.complete$tufnwgtp[which(combine.data.complete.regress.female.employ.temp.under13$wfh.v3 == 0)] , na.rm=TRUE)





(a - b) /var(combine.data.complete.regress.female.employ.temp.under13$predicted.yhat, na.rm = TRUE)



result2 <- lm(paste0("wfh.v3" ," ~   total.job.time2  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ.temp.under13 , weights = tufnwgtp )




variance.ratio <- var(combine.data.complete.regress.female.employ.temp.under13$wfh.v3, na.rm = TRUE)/var(resid(result2), na.rm=TRUE)

col4 <- (a - b)*variance.ratio



col6 <-  177.983249/ ((a - b)*variance.ratio)

























