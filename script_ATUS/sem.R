
library(foreign)
write.dta(combine.data.complete.regress.female.employ, "C://Users//jkwok//Desktop//test.dta")


good~!!:http://ocw.mit.edu/courses/economics/14-381-statistical-method-in-economics-fall-2013/study-materials/MIT14_381F13_EcnomtrisInR.pdf



http://www.stata.com/statalist/archive/2004-01/msg00469.html

http://www.stata.com/statalist/archive/2012-08/msg01252.html
systemfit: A Package for Estimating Systems of Simultaneous Equations in R (P. 16)
install.packages("lme4")

library("lme4")



packageurl <- "https://cran.r-project.org/src/contrib/Archive/pbkrtest/pbkrtest_0.4-4.tar.gz"
install.packages(packageurl, repos=NULL, type="source")

install.packages("pbkrtest")

install.packages("systemfit")
install.packages("car")

install.packages("sem")


library("pbkrtest")


library("car")

library("systemfit")


eq1 <-   as.formula(paste0("total.job.wfh.time"," ~   total.job.time   + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var))

                
eq2 <-   as.formula(paste0("total.time.child"," ~   total.job.time +total.job.wfh.time   + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var))




eq1 <-   as.formula(total.job.wfh.time ~   total.job.time   + edited.occupations  )


eq2 <-   as.formula(total.time.child ~ total.job.wfh.time +  total.job.time   + edited.occupations)


                eqSystem <- list(first = eq1, second = eq2)
                fitols <- systemfit(eqSystem, data = combine.data.complete.regress.female.employ )
                print(fitols)
                

                
                
library("sem")
                
test <-   combine.data.complete.regress.female.employ[c("total.job.time", "total.job.wfh.time", "total.time.child", "edited.occupations")]       
                
ram.model <- specifyModel()
total.job.time -> total.job.wfh.time, beta, NA
total.job.wfh.time -> total.time.child , gamma, NA
edited.occupations -> total.job.wfh.time, beta2, NA
edited.occupations -> total.time.child, gamma2, NA
total.job.wfh.time <-> total.job.wfh.time, a, NA
edited.occupations <-> edited.occupations, d, NA
total.job.time <-> total.job.time, b, NA
total.time.child <-> total.time.child, c, NA

sem.wh.2 <- sem(ram.model, data =test)


                
install.packages("lavaan", dependencies = TRUE)

library(lavaan)





model <- '
# measurement model
ind60 =~ x1 + x2 + x3
dem60 =~ y1 + y2 + y3 + y4
dem65 =~ y5 + y6 + y7 + y8
# regressions
dem60 ~ ind60
dem65 ~ ind60 + dem60
# residual correlations
y1 ~~ y5
y2 ~~ y4 + y6
y3 ~~ y7
y4 ~~ y8
y6 ~~ y8
'
fit <- sem(model, data=PoliticalDemocracy)
summary(fit, standardized=TRUE)




lm(paste0(yvariables.v3[i]," ~   total.job.time2  ", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = combine.data.complete.regress.female.employ , weights = tufnwgtp )

######### test whether intercept is required
summary(lm( total.time.child ~total.job.time2, data = combine.data.complete.regress.female.employ ))

# 
t.model <- '
total.time.child ~ total.job.time2
# intercepts
total.time.child ~ 1
'
t.model2 <- '
total.time.child ~ total.job.time2
# intercepts
total.time.child ~ 1
'

summary(sem(t.model, data=combine.data.complete.regress.female.employ))

summary(sem(t.model2, data=combine.data.complete.regress.female.employ))


# t.model1 is the same as t.model2


t.model3 <- '
total.job.wfh.time2~   total.job.time2 
total.time.child ~ total.job.wfh.time2 + total.job.time2 

'

fit <- sem(t.model3, data=combine.data.complete.regress.female.employ)
summary(sem(t.model3, data=combine.data.complete.regress.female.employ))



# test variance and compare with stata.,  The same
# test fixing covariance. The same.
t.model3 <- '
total.job.wfh.time ~   total.job.time 
total.time.child ~ total.job.wfh.time + total.job.time
total.job.wfh.time ~~ 100*total.time.child
'
summary(sem(t.model3, data=combine.data.complete.regress.female.employ))
# stata code: sem (total_job_wfh_time <-   total_job_time ) (total_time_child <- total_job_wfh_time total_job_time  )


final.model <- '
total.job.wfh.time2 ~   total.job.time2 
total.time.child ~ total.job.wfh.time2 + total.job.time2
total.job.wfh.time2 ~~ 0.5*total.time.child
'



est.diff <- function(model.rho) {
final.model <- paste0("\ntotal.job.wfh.time2 ~   total.job.time2 \ntotal.time.child ~ total.job.wfh.time2 + total.job.time2\ntotal.job.wfh.time2 ~~ ",model.rho,"*total.time.child\n")
  

fit <- sem(final.model, data=combine.data.complete.regress.female.employ)

# get beta and gamma
temp.para <- parameterEstimates(fit)$est[which(parameterEstimates(fit)$rhs == "total.job.time2" & 
                                    parameterEstimates(fit)$op == "~")]

# get rho
temp.rho <- parameterEstimates(fit)$est[which(parameterEstimates(fit)$lhs == "total.job.wfh.time2" & 
                                              parameterEstimates(fit)$op == "~~" &
                                              parameterEstimates(fit)$rhs == "total.time.child")]


combine.data.complete.regress.female.employ$total.job.time2_beta <- combine.data.complete.regress.female.employ$total.job.time2*temp.para[1]
  
combine.data.complete.regress.female.employ$total.job.time2_gamma <- combine.data.complete.regress.female.employ$total.job.time2*temp.para[2]

  
fit2 <- lm(total.job.time2_beta ~ total.job.time2_gamma, data=combine.data.complete.regress.female.employ)



# compare rho and fit2 result
abs.diff <- abs(summary(fit2)$coefficients[2,1] ) - abs(temp.rho)
return(abs.diff)
}


rho <- 0
test.result <- 1
while (test.result >0.00001 | test.result < 0  ){
print(rho)
test.result <- est.diff(rho)
print(test.result)
rho = rho + 0.0001

}

  
  




