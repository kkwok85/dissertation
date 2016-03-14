# sum stat


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
























# regression
# factor(edited.occupations.indicator) skilled cuz it is cut out  ,+ factor(reason.not.work)  + factor(reason.absent.last.week) + factor(reason.absent.last.week.atus) +edited.work.hours + factor(edited.work.hours.indicator)
# factor(allocation.flag.week.earn)  cut 

demographic.var <- c("+ age + race + sex + marital.status ")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations  + total.other.job.time +  total.main.job.time + work.hours.last.week +factor(employment.status)")
current.sit <- c("+ factor(current.situation)   + factor(enrolled.school) ") 
family.bus <- c("+ factor(household.own.bus) + factor(unpaid.work.family.bus)")
family.var <- c("+ num.children + num.family.member + age.youngest.child" )
time.var <- c("+ interview.year  + diary.day" )
location.var <- c("+ region + fips")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
family.inc.var <- c("+ edited.family.income2 + factor(edited.family.income2.indicator) + edited.weekly.earnings + factor(edited.weekly.earnings.indicator) + factor(weekly.earning.top.coded) " )
childcare.service.var <- c("+ use.paid.childcare + wait.to.meet.childcare + childcare.other + travel.use.childcare + phone.call.care.provider")
children.sick.var <- c("+ provide.medical.care.hh.children + obtain.medical.care.hh.children + wait.child.health + child.health.other")





yvariables.v2 <-c( "total.time.child", "physical.care.hh.children",
                   "grocery.shopping", "food.drink.preparation", "purchasing.food",
                   "play.with.hh.children",
                   "reading.to.hh.children","talk.listening.to.hh.children","homework.hh.children", "supervision.hh.children", "pick.drop.hh.child", "travel.caring.help.hh.child",
                   "total.travel.work.time",  "total.grooming.time" )



names.y <- c("Total time for childcare", "Physical care", 
             "Grocery shopping", "Cooking", "Purchasing prepared food",
             "Playing with children", 
             "Reading to children", "Talking and listening to children", "Helping homework", "Supervising children", "Picking or droping off children", "Travel time for helping children",
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

# this is to expand factor variables (for the ordered variables)
combine.data.regress.v2.dum <- combine.data.regress.v2 
combine.data.regress.v2.dum$interview.year  <- unclass(combine.data.regress.v2.dum$interview.year)
combine.data.regress.v2.dum$interview.year  <- factor(combine.data.regress.v2.dum$interview.year)



combine.data.regress.v2.dum$family.income  <- unclass(combine.data.regress.v2.dum$family.income)
combine.data.regress.v2.dum$family.income  <- factor(combine.data.regress.v2.dum$family.income)



combine.data.regress.v2.dum <- dummy.data.frame(combine.data.regress.v2.dum) 



gender <- combine.data.regress.v2[c("tucaseid", "sex")]
combine.data.regress.v2.dum <- join(combine.data.regress.v2.dum, gender , by="tucaseid")


# this is to expand factor variables (for the non factor variables)
employment.status.dum  <- combine.data.regress.v2[c("tucaseid", "employment.status")]
employment.status.dum$employment.status <- factor(employment.status.dum$employment.status)
employment.status.dum <- dummy.data.frame(employment.status.dum) 



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





combine.data.regress.v2.dum <- join(combine.data.regress.v2.dum,employment.status.dum  , by="tucaseid")

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
                "marital.statusNever married", 
                "employment.status1","employment.status2", "work.hours", 
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
                "total.main.job.time","total.other.job.time", "work.hours.last.week",
                "current.situation1", "current.situation2", "current.situation3", "current.situation4", "current.situation5",
                "current.situation6", "current.situation7", 

                
                
                
       
                
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
                "child.health.other"
                
                

                
                )

names <- c("1 if work at office of other locations", "1 if work from home", "Age", "1 if white", "1 if black", "1 if asian", "1 if male", "1 if female",
           "1 if married-spouse present", "1 if married-spouse absent", "1 if widowed", "1 if divorced","1 if separated", "1 if never married",
           "1 employed-at work", "1 employed-absent", "Weekly work hours*", 
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
           "Daily work hours-main job","Daily work hours-other jobs", "Work hours last week", 
           "1 if disabled",
           "1 if ill", 
           "1 if in school", 
           "1 if taking care of house or family", 
           "1 if in retirement",
           "1 if other", 
           "1 if either over 49 years old or retired", 
  
           
           "1 if hs, college or university",
           "1 if not enrolled",
           "1 if either a child, in armed forces or over 54 years old",
           
           "1 if someone in household own business/farm: yes",
           "1 if someone in household own business/farm: no",
           
           "1 if do unpaid work in family business/farm: yes",
           "1 if do unpaid work in family business/farm: no",
           
           "Number of children",
           "Number of family members",
           "Age of youngest child",           
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
           
           "Spouse/partner weekly work hours if spouse/partner is present*", 
           
           "1 if full time",
           "1 if part time",
           "1 if hours vary",
           "1 if no spouse/partner present or not employed",           
           
           "1 if less than $5,000*",
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
           
           "Week earnings if reported*",
           
           "Minutes used in paid childcare services",
           "Minutes used in waiting associated with childcare services",
           "Minutes used in childcare - other", 
           "Minutes used in childcare related travel", 
           "Minutes used in childcare related phone call",
           
           "Minutes used in provide medical care to child", 
           "Minutes used in obtain medical care child", 
           "Minutes used in waiting for child health related act.", 
           "Minutes used in child health - other"
           
           
           
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




# clean the table by yourself by dividing the table up. 
# Change the note. 
# add title









