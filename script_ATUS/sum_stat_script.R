library(plyr)

#### summary statistics #### 



stargazer(combine.data.regress[yvariables], type="latex", digits=3, title = "Summary Statistics for dependent variables",
          covariate.labels = c("Total time for caring and helping children",
                               "Grocery shopping", "Food and drink preparation", "Purchasing food",
                               "Play with children", "Play sports with children", 
                               "Provide medical care to children", "Obtain medical care for children",
                               "Reading to children", "Talk and listen to children",
                               "organization and plan for children", "Help homework for children",
                               "Home schooling", "Supervising children"
          ), out = "D:/ATUS_result_R/sum_stat_dep_var.tex" )





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

