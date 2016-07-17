



names.y <- c("Physical care", 
             "Grocery shopping", "Cooking", "Purchasing prepared food",
             "Playing with children", 
             "Reading to children", "Talking and listening to children", "Helping with homework", "Supervising children", "Picking or dropping off children", "Travel time for helping children",
             "Total time for primary child care", "Total time for secondary child care*", "Total time for primary and secondary child care*", "Percentage of secondary child care time*" , "Travel time to and from work", "Total grooming time", "Total time for TV and movies" )

yvariables.v3 <-c( "physical.care.hh.children",
                   "grocery.shopping", "food.drink.preparation", "purchasing.food",
                   "play.with.hh.children",
                   "reading.to.hh.children","talk.listening.to.hh.children","homework.hh.children", "supervision.hh.children", "pick.drop.hh.child", "travel.caring.help.hh.child",
                   "total.time.child", "sec.child.care.hh", "total.time.child.prim.sec", "portion.sec.child.care.hh",  "total.travel.work.time",  "total.grooming.time", "TV.movies"  )



# SEPECIAL FOR SELF-EMPLOYEDD!!!

# regression
# factor(edited.occupations.indicator) skilled cuz it is cut out  ,+ factor(reason.not.work)  + factor(reason.absent.last.week) + factor(reason.absent.last.week.atus)
# factor(allocation.flag.week.earn)  cut 
# becareful of this one!!!! sex is taken away!!!
demographic.no.sex.var <- c("+ age + race.edit  +  marital.status.edit + school.level.completed.edit") 
demographic.var <- c("+ age + race.edit + sex + marital.status.edit + school.level.completed.edit ")
employ.var <- c("+ edited.work.hours + factor(edited.work.hours.indicator) + edited.occupations  + total.other.job.time +  total.main.job.time + work.hours.last.week +factor(edited.employ.status)")
#current.sit <- c("+ factor(current.situation)   + factor(enrolled.school) ") 
family.bus <- c("+ factor(household.own.bus) + factor(unpaid.work.family.bus)")
family.var <- c("+ num.children + num.family.member + age.youngest.child" )
time.var <- c("+ interview.year  + diary.day" )
location.var <- c("+ region + fips")
spouse.var <- c("+ edit.spouse.presence + spouse.employ.status +  edited.spouse.work.hours + factor(edited.spouse.work.hours.indicator)   + full.part.time.spouse ")
earnings.var.self.employed <- c("+ edited.weekly.earnings ")
family.inc.var <- c("+ edited.family.income3" )
children.sick.var <- c("+ children.sick.indicator")





empty.frame <- data.frame(matrix(ncol = 5, nrow = 2)) 

colnames(empty.frame) <-c("Variables group" ,"Variables","Mean(SD)", "Mean(SD) (Women)", "Mean(SD) (Men)") 

row <- seq(from = 1 , to = 500, by = 1)

for (i in 1:length(yvariables.v3)) {    
  
  if (yvariables.v3 == "sec.child.care.hh" | yvariables.v3 == "total.time.child.prim.sec" | yvariables.v3 == "portion.sec.child.care.hh" ) {
    z <- svydesign(id=~1, weights=~tufnwgtp, data=combine.data.complete.sum.stat[which(combine.data.complete.sum.stat$age.youngest.child < 13),] )
    
    
  } else {
    z <- svydesign(id=~1, weights=~tufnwgtp, data=combine.data.complete.sum.stat)
    
  }
  
  
  a <- svyby( ~get(yvariables.v3[i]),~sex, z, svymean, na.rm = TRUE)
  b <- svyby( ~get(yvariables.v3[i]),~sex, z, svyvar, na.rm = TRUE)
  
  c <- svymean( ~get(yvariables.v3[i]) , z , na.rm = TRUE)
  d <- sqrt(svyvar( ~get(yvariables.v3[i]) , z , na.rm = TRUE))
  
  
  
  
  
  
  empty.frame[row[i],2] <- names.y[i]
  empty.frame[row[i],3] <- paste0(signif(c, digits=3) ,"(",signif(d, digits = 3),")")

  
  empty.frame[row[i],4] <- paste0(signif(a[2,2], digits = 3) ,"(",signif(sqrt(b[2,2]), digits = 3),")")

  empty.frame[row[i],5] <- paste0( signif(a[1,2], digits = 3) ,"(",signif(sqrt(b[1,2]), digits = 3),")")

  
  
}   



addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c("  & & Mean(SD) & Mean(SD) (Women) & Mean(SD) (Men) \\\\\n",
                      " Variables group & Variables   &  Full & Women & Men \\\\\n")
print(xtable(empty.frame, caption = "Summary Statistics for the dependent variables")
      , add.to.row = addtorow, include.rownames = FALSE, include.colnames = FALSE )

















# another option
#interview.year.dum  <- combine.data.complete.sum.stat[c("tucaseid", "interview.year")]
#interview.year.dum$interview.year  <- unclass(interview.year.dum$interview.year)
#interview.year.dum$interview.year  <- factor(interview.year.dum$interview.year)
#interview.year.dum <- dummy.data.frame(interview.year.dum)

# this is to expand factor variables (for the ordered variables)
combine.data.complete.sum.stat.dum <- combine.data.complete.sum.stat 
combine.data.complete.sum.stat.dum$interview.year  <- unclass(combine.data.complete.sum.stat.dum$interview.year)
combine.data.complete.sum.stat.dum$interview.year  <- factor(combine.data.complete.sum.stat.dum$interview.year)



combine.data.complete.sum.stat.dum$edited.family.income3 <- unclass(combine.data.complete.sum.stat.dum$edited.family.income3)
combine.data.complete.sum.stat.dum$edited.family.income3  <- factor(combine.data.complete.sum.stat.dum$edited.family.income3)



combine.data.complete.sum.stat.dum <- dummy.data.frame(combine.data.complete.sum.stat.dum) 



gender <- combine.data.complete.sum.stat[c("tucaseid", "sex")]
combine.data.complete.sum.stat.dum <- join(combine.data.complete.sum.stat.dum, gender , by="tucaseid")


# this is to expand factor variables (for the non factor variables)

treatment.dum  <- combine.data.complete.sum.stat[c("tucaseid", "treatment")]
treatment.dum$treatment <- factor(treatment.dum$treatment)
treatment.dum <- dummy.data.frame(treatment.dum) 




employment.status.dum  <- combine.data.complete.sum.stat[c("tucaseid", "employment.status")]
employment.status.dum$employment.status <- factor(employment.status.dum$employment.status)
employment.status.dum <- dummy.data.frame(employment.status.dum) 




household.own.bus.dum  <- combine.data.complete.sum.stat[c("tucaseid", "household.own.bus")]
household.own.bus.dum$household.own.bus  <- factor(household.own.bus.dum$household.own.bus)
household.own.bus.dum <- dummy.data.frame(household.own.bus.dum)



unpaid.work.family.bus.dum  <- combine.data.complete.sum.stat[c("tucaseid", "unpaid.work.family.bus")]
unpaid.work.family.bus.dum$unpaid.work.family.bus  <- factor(unpaid.work.family.bus.dum$unpaid.work.family.bus)
unpaid.work.family.bus.dum <- dummy.data.frame(unpaid.work.family.bus.dum)



children.sick.indicator.dum  <- combine.data.complete.sum.stat[c("tucaseid", "children.sick.indicator")]
children.sick.indicator.dum$children.sick.indicator  <- factor(children.sick.indicator.dum$children.sick.indicator)
children.sick.indicator.dum <- dummy.data.frame(children.sick.indicator.dum)




combine.data.complete.sum.stat.dum <- join(combine.data.complete.sum.stat.dum,treatment.dum  , by="tucaseid")
combine.data.complete.sum.stat.dum <- join(combine.data.complete.sum.stat.dum,employment.status.dum  , by="tucaseid")
combine.data.complete.sum.stat.dum <- join(combine.data.complete.sum.stat.dum,household.own.bus.dum ,by="tucaseid")
combine.data.complete.sum.stat.dum <- join(combine.data.complete.sum.stat.dum,unpaid.work.family.bus.dum ,by="tucaseid") 
combine.data.complete.sum.stat.dum <- join(combine.data.complete.sum.stat.dum,children.sick.indicator.dum ,by="tucaseid") 







xvariables <- c("total.job.wfh.time", "age", "race.edit1", "race.edit2", "race.edit3", "race.edit4", "race.edit5" ,"sexMale", "sexFemale",
                "marital.status.editMarried", "marital.status.editDivorced, separated or widowed",   "marital.status.editNever married",
                "school.level.completed.editLess than HS", "school.level.completed.editHS", "school.level.completed.editSome college/Associate Degree", "school.level.completed.editCollege or above",
                "edited.employ.statusEmployed","edited.employ.statusNot employed", "treatment0", "treatment1", "work.hours", 
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
                
                
                
                
                
                
                
                
                "household.own.bus1",
                "household.own.bus2",
                
                "unpaid.work.family.bus1",
                "unpaid.work.family.bus2",
                "num.children",
                "num.family.member",
                "age.youngest.child",

                
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
                
                "edited.family.income31",
                "edited.family.income32",
                "edited.family.income33",
                "edited.family.income34",
                "edited.family.income35",
                "edited.family.income36",
                "edited.family.income37",
                "edited.family.income38",
                "edited.family.income39",
                "edited.family.income310",
                "edited.family.income311",
                "edited.family.income312",
                "edited.family.income313",
                "edited.family.income314",
                "edited.family.income315",
                "edited.family.income316",
                
                "edited.weekly.earnings",
                "children.sick.indicator0",
                "children.sick.indicator1"
                
                
                
                
                
)

names <- c("Work from home minutes", "Age", "1 if non-Hispanic White", "1 if non-Hispanic black", "1 if Hispanic","1 if non-Hispanic Asian","1 if others", "1 if male", "1 if female",
           "1 if married", "1 if divorced, separated or widowed", "1 if never married",
           "1 if Less than HS", "1 if HS", "1 if some college/Associate Degree", "1 if college or above",
           "1 if Employed", "1 if not employed", "1 if self-employed", "1 if self-employed" ,  "Weekly work hours*", 
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
           
           
           
           
           
           "1 if someone in household own business/farm: yes",
           "1 if someone in household own business/farm: no",
           
           "1 if do unpaid work in family business/farm: yes",
           "1 if do unpaid work in family business/farm: no",
           
           "Number of children",
           "Number of family members",
           "Age of youngest child",           

           
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
           
           "Week earnings*",
           "1 if sick",
           "1 if not sick"
           
           
           
)



empty.frame <- data.frame(matrix(ncol = 5, nrow = 2)) 

z <- svydesign(id=~1, weights=~tufnwgtp, data=combine.data.complete.sum.stat.dum)
colnames(empty.frame) <-c("Variables group" ,"Variables","Mean(SD)", "Mean(SD) (Women)", "Mean(SD) (Men)") 

row <- seq(from = 1 , to = 500, by = 1)

for (i in 1:length(xvariables)) {    
  
  
  
  a <- svyby( ~get(xvariables[i]),~sex, z, svymean, na.rm = TRUE)
  b <- svyby( ~get(xvariables[i]),~sex, z, svyvar, na.rm = TRUE)
  
  c <- svymean( ~get(xvariables[i]) , z , na.rm = TRUE)
  d <- sqrt(svyvar( ~get(xvariables[i]) , z , na.rm = TRUE))
  
  
  
  
  
  
  
  empty.frame[row[i],2] <- names[i]
  empty.frame[row[i],3] <- paste0(signif(c, digits=3) ,"(",signif(d, digits = 3),")")
  
  
  empty.frame[row[i],4] <- paste0(signif(a[2,2], digits = 3) ,"(",signif(sqrt(b[2,2]), digits = 3),")")
  
  empty.frame[row[i],5] <- paste0( signif(a[1,2], digits = 3) ,"(",signif(sqrt(b[1,2]), digits = 3),")")
  
  
  
  
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









