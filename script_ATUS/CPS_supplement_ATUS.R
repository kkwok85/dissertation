install.packages("foreign")


library(foreign)
library(plyr)
library(dplyr)


cps.supplement <- read.dta( "D:/CPS_supplement/ICPSR_04346/DS0001/04346-0001-Data.dta")

names(cps.supplement)  <- tolower(names(cps.supplement))

cps.supplement$hrhhid <- as.numeric(cps.supplement$hrhhid)
cps.supplement$hrhhid2 <- as.integer(cps.supplement$hrhhid2)
cps.supplement$pulineno <- as.integer(cps.supplement$pulineno)



cps.supplement.atus <- join( cps.supplement, atuscps , by=c("hrhhid", "hrhhid2","pulineno") , type = "inner")



#cps.supplement.atus.atussum <- join(cps.supplement.atus, combine.data , by=c("tucaseid") , type = "inner")



cps.supplement.atus.atussum  <- join(cps.supplement.atus, combine.data,  by=c("tucaseid","tulineno"), type = "inner")

cps.supplement.atus.atussum.pesmj5 <- 
  cps.supplement.atus.atussum[which( cps.supplement.atus.atussum$pesmj5 == "Yes" | cps.supplement.atus.atussum$pesmj5 == "No"),]


presence.own.child


%+factor(employment.status)

demographic.var <- c("+ age + race + sex + marital.status ")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations  + total.other.job.time +  total.main.job.time + work.hours.last.week ")
current.sit <- c("+ factor(current.situation)   + factor(enrolled.school) ") 
family.bus <- c("+ factor(household.own.bus) + factor(unpaid.work.family.bus)")
family.var <- c("+ num.children + num.family.member + age.youngest.child" )
time.var <- c("+ interview.year  + diary.day" )
location.var <- c("+ region + fips")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
family.inc.var <- c("+ edited.family.income2 + factor(edited.family.income2.indicator) + edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) " )
childcare.service.var <- c("+ use.paid.childcare + wait.to.meet.childcare + childcare.other + travel.use.childcare + phone.call.care.provider")
children.sick.var <- c("+ provide.medical.care.hh.children + obtain.medical.care.hh.children + wait.child.health + child.health.other")



full.model <- lm(paste0(yvariables.v2[1]," ~ pesmj5", demographic.var,employ.var, current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var,children.sick.var  ), data = cps.supplement.atus.atussum.pesmj5, weights = tufnwgtp )



lm(paste0(yvariables.v2[1]," ~ pesmj5 + edited.spouse.work.hours+ + factor(edited.spouse.work.hours.indicator)+ edited.family.income2 + factor(edited.family.income2.indicator)  ", 
          demographic.var,employ.var, current.sit, time.var, location.var, childcare.service.var,children.sick.var  ), data = cps.supplement.atus.atussum.pesmj5, weights = tufnwgtp )



%# <- within(DF, b <- relevel(b, ref = 3))


result <- list()
robust.result <- list()
#length(yvariables.v2)

for (i in 1:length(yvariables.v2) ) {
  dep.var <- yvariables.v2[i]
  full.model <- lm(paste0(yvariables.v2[i]," ~ pesmj5 + edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)+ edited.family.income2 + factor(edited.family.income2.indicator)  ", 
              demographic.var,employ.var, current.sit, time.var, location.var, childcare.service.var,children.sick.var  ), data = cps.supplement.atus.atussum.pesmj5[which(cps.supplement.atus.atussum.pesmj5$presence.own.child == 1),] , weights = tufnwgtp )
  
  result[[i]] <- full.model
  robust.result[[i]] <- sqrt(diag(vcovHC(full.model, type = "HC1"))) 
}



stargazer(result[[1]], result[[2]],result[[3]], result[[4]], result[[5]], result[[6]], result[[7]], result[[8]], result[[9]], result[[10]], result[[11]], result[[12]],
          result[[13]], result[[14]],
           se = list(robust.result[[1]], robust.result[[2]],robust.result[[3]], robust.result[[4]], robust.result[[5]], robust.result[[6]], robust.result[[7]],
                     robust.result[[8]], robust.result[[9]], robust.result[[10]], robust.result[[11]], robust.result[[12]], robust.result[[13]], robust.result[[14]]),
          column.labels=c(names.y[1] ,names.y[2], names.y[3], names.y[4], names.y[5], names.y[6], names.y[7], names.y[8], names.y[9], names.y[10], names.y[11], names.y[12], names.y[13], names.y[14]), 
           covariate.labels =c("Flexible schedule"), out = "D:/test.txt",
          notes.align = "l")


