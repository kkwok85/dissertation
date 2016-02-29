library(plyr)

#### summary statistics #### 


install.packages("dummies")
library(dummies)

stargazer(combine.data.regress[yvariables], type="latex", digits=3, title = "Summary Statistics for dependent variables",
          covariate.labels = c("Total time for caring and helping children",
                               "Grocery shopping", "Food and drink preparation", "Purchasing food",
                               "Play with children", "Play sports with children", 
                               "Provide medical care to children", "Obtain medical care for children",
                               "Reading to children", "Talk and listen to children",
                               "organization and plan for children", "Help homework for children",
                               "Home schooling", "Supervising children"
          ), out = "D:/ATUS_result_R/sum_stat_dep_var.tex" )




stargazer(combine.data.regress[yvariables], digits=3, title = "Summary Statistics for dependent variables",
          covariate.labels = c("Total time for caring and helping children",
                               "Grocery shopping", "Food and drink preparation", "Purchasing food",
                               "Play with children", "Play sports with children", 
                               "Provide medical care to children", "Obtain medical care for children",
                               "Reading to children", "Talk and listen to children",
                               "organization and plan for children", "Help homework for children",
                               "Home schooling", "Supervising children"
          ), out = "D:/ATUS_result_R/sum_stat_trial.txt" )



xvariables <- c("weekly.earnings")

combine.data.regress.v2$wfh.v3.num<- as.numeric(as.character(combine.data.regress.v2$wfh.v3))



combine.data.regress.v2.dum <- dummy.data.frame(combine.data.regress.v2)

a <- weighted.mean(combine.data.regress.v2$weekly.earnings, combine.data.regress.v2$tufnwgtp, na.rm=TRUE)

stargazer(combine.data.regress.v2[xvariables[1]] , digits=3, title = "Summary Statistics for dependent variables"
          ,  out = "D:/ATUS_result_R/sum_stat_trial.txt")   




# table(combine.data.regress$wfh_mom.v2, combine.data.regress$occupations) <- 2 way table





# sum stat for variable of interest
# check sum stat later again




wfh_mom.v2.sum.stat <- as.data.frame(table(combine.data.regress$wfh_mom.v2), stringsAsFactors=FALSE)
wfh_mom.v2.sum.stat$percentage <- wfh_mom.v2.sum.stat$Freq/sum(wfh_mom.v2.sum.stat$Freq)
colnames(wfh_mom.v2.sum.stat) <- c("Category", "Frequency", "Percentage of sample")
wfh_mom.v2.sum.stat$"Work from home indicator" <- c("")
wfh_mom.v2.sum.stat$"Work from home indicator"[1] <- "version 2"
wfh_mom.v2.sum.stat <- wfh_mom.v2.sum.stat[c("Work from home indicator", "Category", "Frequency", "Percentage of sample")]




wfh_mom.sum.stat <- as.data.frame(table(combine.data.regress$wfh_mom), stringsAsFactors=FALSE)
wfh_mom.sum.stat$percentage <- wfh_mom.sum.stat$Freq/sum(wfh_mom.sum.stat$Freq)
colnames(wfh_mom.sum.stat) <- c("Category", "Frequency", "Percentage of sample")
wfh_mom.sum.stat$"Work from home indicator" <- c("")
wfh_mom.sum.stat$"Work from home indicator"[1] <- "version 1"
wfh_mom.sum.stat <- wfh_mom.sum.stat[c("Work from home indicator", "Category", "Frequency", "Percentage of sample")]



# combine the table
var.interest <- rbind(wfh_mom.sum.stat, wfh_mom.v2.sum.stat  )


var.interest <- xtable(var.interest, caption = "Summary Statistics for the variable of interest" )
# this print is for xtable
print(var.interest, type="latex", include.rownames = FALSE, file = "D:/ATUS_result_R/sum_stat_var_interest.tex")








# sum stat for continuous control 
# check sum stat later again
stargazer(combine.data.regress[c("age", "work.hours", "num.children", "num.family.member", "spouse.work.hours",
                                 "use.paid.childcare", "wait.to.meet.childcare")], type="latex", digits=3,
          title = "Summary Statistics for covariates (continuous variables)",
          covariate.labels = c("Age", "Total work hours per week if employed", "Number of children", "Number of family members", "Spouse work hours per week if spouse is presence and employed",
                               "Minutes spent on paid childcare services", "Minutes spent on waiting associated with paid childcare services"
          ), out = "D:/ATUS_result_R/sum_stat_continuous_control.tex" )














# sum stat for category variables
# check sum stat later again



cat.var.sum.stat <- lapply(combine.data.regress[c("race",
                                                  "marital.status",
                                                  "occupations",
                                                  "interview.year",
                                                  "holiday.indicator",
                                                  "diary.day",
                                                  "spouse.presence.hh",
                                                  "spouse.employ.status",
                                                  "full.part.time.spouse",
                                                  "family.income"
)], as.data.frame(table, stringsAsFactors=FALSE) )





# diu!!

rename.t <- function(x) {
  
  colnames(x) <- c( "Category", "Frequency")
  x$Percentage <- x$Frequency/sum(x$Frequency)
  print(x)
  
}




table.race <- rename.t(cat.var.sum.stat$race)
table.race$name <- c("")
table.race$name[1] <- "Race"


table.marital.status <- rename.t(cat.var.sum.stat$marital.status)
table.marital.status$name <- c("")
table.marital.status$name[1] <- "marital.status"


table.occupations <- rename.t(cat.var.sum.stat$occupations)
table.occupations$name <- c("")
table.occupations$name[1] <- "occupations"

table.interview.year <- rename.t(cat.var.sum.stat$interview.year)
table.interview.year$name <- c("")
table.interview.year$name[1] <- "interview.year"


table.holiday.indicator <- rename.t(cat.var.sum.stat$holiday.indicator)
table.holiday.indicator$name <- c("")
table.holiday.indicator$name[1] <- "holiday.indicator"


table.diary.day <- rename.t(cat.var.sum.stat$diary.day)
table.diary.day$name <- c("")
table.diary.day$name[1] <- "diary.day"



table.spouse.presence.hh <- rename.t(cat.var.sum.stat$spouse.presence.hh)
table.spouse.presence.hh$name <- c("")
table.spouse.presence.hh$name[1] <- "spouse.presence.hh"


table.spouse.employ.status <- rename.t(cat.var.sum.stat$spouse.employ.status)
table.spouse.employ.status$name <- c("")
table.spouse.employ.status$name[1] <- "spouse.employ.status"

table.full.part.time.spouse <- rename.t(cat.var.sum.stat$full.part.time.spouse)
table.full.part.time.spouse$name <- c("")
table.full.part.time.spouse$name[1] <- "full.part.time.spouse"

table.family.income <- rename.t(cat.var.sum.stat$family.income)
table.family.income$name <- c("")
table.family.income$name[1] <- "family.income"





cat.var <- rbind(table.race,table.marital.status, table.occupations, table.interview.year, table.holiday.indicator, 
                 table.diary.day, table.spouse.presence.hh, table.spouse.employ.status, table.full.part.time.spouse, 
                 table.family.income )




cat.var <- cat.var[c("name","Category", "Frequency", "Percentage")] 


# drop certain race

cat.var <- cat.var[c(1:2,4, 23:97),]
cat.var$Category <- revalue(cat.var$Category, c("1"="White", "2"="Black", "4"="Asian"))
#add one more
#cat.var[5,]



colnames(cat.var) <- c("Variables","Category", "Frequency", "Percentage")


cat.var <- xtable(cat.var, caption = "Summary Statistics for the categorical control variables")
# this print is for xtable
print(cat.var, type = "latex" , include.rownames = FALSE, file = "D:/ATUS_result_R/sum_stat_cat_var.tex")






valid.names <- make.names(names=names(combine.data.regress.v2), unique=TRUE, allow_ = TRUE)
names(combine.data.regress.v2) <- valid.names


grp <- group_by(combine.data.regress.v2, sex)

summarise(grp, mean = svymean( ~total.time.child , z ))


summarise(grp, mean = svymean( ~total.time.child , z ))

svymean( ~total.time.child , z )
# continuous


test  <- combine.data.complete[c(combine.data.complete$interview.year== 2006),]

test  <- combine.data.complete[c(combine.data.complete$interview.year== 2006),]




#########################################################################


empty.frame <- data.frame(matrix(ncol = 5, nrow = 2)) 

z <- svydesign(id=~1, weights=~tufnwgtp, data=combine.data.regress.v2)


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

























demographic.var <- c("+ age + race + sex + marital.status ")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations  + total.other.job.time +  total.main.job.time + work.hours.last.week")
current.sit <- c("+ factor(current.situation) + factor(reason.not.work) + factor(reason.absent.last.week) + factor(enrolled.school) + factor(reason.absent.last.week.atus)") 
family.bus <- c("+ factor(household.own.bus) + factor(unpaid.work.family.bus)")
family.var <- c("+ num.children + num.family.member + age.youngest.child" )
time.var <- c("+ interview.year  + diary.day" )
location.var <- c("+ region + fips")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
family.inc.var <- c("+ edited.family.income2 + factor(edited.family.income2.indicator) + edited.weekly.earnings + factor(edited.weekly.earnings.indicator) 
                    + factor(weekly.earning.top.coded)  " )
childcare.service.var <- c("+ use.paid.childcare + wait.to.meet.childcare + childcare.other + travel.use.childcare + phone.call.care.provider")
children.sick.var <- c("+provide.medical.care.hh.children + obtain.medical.care.hh.children + wait.child.health + child.health.other")






yvariables.v2 <-c( "total.time.child", "physical.care.hh.children",
                   "grocery.shopping", "food.drink.preparation", "purchasing.food",
                   "play.with.hh.children",
                   "reading.to.hh.children","talk.listening.to.hh.children","homework.hh.children", "supervision.hh.children", "pick.drop.hh.child", "travel.caring.help.hh.child",
                   "total.travel.work.time",  "total.grooming.time" )



names.y <- c("Total time for childcare", "Physical care", 
             "Grocery shopping", "Cooking", "Purchasing prepared food",
             "Play with children", 
             "Read to children", "Talk and listening to children", "Help Homework", "Supervising Children", "Pick or drop off children", "Travel time for helping children",
              "Travel time for work", "Total grooming time" )


empty.frame <- data.frame(matrix(ncol = 5, nrow = 2)) 

z <- svydesign(id=~1, weights=~tufnwgtp, data=combine.data.regress.v2)
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
print(xtable(empty.frame, caption = "Summary Statistics for the independent variables")
      , add.to.row = addtorow, include.rownames = FALSE, include.colnames = FALSE )


















# another option
#interview.year.dum  <- combine.data.regress.v2[c("tucaseid", "interview.year")]
#interview.year.dum$interview.year  <- unclass(interview.year.dum$interview.year)
#interview.year.dum$interview.year  <- factor(interview.year.dum$interview.year)
#interview.year.dum <- dummy.data.frame(interview.year.dum)


combine.data.regress.v2.dum <- combine.data.regress.v2 
combine.data.regress.v2.dum$interview.year  <- unclass(combine.data.regress.v2.dum$interview.year)
combine.data.regress.v2.dum$interview.year  <- factor(combine.data.regress.v2.dum$interview.year)



combine.data.regress.v2.dum$family.income  <- unclass(combine.data.regress.v2.dum$family.income)
combine.data.regress.v2.dum$family.income  <- factor(combine.data.regress.v2.dum$family.income)



combine.data.regress.v2.dum <- dummy.data.frame(combine.data.regress.v2.dum) 



gender <- combine.data.regress.v2[c("tucaseid", "sex")]
combine.data.regress.v2.dum <- join(combine.data.regress.v2.dum, gender , by="tucaseid")




current.situation.dum  <- combine.data.regress.v2[c("tucaseid", "current.situation")]
current.situation.dum$current.situation  <- factor(current.situation.dum$current.situation)
current.situation.dum <- dummy.data.frame(current.situation.dum) 


reason.not.work.dum  <- combine.data.regress.v2[c("tucaseid", "reason.not.work")]
reason.not.work.dum$reason.not.work <- factor(reason.not.work.dum$reason.not.work)
reason.not.work.dum <- dummy.data.frame(reason.not.work.dum) 


reason.absent.last.week.dum  <- combine.data.regress.v2[c("tucaseid", "reason.absent.last.week")]
reason.absent.last.week.dum$reason.absent.last.week  <- factor(reason.absent.last.week.dum$reason.absent.last.week)
reason.absent.last.week.dum <- dummy.data.frame(reason.absent.last.week.dum)

enrolled.school.dum  <- combine.data.regress.v2[c("tucaseid", "enrolled.school")]
enrolled.school.dum$enrolled.school  <- factor(enrolled.school.dum$enrolled.school)
enrolled.school.dum <- dummy.data.frame(enrolled.school.dum)


household.own.bus.dum  <- combine.data.regress.v2[c("tucaseid", "household.own.bus")]
household.own.bus.dum$household.own.bus  <- factor(household.own.bus.dum$household.own.bus)
household.own.bus.dum <- dummy.data.frame(household.own.bus.dum)



unpaid.work.family.bus.dum  <- combine.data.regress.v2[c("tucaseid", "unpaid.work.family.bus")]
unpaid.work.family.bus.dum$unpaid.work.family.bus  <- factor(unpaid.work.family.bus.dum$unpaid.work.family.bus)
unpaid.work.family.bus.dum <- dummy.data.frame(unpaid.work.family.bus.dum)


reason.absent.last.week.atus.dum  <- combine.data.regress.v2[c("tucaseid", "reason.absent.last.week.atus")]
reason.absent.last.week.atus.dum$reason.absent.last.week.atus  <- factor(reason.absent.last.week.atus.dum$reason.absent.last.week.atus)
reason.absent.last.week.atus.dum <- dummy.data.frame(reason.absent.last.week.atus.dum)






combine.data.regress.v2.dum <- join(combine.data.regress.v2.dum,current.situation.dum  , by="tucaseid")
combine.data.regress.v2.dum <- join(combine.data.regress.v2.dum,reason.not.work.dum ,by="tucaseid")
combine.data.regress.v2.dum <- join(combine.data.regress.v2.dum,reason.absent.last.week.dum,by="tucaseid")
combine.data.regress.v2.dum <- join(combine.data.regress.v2.dum,enrolled.school.dum ,by="tucaseid")
combine.data.regress.v2.dum <- join(combine.data.regress.v2.dum,household.own.bus.dum ,by="tucaseid")
combine.data.regress.v2.dum <- join(combine.data.regress.v2.dum,unpaid.work.family.bus.dum ,by="tucaseid") 
combine.data.regress.v2.dum <- join(combine.data.regress.v2.dum,reason.absent.last.week.atus.dum ,by="tucaseid") 







xvariables <- c("wfh.v30","wfh.v31", "age", "race1", "race2", "race4", "sexMale", "sexFemale",
                "marital.statusMarried-spouse present", "marital.statusMarried-spouse absent",
                "marital.statusWidowed","marital.statusDivorced" , "marital.statusSeparated", 
                "marital.statusNever married", "work.hours", 
                "occupationsBusiness and financial operations",                    
                "occupationsComputer and mathematical science",                    
                "occupationsArchitecture and engineering",                         
                "occupationsLife, physical, and social science",                   
                "occupationsCommunity and social service",                         
                "occupationsLegal",                                                
                "occupationsEducation, training, and library" ,                    
                "occupationsArts, design, entertainment, sports, and media"   ,    
                "occupationsHealthcare practitioner and technical",                
                "occupationsHealthcare support",                            
                "occupationsProtective service",                                   
                "occupationsFood preparation and serving related",                 
                "occupationsBuilding and grounds cleaning and maintenance",        
                "occupationsPersonal care and service",                            
                "occupationsSales and related",                                    
                "occupationsOffice and administrative support",                    
                "occupationsFarming, fishing, and forestry",                       
                "occupationsConstruction and extraction",                          
                "occupationsInstallation, maintenance, and repair",                
                "occupationsProduction",                                           
                "occupationsTransportation and material moving", 
                "total.other.job.time", "total.main.job.time", "work.hours.last.week",
                "current.situation1", "current.situation2", "current.situation3", "current.situation4", "current.situation5",
                "current.situation6", "current.situation7", 
                "reason.not.work1",
                "reason.not.work2",
                "reason.not.work3",
                "reason.not.work4",
                "reason.not.work5",
                
                "reason.not.work7",
                "reason.not.work8",
                
                "reason.not.work10",
                "reason.not.work11",
                "reason.not.work12",
                "reason.not.work13",
                "reason.not.work14",
                "reason.not.work15",
                "reason.not.work16",
                "reason.not.work17",
                "reason.not.work18",
                "reason.not.work19",
                "reason.not.work20",
                "reason.not.work21",
                "reason.not.work22",
                "reason.not.work23",
                "reason.not.work24",
                "reason.not.work25",
                
                
                
                
                "reason.not.work30",
                "reason.not.work31",
                "reason.not.work32",
                "reason.not.work33",
                "reason.not.work34",
                "reason.not.work35",
                
                "reason.not.work37",
                
                
                "reason.not.work40",
                "reason.not.work41",
                "reason.not.work42",
                
                
                "reason.absent.last.week4",
                "reason.absent.last.week5",
                "reason.absent.last.week6",
                "reason.absent.last.week7",
                "reason.absent.last.week8",
                "reason.absent.last.week9",
                "reason.absent.last.week10",
                "reason.absent.last.week11",
                "reason.absent.last.week12",
                
                "reason.absent.last.week14",
                
                "reason.absent.last.week41",
                "reason.absent.last.week42",
                
                "enrolled.school1",
                "enrolled.school2",
                "enrolled.school3", 
                
                "household.own.bus1",
                "household.own.bus2",
                
                "unpaid.work.family.bus1",
                "unpaid.work.family.bus2",
                "num.children",
                "num.family.member",
                "age.youngest.child",
                "interview.year1",
                "interview.year2",
                "interview.year3",
                "interview.year4",
                "interview.year5",
                "interview.year6",
                "interview.year7",
                "interview.year8",
                "interview.year9",
                "interview.year10",
                "interview.year11",
                "interview.year12", 
                
                "diary.dayMonday",
                "diary.dayTuesday",
                "diary.dayWednesday",
                "diary.dayThursday",
                "diary.dayFriday",
                
                "edit.spouse.presenceSpouse present",
                "edit.spouse.presenceSpouse not present",
                
                "spouse.employ.statusEmployed",
                "spouse.employ.statusNot Employed",
                "spouse.employ.statusNo spouse/partner present",
                
                
                "spouse.work.hours",
                
                "full.part.time.spouseFull time",
                "full.part.time.spousePart time",
                "full.part.time.spouseHours vary",
                "full.part.time.spouseNo partner/not employed",
                
                "family.income1",
                "family.income2",
                "family.income3",
                "family.income4",
                "family.income5",
                "family.income6",
                "family.income7",
                "family.income8",
                "family.income9",
                "family.income10",
                "family.income11",
                "family.income12",
                "family.income13",
                "family.income14",
                "family.income15",
                "family.income16",

                "weekly.earnings",
                
                "use.paid.childcare",
                "wait.to.meet.childcare",
                "childcare.other", 
                "travel.use.childcare", 
                "phone.call.care.provider",
                
                "provide.medical.care.hh.children", 
                "obtain.medical.care.hh.children", 
                "wait.child.health", 
                "child.health.other", 
                
                
                "reason.absent.last.week.atus1",
                "reason.absent.last.week.atus4",
                "reason.absent.last.week.atus5",
                "reason.absent.last.week.atus6",
                "reason.absent.last.week.atus7",
                "reason.absent.last.week.atus8",
                "reason.absent.last.week.atus9",
                "reason.absent.last.week.atus10",
                "reason.absent.last.week.atus11",
                "reason.absent.last.week.atus14"
                
                )

names <- c("1 if work at office of other locations", "1 if work from home", "age", "1 if white", "1 if black", "1 if asian", "1 if male", "1 if female",
           "1 if married-spouse present", "1 if married-spouse absent", "1 if widowed", "1 if divorced","1 if separated", "1 if never married",
           "weekly work hours if employed", 
           "1 if business and financial operations",                    
           "1 if computer and mathematical science",                    
           "1 if architecture and engineering" ,                        
           "1 if life, physical, and social science" ,                  
           "1 if community and social service"    ,                     
           "1 if legal"              ,                                  
           "1 if education, training, and library"  ,                   
           "1 if arts, design, entertainment, sports, and media"       ,
           "1 if healthcare practitioner and technical"  ,              
           "1 if healthcare support"      ,                             
           "1 if protective service"     ,                              
           "1 if food preparation and serving related"    ,             
           "1 if building and grounds cleaning and maintenance" ,       
           "1 if personal care and service"   ,                         
           "1 if sales and related"    ,                                
           "1 if office and administrative support"   ,                 
           "1 if farming, fishing, and forestry"     ,                  
           "1 if construction and extraction"       ,                   
           "1 if installation, maintenance, and repair"   ,             
           "1 if production"     ,                                      
           "1 if transportation and material moving", 
           "daily work hours-other jobs", "daily work hours-main job", "work hours last week", 
           "1 if disabled",
           "1 if ill", 
           "1 if in school", 
           "1 if taking care of house or family", 
           "1 if in retirement",
           "1 if other", 
           "1 if not valid(either over 49 years old or retired)", 
           "1 if full time paid - vacation",
           "1 if full time paid - own illness",
           "1 if full time paid - childcare problems",
           "1 if full time paid - other family/personal obligation",
           "1 if full time paid - maternity/paternity leave",
           
           "1 if full time paid - weather affected job",
           "1 if full time paid - school/training",
           
           "1 if full time paid - other",
           "1 if full time unpaid - vacation",
           "1 if full time unpaid - own illness",
           "1 if full time unpaid - childcare problems",
           "1 if full time unpaid - other family/personal obligation",
           "1 if full time unpaid - maternity/paternity leave",
           "1 if full time unpaid - labor dispute",
           "1 if full time unpaid - weather affected job",
           "1 if full time unpaid - school/training",
           "1 if full time unpaid - civic/military duty",
           "1 if full time unpaid - other",
           "1 if part time paid - vacation",
           "1 if part time paid - own illness",
           "1 if part time paid - childcare problems",
           "1 if part time paid - other family/personal obligation",
           "1 if part time paid - maternity/paternity leave",
           
           
           
           
           "1 if part time paid - other",
           "1 if part time unpaid - vacation",
           "1 if part time unpaid - own illness",
           "1 if part time unpaid - childcare problems",
           "1 if part time unpaid - other family/personal obligation",
           "1 if part time unpaid - maternity/paternity leave",
           
           "1 if part time unpaid - weather affected job",
           
           
           "1 if part time unpaid - other",
           "1 if unemployed/not in labor force",
           "reason-employed but not work-cps: employed at work", 
           
           
           "1 if vacation/personal days",
           "1 if own illness/injury/medical problems",
           "1 if childcare problems",
           "1 if other family/personal obligation",
           "1 if maternity/paternity leave",
           "1 if labor dispute",
           "1 if weather affected job",
           "1 if school/training",
           "1 if civic/military duty",
           
           "1 if other",
           "1 if unemployed/not in labor force",
           "1 if employed at work",
           
           "1 if hs, college or university",
           "1 if not enrolled",
           "1 if not valid(either a child, in armed forces or over 54 years old)",
           
           "1 if someone in household own business/farm: yes",
           "1 if someone in household own business/farm: no",
           
           "1 if do unpaid work in family business/farm: yes",
           "1 if do unpaid work in family business/farm: no",
           
           "num of children",
           "num of family members",
           "age of youngest child",           
           "1 if year = 2003",
           "1 if year = 2004",
           "1 if year = 2005",
           "1 if year = 2006",
           "1 if year = 2007",
           "1 if year = 2008",
           "1 if year = 2009",
           "1 if year = 2010",
           "1 if year = 2011",
           "1 if year = 2012",
           "1 if year = 2013",
           "1 if year = 2014",
           
           "1 if Monday",
           "1 if Tuesday",
           "1 if Wednesday",
           "1 if Thursday",
           "1 if Friday", 
           
           "1 if spouse/partner present",
           "1 if spouse/partner not present",
           
           "1 if employed",
           "1 if not employed",
           "1 if no spouse/partner present",           
           
           "1 if spouse/partner weekly work hours if spouse/partner is present", 
           
           "1 if full time",
           "1 if part time",
           "1 if hours vary",
           "1 if no spouse/partner present or not employed",           
           
           "1 if less than $5,000",
           "1 if $5,000 to $7,499",
           "1 if $7,500 to $9,999",
           "1 if $10,000 to $12,499",
           "1 if $12,500 to $14,999",
           "1 if $15,000 to $19,999",
           "1 if $20,000 to $24,999",
           "1 if $25,000 to $29,999",
           "1 if $30,000 to $34,999",
           "1 if $35,000 to $39,999",
           "1 if $40,000 to $49,999",
           "1 if $50,000 to $59,999",
           "1 if $60,000 to $74,999",
           "1 if $75,000 to $99,999",
           "1 if $100,000 to $149,999",
           "1 if $150,000 and over",
           
           "weekly earnings if reported",
           
           "minutes used in paid childcare services",
           "minutes used in waiting associated with childcare services",
           "minutes used in childcare - other", 
           "minutes used in childcare related travel", 
           "minutes used in childcare related phone call",
           
           "minutes used in provide medical care to child", 
           "minutes used in obtain medical care child", 
           "minutes used in waiting for child health related act.", 
           "minutes used in child health - other", 
           
           
           "1 if on layoff (temporary or indefinite)",
           "1 if vacation/personal days",
           "1 if own illness/injury/medical problems",
           "1 if childcare problems",
           "1 if other family/personal obligation",
           "1 if maternity/paternity leave",
           "1 if labor dispute",
           "1 if weather affected job",
           "1 if school/training",
           "1 if other"
           

)



empty.frame <- data.frame(matrix(ncol = 5, nrow = 2)) 

z <- svydesign(id=~1, weights=~tufnwgtp, data=combine.data.regress.v2.dum)
colnames(empty.frame) <-c("Variables group" ,"Variables","Mean(SD)", "Mean(SD) (Women)", "Mean(SD) (Men)") 

row <- seq(from = 1 , to = 500, by = 2)

for (i in 1:length(xvariables)) {    
  
  
  
  a <- svyby( ~get(xvariables[i]),~sex, z, svymean, na.rm = TRUE)
  b <- svyby( ~get(xvariables[i]),~sex, z, svyvar, na.rm = TRUE)
  
  c <- svymean( ~get(xvariables[i]) , z , na.rm = TRUE)
  d <- sqrt(svyvar( ~get(xvariables[i]) , z , na.rm = TRUE))
  
  
  
  
  
  
  empty.frame[row[i],2] <- names[i]
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
print(xtable(empty.frame, caption = "Summary Statistics for the independent variables")
      , add.to.row = addtorow, include.rownames = FALSE, include.colnames = FALSE )

















svymean(combine.data.regress.v2.dum)






### test ####


empty.frame <- data.frame(matrix(ncol = 5, nrow = 2)) 

z <- svydesign(id=~1, weights=~tufnwgtp, data=combine.data.regress.v2.dum)
colnames(empty.frame) <-c("Variables group" ,"Variables","Mean(SD)", "Mean(SD) (Women)", "Mean(SD) (Men)") 

row <- seq(from = 1 , to = 500, by = 2)

for (i in 1:5) {    
  
  
  
  a <- svyby( ~get(xvariables[i]),~sex, z, svymean, na.rm = TRUE)
  b <- svyby( ~get(xvariables[i]),~sex, z, svyvar, na.rm = TRUE)
  
  c <- svymean( ~get(xvariables[i]) , z , na.rm = TRUE)
  d <- sqrt(svyvar( ~get(xvariables[i]) , z , na.rm = TRUE))
  
  
  
  
  
  
  empty.frame[row[i],2] <- names[i]
  empty.frame[row[i],3] <- c
  empty.frame[row[i]+1,3] <- paste0( "(",signif(d, digits = 3),")")
  
  empty.frame[row[i],4] <- signif(a[2,2], digits = 3)
  empty.frame[row[i]+1,4] <- paste0( "(",signif(sqrt(b[2,2]), digits = 3),")")
  empty.frame[row[i],5] <- signif(a[1,2], digits = 3) 
  empty.frame[row[i]+1,5] <- paste0( "(",signif(sqrt(b[1,2]), digits = 3),")")
  

  
}   



addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c(" &  & & Women & Men  \\\\\n",
                      "Variables group & Variables & Mean(SD) & Mean(SD) (Women) & Mean(SD) (Men) \\\\\n")
print(xtable(empty.frame, caption = "Summary Statistics for the independent variables")
      , add.to.row = addtorow, include.rownames = FALSE, include.colnames = FALSE )







names <- c("1 if Work at office of other locations", "1 if Work from home", "age", "1 if White", "1 if Black", "1 if Asian", "1 if Male", "1 if Female",
           "1 if Married-spouse present", "1 if Married-spouse absent", "1 if Widowed", "1 if Divorced","1 if Separated", "1 if Never married",
           "Weekly Work hours if employed", 
           "1 if Business and financial operations",                    
           "1 if Computer and mathematical science",                    
           "1 if Architecture and engineering" ,                        
           "1 if Life, physical, and social science" ,                  
           "1 if Community and social service"    ,                     
           "1 if Legal"              ,                                  
           "1 if Education, training, and library"  ,                   
           "1 if Arts, design, entertainment, sports, and media"       ,
           "1 if Healthcare practitioner and technical"  ,              
           "1 if Healthcare support"      ,                             
           "1 if Protective service"     ,                              
           "1 if Food preparation and serving related"    ,             
           "1 if Building and grounds cleaning and maintenance" ,       
           "1 if Personal care and service"   ,                         
           "1 if Sales and related"    ,                                
           "1 if Office and administrative support"   ,                 
           "1 if Farming, fishing, and forestry"     ,                  
           "1 if Construction and extraction"       ,                   
           "1 if Installation, maintenance, and repair"   ,             
           "1 if Production"     ,                                      
           "1 if Transportation and material moving", 
           "Daily Work hours-other jobs", "Daily Work hours-main job", "Work hours last week", 
           "1 if Current situation-CPS: Disabled",
           "1 if Current situation-CPS: Ill", 
           "1 if Current situation-CPS: In School", 
           "1 if Current situation-CPS: Taking care of house or family", 
           "1 if Current situation-CPS: In retirement",
           "1 if Current situation-CPS: Other", 
           "1 if Current situation-CPS: Not valid(either over 49 years old or retired)", 
           "Reason-employed but not work-CPS: Full time paid - vacation",
           "Reason-employed but not work-CPS: Full time paid - own illness",
           "Reason-employed but not work-CPS: Full time paid - childcare problems",
           "Reason-employed but not work-CPS: Full time paid - other family/personal obligation",
           "Reason-employed but not work-CPS: Full time paid - maternity/paternity leave",
           
           "Reason-employed but not work-CPS: Full time paid - weather affected job",
           "Reason-employed but not work-CPS: Full time paid - school/training",
           
           "Reason-employed but not work-CPS: Full time paid - other",
           "Reason-employed but not work-CPS: Full time unpaid - vacation",
           "Reason-employed but not work-CPS: Full time unpaid - own illness",
           "Reason-employed but not work-CPS: Full time unpaid - childcare problems",
           "Reason-employed but not work-CPS: Full time unpaid - other family/personal obligation",
           "Reason-employed but not work-CPS: Full time unpaid - maternity/paternity leave",
           "Reason-employed but not work-CPS: Full time unpaid - labor dispute",
           "Reason-employed but not work-CPS: Full time unpaid - weather affected job",
           "Reason-employed but not work-CPS: Full time unpaid - school/training",
           "Reason-employed but not work-CPS: Full time unpaid - civic/military duty",
           "Reason-employed but not work-CPS: Full time unpaid - other",
           "Reason-employed but not work-CPS: Part time paid - vacation",
           "Reason-employed but not work-CPS: Part time paid - own illness",
           "Reason-employed but not work-CPS: Part time paid - childcare problems",
           "Reason-employed but not work-CPS: Part time paid - other family/personal obligation",
           "Reason-employed but not work-CPS: Part time paid - maternity/paternity leave",
           
           
           
           
           "Reason-employed but not work-CPS: Part time paid - other",
           "Reason-employed but not work-CPS: Part time unpaid - vacation",
           "Reason-employed but not work-CPS: Part time unpaid - own illness",
           "Reason-employed but not work-CPS: Part time unpaid - childcare problems",
           "Reason-employed but not work-CPS: Part time unpaid - other family/personal obligation",
           "Reason-employed but not work-CPS: Part time unpaid - maternity/paternity leave",
           
           "Reason-employed but not work-CPS: Part time unpaid - weather affected job",
           
           
           "Reason-employed but not work-CPS: Part time unpaid - other",
           "Reason-employed but not work-CPS: Unemployed/not in labor force",
           "Reason-employed but not work-CPS: Employed at work", 
           
           
           "Reason-employed but absent last week-CPS: Vacation/personal days",
           "Reason-employed but absent last week-CPS: Own illness/injury/medical problems",
           "Reason-employed but absent last week-CPS: Childcare problems",
           "Reason-employed but absent last week-CPS: Other family/personal obligation",
           "Reason-employed but absent last week-CPS: Maternity/paternity leave",
           "Reason-employed but absent last week-CPS: Labor dispute",
           "Reason-employed but absent last week-CPS: Weather affected job",
           "Reason-employed but absent last week-CPS: School/training",
           "Reason-employed but absent last week-CPS: Civic/military duty",
           
           "Reason-employed but absent last week-CPS: Other",
           "Reason-employed but absent last week-CPS: Unemployed/not in labor force",
           "Reason-employed but absent last week-CPS: Employed at work",
           
           "enroll scholl-CPS: HS, college or university",
           "enroll scholl-CPS: Not enrolled",
           "enroll school-CPS: Not valid(either a child, in armed forces or over 54 years old)",
           
           "Anyone in household own business/farm: Yes",
           "Anyone in household own business/farm: No",
           
           "Do unpaid work in family business/farm: Yes",
           "Do unpaid work in family business/farm: No",
           
           "num of children",
           "num of family members",
           "age of youngest child",           
           "Year = 2003",
           "Year = 2004",
           "Year = 2005",
           "Year = 2006",
           "Year = 2007",
           "Year = 2008",
           "Year = 2009",
           "Year = 2010",
           "Year = 2011",
           "Year = 2012",
           "Year = 2013",
           "Year = 2014",
           
           "Monday",
           "Tuesday",
           "Wednesday",
           "Thursday",
           "Friday", 
           
           "Spouse/partner present",
           "Spouse/partner not present",
           
           "spouse employ status: Employed",
           "spouse employ status: Not Employed",
           "spouse employ status: No spouse/partner present",           
           
           "Spouse/partner weekly work hours if spouse/partner is present", 
           
           "Spouse/partner employ staus: Full time",
           "Spouse/partner employ staus: Part time",
           "Spouse/partner employ staus: Hours vary",
           "Spouse/partner employ staus: No spouse/partner present or not employed",           
           
           "Less than $5,000",
           "$5,000 to $7,499",
           "$7,500 to $9,999",
           "$10,000 to $12,499",
           "$12,500 to $14,999",
           "$15,000 to $19,999",
           "$20,000 to $24,999",
           "$25,000 to $29,999",
           "$30,000 to $34,999",
           "$35,000 to $39,999",
           "$40,000 to $49,999",
           "$50,000 to $59,999",
           "$60,000 to $74,999",
           "$75,000 to $99,999",
           "$100,000 to $149,999",
           "$150,000 and over",
           
           "weekly earnings if reported",
           
           "Minutes used in paid childcare services",
           "Minutes used in waiting associated with childcare services",
           "Minutes used in childcare - other", 
           "Minutes used in childcare related travel", 
           "Minutes used in childcare related phone call",
           
           "Minutes used in provide medical care to child", 
           "Minutes used in obtain medical care child", 
           "Minutes used in waiting for child health related act.", 
           "Minutes used in child health - other", 
           
           
           "Reason-employed but absent last week: On layoff (temporary or indefinite)",
           "Reason-employed but absent last week: Vacation/personal days",
           "Reason-employed but absent last week: Own illness/injury/medical problems",
           "Reason-employed but absent last week: Childcare problems",
           "Reason-employed but absent last week: Other family/personal obligation",
           "Reason-employed but absent last week: Maternity/paternity leave",
           "Reason-employed but absent last week: Labor dispute",
           "Reason-employed but absent last week: Weather affected job",
           "Reason-employed but absent last week: School/training",
           "Reason-employed but absent last week: Other"
           
)

