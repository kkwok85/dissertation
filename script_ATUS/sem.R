
#library(foreign)
#write.dta(combine.data.complete.regress.female.employ, "C://Users//jkwok//Desktop//test.dta")


#good~!!:http://ocw.mit.edu/courses/economics/14-381-statistical-method-in-economics-fall-2013/study-materials/MIT14_381F13_EcnomtrisInR.pdf



#http://www.stata.com/statalist/archive/2004-01/msg00469.html

#http://www.stata.com/statalist/archive/2012-08/msg01252.html
#systemfit: A Package for Estimating Systems of Simultaneous Equations in R (P. 16)
#install.packages("lme4")

#library("lme4")



#packageurl <- "https://cran.r-project.org/src/contrib/Archive/pbkrtest/pbkrtest_0.4-4.tar.gz"
#install.packages(packageurl, repos=NULL, type="source")

#install.packages("pbkrtest")

#install.packages("systemfit")
#install.packages("car")

#install.packages("sem")


#library("pbkrtest")


#library("car")

#library("systemfit")


#eq1 <-   as.formula(paste0("total.job.wfh.time"," ~   total.job.time   + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var))

                
#eq2 <-   as.formula(paste0("total.time.child"," ~   total.job.time +total.job.wfh.time   + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var))




#eq1 <-   as.formula(total.job.wfh.time ~   total.job.time   + edited.occupations  )


#eq2 <-   as.formula(total.time.child ~ total.job.wfh.time +  total.job.time   + edited.occupations)


#               eqSystem <- list(first = eq1, second = eq2)
#                fitols <- systemfit(eqSystem, data = combine.data.complete.regress.female.employ )
#                print(fitols)
                

                
                
#library("sem")
                
#test <-   combine.data.complete.regress.female.employ[c("total.job.time", "total.job.wfh.time", "total.time.child", "edited.occupations")]       
                
#ram.model <- specifyModel()
#total.job.time -> total.job.wfh.time, beta, NA
#total.job.wfh.time -> total.time.child , gamma, NA
#edited.occupations -> total.job.wfh.time, beta2, NA
#edited.occupations -> total.time.child, gamma2, NA
#total.job.wfh.time <-> total.job.wfh.time, a, NA
#edited.occupations <-> edited.occupations, d, NA
#total.job.time <-> total.job.time, b, NA
#total.time.child <-> total.time.child, c, NA

#sem.wh.2 <- sem(ram.model, data =test)


                
install.packages("lavaan")
library("lavaan")




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


# clean variables:

combine.data.complete.regress.female.employ.dum <- dummy.data.frame(combine.data.complete.regress.female.employ)


names(combine.data.complete.regress.female.employ.dum) <- make.names(names(combine.data.complete.regress.female.employ.dum), unique=TRUE)

combine.data.complete.regress.male.employ.dum <- dummy.data.frame(combine.data.complete.regress.male.employ)


names(combine.data.complete.regress.male.employ.dum) <- make.names(names(combine.data.complete.regress.male.employ.dum), unique=TRUE)




demographic.no.sex.var <- c("+ age + race.edit  +  marital.status.edit + school.level.completed.edit") 
demographic.var <- c("+ age + race.edit + sex + marital.status.edit + school.level.completed.edit ")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations  + total.other.job.time +  total.main.job.time + work.hours.last.week +factor(edited.employ.status)")
family.bus <- c("+ factor(household.own.bus) + factor(unpaid.work.family.bus)")
family.var <- c("+ num.children + num.family.member + age.youngest.child" )
time.var <- c("+ interview.year  + diary.day" )
location.var <- c("+ region + fips")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
earnings.var <- c("+ edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded)")
family.inc.var <- c("+ factor(edited.family.income3)" )
children.sick.var <- c("+ factor(children.sick.indicator)")




# + edited.occupationsManagement is taken away
occ.dum <- c( "+ edited.occupationsBusiness.and.financial.operations +  edited.occupationsComputer.and.mathematical.science  +  edited.occupationsArchitecture.and.engineering  +   edited.occupationsLife..physical..and.social.science  +  edited.occupationsCommunity.and.social.service   +  edited.occupationsLegal  +  edited.occupationsEducation..training..and.library  +  edited.occupationsArts..design..entertainment..sports..and.media +  edited.occupationsHealthcare.practitioner.and.technical + edited.occupationsHealthcare.support  +  edited.occupationsProtective.service  + edited.occupationsFood.preparation.and.serving.related  +   edited.occupationsBuilding.and.grounds.cleaning.and.maintenance + edited.occupationsPersonal.care.and.service + edited.occupationsSales.and.related  +  edited.occupationsOffice.and.administrative.support + edited.occupationsFarming..fishing..and.forestry +  edited.occupationsConstruction.and.extraction +   edited.occupationsInstallation..maintenance..and.repair + edited.occupationsProduction +  edited.occupationsTransportation.and.material.moving"  )

# race.edit5 is taken out
race.dum <- c(" + race.edit1 + race.edit2 + race.edit3 + race.edit4 ")
# marital.status.editNever.married
marital.status.dum <- c("+ marital.status.editMarried + marital.status.editDivorced..separated.or.widowed ")
# + school.level.completed.editLess.than.HS
school.level.dum <- c(" + school.level.completed.editHS + school.level.completed.editSome.college.Associate.Degree + school.level.completed.editCollege.or.above")
# + diary.dayMonday
diary.day.dum <- c(" + diary.dayTuesday + diary.dayWednesday + diary.dayThursday + diary.dayFriday") 
# + region1
region.dum <- c(" + region2 + region3 + region4")

# fips1
fips.dum <-  c(" +fips2 + fips4 + fips5 + fips6 + fips8 + fips9 + fips10 + fips11 + fips12 + fips13 + fips15 +fips16 + fips17 + fips18 + fips19 + fips20 + fips21 + fips22 +fips23 + fips24 + fips25 + fips26 + fips27+ fips28 +fips29 + fips30 + fips31 + fips32 + fips33 + fips34 + fips35 + fips36 + fips37 + fips38 + fips39 + fips40 + fips41 + fips42 + fips44 + fips45 + fips46 + fips47 + fips48 + fips49 +  fips50 + fips51 +  fips53 + fips54 + fips55 +  fips56 ")                                                            
                                                                     
# last one skipped
spouse.employ.status.dum <- c("+ spouse.employ.statusEmployed + spouse.employ.statusNot.Employed")
                                                                     
                                                                     
                                                                     
# white collar                                                      
combine.data.complete.regress.female.employ.dum$white.collar <- 0
combine.data.complete.regress.female.employ.dum$white.collar[which(combine.data.complete.regress.female.employ.dum$edited.occupationsManagement == 1 | 
                                                                   combine.data.complete.regress.female.employ.dum$edited.occupationsBusiness.and.financial.operations == 1 |
                                                                   combine.data.complete.regress.female.employ.dum$edited.occupationsComputer.and.mathematical.science == 1 |
                                                                   combine.data.complete.regress.female.employ.dum$edited.occupationsArchitecture.and.engineering == 1 |
                                                                   combine.data.complete.regress.female.employ.dum$edited.occupationsLife..physical..and.social.science == 1 | 
                                                                   combine.data.complete.regress.female.employ.dum$edited.occupationsLegal == 1 |
                                                                   combine.data.complete.regress.female.employ.dum$edited.occupationsEducation..training..and.library == 1 |
                                                                   combine.data.complete.regress.female.employ.dum$edited.occupationsHealthcare.practitioner.and.technical == 1 |
                                                                   combine.data.complete.regress.female.employ.dum$edited.occupationsHealthcare.support == 1 |
                                                                   combine.data.complete.regress.female.employ.dum$edited.occupationsOffice.and.administrative.support == 1)] <- 1




#edited.occupationsCommunity.and.social.service ??
#edited.occupationsArts..design..entertainment..sports..and.media

combine.data.complete.regress.female.employ.dum$blue.collar <- 0
combine.data.complete.regress.female.employ.dum$blue.collar[which(combine.data.complete.regress.female.employ.dum$edited.occupationsFarming..fishing..and.forestry == 1 |
                                                                    combine.data.complete.regress.female.employ.dum$edited.occupationsConstruction.and.extraction == 1 | 
                                                                    combine.data.complete.regress.female.employ.dum$edited.occupationsInstallation..maintenance..and.repair == 1 |
                                                                    combine.data.complete.regress.female.employ.dum$edited.occupationsProduction == 1 |
                                                                    combine.data.complete.regress.female.employ.dum$edited.occupationsTransportation.and.material.moving == 1 | 
                                                                    combine.data.complete.regress.female.employ.dum$edited.occupationsArts..design..entertainment..sports..and.media)] <- 1




combine.data.complete.regress.female.employ.dum$service <- 0
combine.data.complete.regress.female.employ.dum$service[which(combine.data.complete.regress.female.employ.dum$edited.occupationsProtective.service == 1 |
                                                              combine.data.complete.regress.female.employ.dum$edited.occupationsFood.preparation.and.serving.related == 1 |  
                                                              combine.data.complete.regress.female.employ.dum$edited.occupationsBuilding.and.grounds.cleaning.and.maintenance == 1 |
                                                              combine.data.complete.regress.female.employ.dum$edited.occupationsPersonal.care.and.service == 1 |
                                                              combine.data.complete.regress.female.employ.dum$edited.occupationsSales.and.related == 1 |
                                                              combine.data.complete.regress.female.employ.dum$edited.occupationsCommunity.and.social.service == 1 )] <- 1


# edited.occupationsNot.employed <- skipped



 
combine.data.complete.regress.female.employ.dum$household.own.bus[which(combine.data.complete.regress.female.employ.dum$household.own.bus == 1)] <- 0
combine.data.complete.regress.female.employ.dum$household.own.bus[which(combine.data.complete.regress.female.employ.dum$household.own.bus == 2)] <- 1




combine.data.complete.regress.female.employ.dum$unpaid.work.family.bus[which(combine.data.complete.regress.female.employ.dum$unpaid.work.family.bus == 1)] <- 0
combine.data.complete.regress.female.employ.dum$unpaid.work.family.bus[which(combine.data.complete.regress.female.employ.dum$unpaid.work.family.bus == 2)] <- 1



combine.data.complete.regress.female.employ.dum$interview.year.dum <- 0
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2003")] <- 1
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2004")] <- 2
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2005")] <- 3
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2006")] <- 4
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2007")] <- 5
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2008")] <- 6
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2009")] <- 7
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2010")] <- 8
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2011")] <- 9
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2012")] <- 10
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2013")] <- 11
combine.data.complete.regress.female.employ.dum$interview.year.dum[which(combine.data.complete.regress.female.employ.dum$interview.year == "2014")] <- 12




combine.data.complete.regress.female.employ.dum$age.youngest.child.dum <- 0
combine.data.complete.regress.female.employ.dum$age.youngest.child.dum[which(combine.data.complete.regress.female.employ.dum$age.youngest.child < 5)] <- 1








skip first, might have problem
occ.dum # fixed

marital.status.dum # marital.status.editMarried  <--- very trouble , dump it first
family.var <--age.youngest.child  # fixed

race.dum # dump it first

school.level.completed.edit # only college level included

diary.day.dum # only friday included
fips.dum  # dump it
spouse.employ.status.dum <- use edited.spouse.work.hours

 
+ weekly.earning.top.coded
+edited.weekly.earnings.indicator

# taken away 
+ household.own.bus + unpaid.work.family.bus

+edited.work.hours.indicator

+ edit.spouse.presenceSpouse.present
+ blue.collar+ service
spouse.employ.statusNot.Employed


race.edit1 taken away

controls <- paste0(" total.job.time2 +  work.hours.last.week + edited.work.hours + treatment + age  + num.children + num.family.member +age.youngest.child + interview.year.dum  + edited.spouse.work.hours + edited.weekly.earnings + children.sick.indicator +  white.collar  + school.level.completed.editCollege.or.above + diary.dayFriday ")
final.model <- paste0("\ntotal.job.wfh.time2 ~  ", controls ," \ntotal.time.child ~ total.job.wfh.time2 +", controls ," \ntotal.job.wfh.time2 ~~ 0.3*total.time.child\n")


fit1 <- sem(final.model, data=combine.data.complete.regress.female.employ.dum[])









#test ***must mulitple a number before  total.time.child. otherwise not identified.
final.model <- '
total.job.wfh.time2 ~   total.job.time2 +  work.hours.last.week + edited.work.hours+edited.work.hours.indicator + treatment + age + household.own.bus + unpaid.work.family.bus  + race.edit1 + race.edit2 + race.edit3 + race.edit4 + school.level.completed.editHS + school.level.completed.editSome.college.Associate.Degree + school.level.completed.editCollege.or.above + num.children + num.family.member +  edited.weekly.earnings  +  edited.weekly.earnings
total.time.child ~ total.job.wfh.time2 + total.job.time2 +  work.hours.last.week + edited.work.hours+edited.work.hours.indicator + treatment + age + household.own.bus + unpaid.work.family.bus   + race.edit1 + race.edit2 + race.edit3 + race.edit4 + school.level.completed.editHS + school.level.completed.editSome.college.Associate.Degree + school.level.completed.editCollege.or.above + num.children + num.family.member +  edited.weekly.earnings  +  edited.weekly.earnings
total.job.wfh.time2 ~~ 0.5*total.time.child
'
fit2 <- sem(final.model, data=combine.data.complete.regress.female.employ.dum)

#test ***must mulitple a number before  total.time.child. otherwise not identified.




# works!!!
final.model <- '
total.job.wfh.time2 ~    b1*total.job.time2 +  work.hours.last.week + edited.work.hours+edited.work.hours.indicator + treatment + age + household.own.bus + unpaid.work.family.bus  + race.edit1 + race.edit2 + race.edit3 + race.edit4 + school.level.completed.editHS + school.level.completed.editSome.college.Associate.Degree + school.level.completed.editCollege.or.above + num.children + num.family.member +  edited.weekly.earnings
total.time.child ~ b2*total.job.wfh.time2 + total.job.time2 +  work.hours.last.week + edited.work.hours+edited.work.hours.indicator + treatment + age + household.own.bus + unpaid.work.family.bus   + race.edit1 + race.edit2 + race.edit3 + race.edit4 + school.level.completed.editHS + school.level.completed.editSome.college.Associate.Degree + school.level.completed.editCollege.or.above + num.children + num.family.member +  edited.weekly.earnings
total.job.wfh.time2 ~~ rho*total.time.child
rho == b1*b2

'
fit2 <- sem(final.model, data=combine.data.complete.regress.female.employ.dum)





controls <- paste0(" total.job.time2 +  work.hours.last.week + edited.work.hours + treatment + age  + num.children + num.family.member +age.youngest.child + interview.year.dum  + edited.spouse.work.hours + edited.weekly.earnings + children.sick.indicator +  white.collar  + school.level.completed.editCollege.or.above + diary.dayFriday + race.edit1")
final.model <- paste0("\ntotal.job.wfh.time2 ~  ", controls ," \ntotal.time.child ~ total.job.wfh.time2 +", controls ," \ntotal.job.wfh.time2 ~~ -0.0002922*total.time.child\n")


fit <- sem(final.model, data=combine.data.complete.regress.female.employ.dum)

controls <- paste0(" total.job.time2 +  work.hours.last.week + edited.work.hours + treatment + age  + num.children + num.family.member +age.youngest.child + interview.year.dum  + edited.spouse.work.hours + edited.weekly.earnings + children.sick.indicator +  white.collar  + school.level.completed.editCollege.or.above + diary.dayFriday + race.edit1")
final.model <- paste0("\ntotal.job.wfh.time2 ~  ", controls ," \ntotal.time.child ~ total.job.wfh.time2 +", controls ," \ntotal.job.wfh.time2 ~~ 0.3*total.time.child\n")


fit <- sem(final.model, data=combine.data.complete.regress.female.employ.dum)


+ race.edit1 is taken out

model.rho <- 0.3

est.diff <- function(model.rho) {
  
  controls <- paste0(" total.job.time2 +  work.hours.last.week + edited.work.hours + treatment + age  + num.children + num.family.member +age.youngest.child + interview.year.dum  + edited.spouse.work.hours + edited.weekly.earnings + children.sick.indicator +  white.collar  + school.level.completed.editCollege.or.above + diary.dayFriday ")
  final.model <- paste0("\ntotal.job.wfh.time2 ~  ", controls ," \ntotal.time.child ~ total.job.wfh.time2 +", controls ," \ntotal.job.wfh.time2 ~~ ",model.rho,"*total.time.child\n")
  
  
  fit <- sem(final.model, data=combine.data.complete.regress.female.employ.dum)
  
  

# get beta and gamma
temp.para.beta <- parameterEstimates(fit)$est[which(parameterEstimates(fit)$lhs == "total.job.wfh.time2" & 
                                    parameterEstimates(fit)$op == "~")]


n.para <- length(parameterEstimates(fit)$est[which(parameterEstimates(fit)$lhs == "total.time.child" &  parameterEstimates(fit)$op == "~")])
                                                                                

temp.para.gamma <- parameterEstimates(fit)$est[which(parameterEstimates(fit)$lhs == "total.time.child" & 
                                                      parameterEstimates(fit)$op == "~")][2:n.para]

# get rho   # this is the same as model.rho
temp.rho <- parameterEstimates(fit)$est[which(parameterEstimates(fit)$lhs == "total.job.wfh.time2" & 
                                              parameterEstimates(fit)$op == "~~" &
                                              parameterEstimates(fit)$rhs == "total.time.child")]




combine.data.complete.regress.female.employ.dum$X_beta <- combine.data.complete.regress.female.employ.dum$total.job.time2*temp.para.beta[1] +
  combine.data.complete.regress.female.employ.dum$work.hours.last.week*temp.para.beta[2] + 
  combine.data.complete.regress.female.employ.dum$edited.work.hours*temp.para.beta[3] + 
  combine.data.complete.regress.female.employ.dum$treatment*temp.para.beta[4] + 
  combine.data.complete.regress.female.employ.dum$age*temp.para.beta[5] + 
  combine.data.complete.regress.female.employ.dum$num.children*temp.para.beta[6] + 
  combine.data.complete.regress.female.employ.dum$num.family.member*temp.para.beta[7] + 
  combine.data.complete.regress.female.employ.dum$age.youngest.child*temp.para.beta[8] + 
  combine.data.complete.regress.female.employ.dum$interview.year.dum*temp.para.beta[9] + 
  combine.data.complete.regress.female.employ.dum$edited.spouse.work.hours*temp.para.beta[10] + 
  combine.data.complete.regress.female.employ.dum$edited.weekly.earnings*temp.para.beta[11] + 
  combine.data.complete.regress.female.employ.dum$children.sick.indicator*temp.para.beta[12] + 
  combine.data.complete.regress.female.employ.dum$white.collar*temp.para.beta[13] + 
  combine.data.complete.regress.female.employ.dum$school.level.completed.editCollege.or.above*temp.para.beta[14] + 
  combine.data.complete.regress.female.employ.dum$diary.dayFriday*temp.para.beta[15]  
  #combine.data.complete.regress.female.employ.dum$race.edit1*temp.para.beta[16] 





combine.data.complete.regress.female.employ.dum$X_gama <- combine.data.complete.regress.female.employ.dum$total.job.time2*temp.para.gamma[1] +
  combine.data.complete.regress.female.employ.dum$work.hours.last.week*temp.para.gamma[2] + 
  combine.data.complete.regress.female.employ.dum$edited.work.hours*temp.para.gamma[3] + 
  combine.data.complete.regress.female.employ.dum$treatment*temp.para.gamma[4] + 
  combine.data.complete.regress.female.employ.dum$age*temp.para.gamma[5] + 
  combine.data.complete.regress.female.employ.dum$num.children*temp.para.gamma[6] + 
  combine.data.complete.regress.female.employ.dum$num.family.member*temp.para.gamma[7] + 
  combine.data.complete.regress.female.employ.dum$age.youngest.child*temp.para.gamma[8] + 
  combine.data.complete.regress.female.employ.dum$interview.year.dum*temp.para.gamma[9] + 
  combine.data.complete.regress.female.employ.dum$edited.spouse.work.hours*temp.para.gamma[10] + 
  combine.data.complete.regress.female.employ.dum$edited.weekly.earnings*temp.para.gamma[11] + 
  combine.data.complete.regress.female.employ.dum$children.sick.indicator*temp.para.gamma[12] + 
  combine.data.complete.regress.female.employ.dum$white.collar*temp.para.gamma[13] + 
  combine.data.complete.regress.female.employ.dum$school.level.completed.editCollege.or.above*temp.para.gamma[14] + 
  combine.data.complete.regress.female.employ.dum$diary.dayFriday*temp.para.gamma[15] 
  #combine.data.complete.regress.female.employ.dum$race.edit1*temp.para.gamma[16] 


  combine.data.complete.regress.female.employ.dum$X_gama[which(combine.data.complete.regress.female.employ.dum$X_gama < 0)] <- 0  
  combine.data.complete.regress.female.employ.dum$X_beta[which(combine.data.complete.regress.female.employ.dum$X_beta < 0) ] <- 0

result <- array(0,2)  
fit2 <- lm(X_beta ~ X_gama, data=combine.data.complete.regress.female.employ.dum)


result[1] <- summary(fit2)$coefficients[2,1]
# compare rho and fit2 result
abs.diff <- abs(summary(fit2)$coefficients[2,1] ) - abs(temp.rho)
result[2] <- abs.diff 

return(result)
}


rho <- -0.000001
test.result <- 1
while (test.result >0.00001 | test.result < 0  ){
print(rho)
test.result <- est.diff(rho)
print(test.result)
rho = rho -0.00001

}




# race is taken out

controls <- paste0(" total.job.time2 +  work.hours.last.week + edited.work.hours + treatment + age  + num.children + num.family.member +age.youngest.child + interview.year.dum  + edited.spouse.work.hours + edited.weekly.earnings + children.sick.indicator +  white.collar  + school.level.completed.editCollege.or.above + diary.dayFriday ")
final.model <- paste0("\ntotal.job.wfh.time2 ~  ", controls ," \ntotal.time.child ~ total.job.wfh.time2 +", controls ," \ntotal.job.wfh.time2 ~~ -0.000292*total.time.child\n")


fit <- sem(final.model, data=combine.data.complete.regress.female.employ.dum)





# around -0.000292




























est.diff <- function(model.rho) {
  
  controls <- paste0(" total.job.time2 +  work.hours.last.week + edited.work.hours + treatment + age  + num.children + num.family.member +age.youngest.child + interview.year.dum  + edited.spouse.work.hours + edited.weekly.earnings + children.sick.indicator +  white.collar  + school.level.completed.editCollege.or.above + diary.dayFriday + race.edit1")
  final.model <- paste0("\ntotal.job.wfh.time2 ~  ", controls ," \ntotal.time.child.prim.sec ~ total.job.wfh.time2 +", controls ," \ntotal.job.wfh.time2 ~~ ",model.rho,"*total.time.child.prim.sec\n")
  
  
  fit <- sem(final.model, data=combine.data.complete.regress.female.employ.dum[which(combine.data.complete.regress.female.employ$age.youngest.child < 13),])
  
  
  
  # get beta and gamma
  temp.para.beta <- parameterEstimates(fit)$est[which(parameterEstimates(fit)$lhs == "total.job.wfh.time2" & 
                                                        parameterEstimates(fit)$op == "~")]
  
  
  n.para <- length(parameterEstimates(fit)$est[which(parameterEstimates(fit)$lhs == "total.time.child.prim.sec" &  parameterEstimates(fit)$op == "~")])
  
  
  temp.para.gamma <- parameterEstimates(fit)$est[which(parameterEstimates(fit)$lhs == "total.time.child.prim.sec" & 
                                                         parameterEstimates(fit)$op == "~")][2:n.para]
  
  # get rho   # this is the same as model.rho
  temp.rho <- parameterEstimates(fit)$est[which(parameterEstimates(fit)$lhs == "total.job.wfh.time2" & 
                                                  parameterEstimates(fit)$op == "~~" &
                                                  parameterEstimates(fit)$rhs == "total.time.child.prim.sec")]
  
  
  
  
  combine.data.complete.regress.female.employ.dum$X_beta <- combine.data.complete.regress.female.employ.dum$total.job.time2*temp.para.beta[1] +
    combine.data.complete.regress.female.employ.dum$work.hours.last.week*temp.para.beta[2] + 
    combine.data.complete.regress.female.employ.dum$edited.work.hours*temp.para.beta[3] + 
    combine.data.complete.regress.female.employ.dum$treatment*temp.para.beta[4] + 
    combine.data.complete.regress.female.employ.dum$age*temp.para.beta[5] + 
    combine.data.complete.regress.female.employ.dum$num.children*temp.para.beta[6] + 
    combine.data.complete.regress.female.employ.dum$num.family.member*temp.para.beta[7] + 
    combine.data.complete.regress.female.employ.dum$age.youngest.child*temp.para.beta[8] + 
    combine.data.complete.regress.female.employ.dum$interview.year.dum*temp.para.beta[9] + 
    combine.data.complete.regress.female.employ.dum$edited.spouse.work.hours*temp.para.beta[10] + 
    combine.data.complete.regress.female.employ.dum$edited.weekly.earnings*temp.para.beta[11] + 
    combine.data.complete.regress.female.employ.dum$children.sick.indicator*temp.para.beta[12] + 
    combine.data.complete.regress.female.employ.dum$white.collar*temp.para.beta[13] + 
    combine.data.complete.regress.female.employ.dum$school.level.completed.editCollege.or.above*temp.para.beta[14] + 
    combine.data.complete.regress.female.employ.dum$diary.dayFriday*temp.para.beta[15] + 
    combine.data.complete.regress.female.employ.dum$race.edit1*temp.para.beta[16] 
  
  
  
  
  
  combine.data.complete.regress.female.employ.dum$X_gama <- combine.data.complete.regress.female.employ.dum$total.job.time2*temp.para.gamma[1] +
    combine.data.complete.regress.female.employ.dum$work.hours.last.week*temp.para.gamma[2] + 
    combine.data.complete.regress.female.employ.dum$edited.work.hours*temp.para.gamma[3] + 
    combine.data.complete.regress.female.employ.dum$treatment*temp.para.gamma[4] + 
    combine.data.complete.regress.female.employ.dum$age*temp.para.gamma[5] + 
    combine.data.complete.regress.female.employ.dum$num.children*temp.para.gamma[6] + 
    combine.data.complete.regress.female.employ.dum$num.family.member*temp.para.gamma[7] + 
    combine.data.complete.regress.female.employ.dum$age.youngest.child*temp.para.gamma[8] + 
    combine.data.complete.regress.female.employ.dum$interview.year.dum*temp.para.gamma[9] + 
    combine.data.complete.regress.female.employ.dum$edited.spouse.work.hours*temp.para.gamma[10] + 
    combine.data.complete.regress.female.employ.dum$edited.weekly.earnings*temp.para.gamma[11] + 
    combine.data.complete.regress.female.employ.dum$children.sick.indicator*temp.para.gamma[12] + 
    combine.data.complete.regress.female.employ.dum$white.collar*temp.para.gamma[13] + 
    combine.data.complete.regress.female.employ.dum$school.level.completed.editCollege.or.above*temp.para.gamma[14] + 
    combine.data.complete.regress.female.employ.dum$diary.dayFriday*temp.para.gamma[15] + 
    combine.data.complete.regress.female.employ.dum$race.edit1*temp.para.gamma[16] 
  
  
  
  result <- array(0,2)  
  fit2 <- lm(X_beta ~ X_gama, data=combine.data.complete.regress.female.employ.dum[which(combine.data.complete.regress.female.employ$age.youngest.child < 13),])
  
  
  result[1] <- summary(fit2)$coefficients[2,1]
  # compare rho and fit2 result
  abs.diff <- abs(summary(fit2)$coefficients[2,1] ) - abs(temp.rho)
  result[2] <- abs.diff 
  
  return(result)
}


rho <- -0.000001
test.result <- 1
while (test.result >0.00001 | test.result < 0  ){
  print(rho)
  test.result <- est.diff(rho)
  print(test.result)
  rho = rho -0.00001
  
}



total.time.child.prim.sec

between -0.000191 and -0.000201 








