# estimate miner equation and impute for self-employed



combine.data$school.years <- as.numeric(c(""))

combine.data$school.years[which(combine.data$school.level.completed == 31)] <- 1
combine.data$school.years[which(combine.data$school.level.completed == 32)] <- 2
combine.data$school.years[which(combine.data$school.level.completed == 33)] <- 5.5
combine.data$school.years[which(combine.data$school.level.completed == 34)] <- 7.5
combine.data$school.years[which(combine.data$school.level.completed == 35)] <- 9
combine.data$school.years[which(combine.data$school.level.completed == 36)] <- 10
combine.data$school.years[which(combine.data$school.level.completed == 37)] <- 11
combine.data$school.years[which(combine.data$school.level.completed == 38)] <- 12
combine.data$school.years[which(combine.data$school.level.completed == 39)] <- 12
combine.data$school.years[which(combine.data$school.level.completed == 40)] <- 14
combine.data$school.years[which(combine.data$school.level.completed == 41)] <- 14
combine.data$school.years[which(combine.data$school.level.completed == 42)] <- 14
combine.data$school.years[which(combine.data$school.level.completed == 43)] <- 16
combine.data$school.years[which(combine.data$school.level.completed == 44)] <- 18
combine.data$school.years[which(combine.data$school.level.completed == 45)] <- 20
combine.data$school.years[which(combine.data$school.level.completed == 46)] <- 21

combine.data$school.years[which(combine.data$school.level.completed == "")] <- NA

head(combine.data[,c("school.years","school.level.completed")], n = 10)




combine.data$experience.years <- as.numeric(c(""))
combine.data$experience.years <- combine.data$age - combine.data$school.years - 6
combine.data$experience.years[which(combine.data$experience.years < 0)] <- 0



head(combine.data[,c("school.years","age", "experience.years")], n = 10)


combine.data$experience.years_sq <- combine.data$experience.years*combine.data$experience.years
combine.data$age_sq <- combine.data$age*combine.data$age

combine.data$ln_wage <- log(combine.data$weekly.earnings/100)
combine.data$ln_wage[which(combine.data$ln_wage== "-Inf")] <- 0
combine.data$ln_wage[which(combine.data$edited.occupations== "Not employed")] <- 0




# check the data

table(combine.data$school.years)

table(combine.data$age)
table(combine.data$experience.years)  # make sure it has no zero





# all unemployed are NA
head( combine.data.complete$weekly.earnings[which(combine.data.complete$employment.status==5)], n = 10)

head(combine.data.complete$weekly.earnings[which(combine.data.complete$edited.occupations== "Not employed")])

head(combine.data.complete$ln_wage[which(combine.data.complete$edited.occupations== "Not employed")])





# http://www.nber.org/papers/w4259.pdf

# https://tel.archives-ouvertes.fr/tel-00780563v1/document

#full.model <- lm( ln_wage ~ school.years + experience.years + experience.years_sq +   age + age_sq + marital.status.edit + 
#                   + region + fips + edited.occupations + num.children + num.family.member + interview.year , data = combine.data.complete , weights = tufnwgtp )

full.model <- lm( ln_wage ~ school.years + experience.years + experience.years_sq +   age + age_sq + marital.status.edit + 
                    + fips + edited.occupations + num.children + num.family.member + interview.year , data = combine.data , weights = tufnwgtp )

combine.data$predicted.wage <- predict(full.model, combine.data, weights = tufnwgtp )



#combine.data.complete$predicted.wage <- predict(full.model, combine.data.complete, weights = tufnwgtp )
#head(combine.data.complete[,c("predicted.wage","ln_wage" )], n = 100)



combine.data$treatment <- as.numeric(c(""))
combine.data$treatment[which(combine.data$class.worker == 6 | combine.data$class.worker == 7)] <- 1
combine.data$treatment[which(combine.data$class.worker == 1 | combine.data$class.worker == 2 |
                               combine.data$class.worker == 3 | combine.data$class.worker == 4 |
                             combine.data$class.worker == 5 | combine.data$class.worker == 8 | 
                               combine.data$employment.status == 3 | combine.data$employment.status == 4 |
                               combine.data$employment.status == 5)] <- 0

# checking: these 2 numbers are the same
#table(combine.data$employment.status)
#table( combine.data$treatment)




################################## re-run the complete data set and otehr dataset


rr  <- Match(Y=NULL, Tr=combine.data.complete$treatment, X=combine.data.complete$predicted.wage, M=10, ties=F, caliper=0.5);

#matched <- rbind(combine.data.complete[rr$index.treated,], combine.data.complete[rr$index.control,])


# http://stackoverflow.com/questions/27695784/r-obtain-the-matched-data-set-from-matching-package-not-that-easy

head(rr$index.treated)
head(rr$index.control)
#their predicted wage are similar
combine.data.complete[7,c("treatment", "predicted.wage")]
combine.data.complete[68512,c("treatment", "predicted.wage")]


dfTC = data.frame(idxTreated = rr$index.treated, idxControl = rr$index.control,
                  numControl = factor(rep(1:10), labels = paste0("Control", 1:10)))
dfTCWide = reshape2::dcast(dfTC, idxTreated ~ numControl,
                           value.var = "idxControl")







# get the attributes for the treated

for (i in 1:nrow(dfTCWide)) {
  dfTCWide$idxTreated.school.years[i] <- combine.data.complete[ dfTCWide[i,1], c("school.years")]
  dfTCWide$idxTreated.experience.years[i] <- combine.data.complete[ dfTCWide[i,1], c("experience.years")]
  dfTCWide$idxTreated.age[i] <- combine.data.complete[ dfTCWide[i,1], c("age")]
  dfTCWide$idxTreated.marital.status.edit[i] <- combine.data.complete[ dfTCWide[i,1], c("marital.status.edit")]
  dfTCWide$idxTreated.fips[i] <- combine.data.complete[ dfTCWide[i,1], c("fips")]
  dfTCWide$idxTreated.edited.occupations[i] <- combine.data.complete[ dfTCWide[i,1], c("edited.occupations")]
  dfTCWide$idxTreated.num.children[i] <- combine.data.complete[ dfTCWide[i,1], c("num.children")]
  dfTCWide$idxTreated.num.family.member[i] <- combine.data.complete[ dfTCWide[i,1], c("num.family.member")]
  
  
}



dfTCWide$Control1.school.years <- NA
dfTCWide$Control1.experience.years<- NA
dfTCWide$Control1.age <- NA
dfTCWide$Control1.marital.status.edit <- NA
dfTCWide$Control1.fips <- NA
dfTCWide$Control1.edited.occupations<- NA
dfTCWide$Control1.num.children <- NA
dfTCWide$Control1.num.family.member <- NA

dfTCWide$Control2.school.years <- NA
dfTCWide$Control2.experience.years<- NA
dfTCWide$Control2.age <- NA
dfTCWide$Control2.marital.status.edit <- NA
dfTCWide$Control2.fips <- NA
dfTCWide$Control2.edited.occupations<- NA
dfTCWide$Control2.num.children <- NA
dfTCWide$Control2.num.family.member <- NA



dfTCWide$Control3.school.years <- NA
dfTCWide$Control3.experience.years<- NA
dfTCWide$Control3.age <- NA
dfTCWide$Control3.marital.status.edit <- NA
dfTCWide$Control3.fips <- NA
dfTCWide$Control3.edited.occupations<- NA
dfTCWide$Control3.num.children <- NA
dfTCWide$Control3.num.family.member <- NA



dfTCWide$Control4.school.years <- NA
dfTCWide$Control4.experience.years<- NA
dfTCWide$Control4.age <- NA
dfTCWide$Control4.marital.status.edit <- NA
dfTCWide$Control4.fips <- NA
dfTCWide$Control4.edited.occupations<- NA
dfTCWide$Control4.num.children <- NA
dfTCWide$Control4.num.family.member <- NA


dfTCWide$Control5.school.years <- NA
dfTCWide$Control5.experience.years<- NA
dfTCWide$Control5.age <- NA
dfTCWide$Control5.marital.status.edit <- NA
dfTCWide$Control5.fips <- NA
dfTCWide$Control5.edited.occupations<- NA
dfTCWide$Control5.num.children <- NA
dfTCWide$Control5.num.family.member <- NA



dfTCWide$Control6.school.years <- NA
dfTCWide$Control6.experience.years<- NA
dfTCWide$Control6.age <- NA
dfTCWide$Control6.marital.status.edit <- NA
dfTCWide$Control6.fips <- NA
dfTCWide$Control6.edited.occupations<- NA
dfTCWide$Control6.num.children <- NA
dfTCWide$Control6.num.family.member <- NA



dfTCWide$Control7.school.years <- NA
dfTCWide$Control7.experience.years<- NA
dfTCWide$Control7.age <- NA
dfTCWide$Control7.marital.status.edit <- NA
dfTCWide$Control7.fips <- NA
dfTCWide$Control7.edited.occupations<- NA
dfTCWide$Control7.num.children <- NA
dfTCWide$Control7.num.family.member <- NA


dfTCWide$Control8.school.years <- NA
dfTCWide$Control8.experience.years<- NA
dfTCWide$Control8.age <- NA
dfTCWide$Control8.marital.status.edit <- NA
dfTCWide$Control8.fips <- NA
dfTCWide$Control8.edited.occupations<- NA
dfTCWide$Control8.num.children <- NA
dfTCWide$Control8.num.family.member <- NA


dfTCWide$Control9.school.years <- NA
dfTCWide$Control9.experience.years<- NA
dfTCWide$Control9.age <- NA
dfTCWide$Control9.marital.status.edit <- NA
dfTCWide$Control9.fips <- NA
dfTCWide$Control9.edited.occupations<- NA
dfTCWide$Control9.num.children <- NA
dfTCWide$Control9.num.family.member <- NA




dfTCWide$Control10.school.years <- NA
dfTCWide$Control10.experience.years<- NA
dfTCWide$Control10.age <- NA
dfTCWide$Control10.marital.status.edit <- NA
dfTCWide$Control10.fips <- NA
dfTCWide$Control10.edited.occupations<- NA
dfTCWide$Control10.num.children <- NA
dfTCWide$Control10.num.family.member <- NA












col <- seq(from = 20, to = 92, by = 8)

for (j in 1:10)  {
  

  for (i in 1:nrow(dfTCWide)) {
    print(i)
    print(j)
   
    dfTCWide[i,col[j]] <- combine.data.complete[ dfTCWide[i,j+1], c("school.years")]
    dfTCWide[i,col[j]+1] <- combine.data.complete[ dfTCWide[i,j+1], c("experience.years")]
    dfTCWide[i,col[j]+2] <- combine.data.complete[ dfTCWide[i,j+1], c("age")]
    dfTCWide[i,col[j]+3] <- combine.data.complete[ dfTCWide[i,j+1], c("marital.status.edit")]
    dfTCWide[i,col[j]+4] <- combine.data.complete[ dfTCWide[i,j+1], c("fips")]
    dfTCWide[i,col[j]+5] <- combine.data.complete[ dfTCWide[i,j+1], c("edited.occupations")]
    dfTCWide[i,col[j]+6] <- combine.data.complete[ dfTCWide[i,j+1], c("num.children")]
    dfTCWide[i,col[j]+7] <- combine.data.complete[ dfTCWide[i,j+1], c("num.family.member")]
    
  
  }


}








head(dfTCWide)










find.match.function <- function(num.row ){


test <- reshape(dfTCWide[num.row,], 
             varying = list(c("idxTreated", "Control1", "Control2", "Control3", "Control4", "Control5",
                         "Control6", "Control7", "Control8", "Control9", "Control10"),
                         c("idxTreated.school.years", "Control1.school.years", "Control2.school.years",
                           "Control3.school.years", "Control4.school.years", "Control5.school.years", 
                           "Control6.school.years", "Control7.school.years", "Control8.school.years",
                           "Control9.school.years", "Control10.school.years"),
                         c("idxTreated.experience.years", "Control1.experience.years", "Control2.experience.years",
                           "Control3.experience.years", "Control4.experience.years", "Control5.experience.years", 
                           "Control6.experience.years", "Control7.experience.years", "Control8.experience.years",
                           "Control9.experience.years", "Control10.experience.years"),
                         c("idxTreated.age", "Control1.age", "Control2.age",
                           "Control3.age", "Control4.age", "Control5.age", 
                           "Control6.age", "Control7.age", "Control8.age",
                           "Control9.age", "Control10.age"),
                         c("idxTreated.marital.status.edit", "Control1.marital.status.edit", "Control2.marital.status.edit",
                           "Control3.marital.status.edit", "Control4.marital.status.edit", "Control5.marital.status.edit", 
                           "Control6.marital.status.edit", "Control7.marital.status.edit", "Control8.marital.status.edit",
                           "Control9.marital.status.edit", "Control10.marital.status.edit"),
                         c("idxTreated.fips", "Control1.fips", "Control2.fips",
                           "Control3.fips", "Control4.fips", "Control5.fips", 
                           "Control6.fips", "Control7.fips", "Control8.fips",
                           "Control9.fips", "Control10.fips"),
                         c("idxTreated.edited.occupations", "Control1.edited.occupations", "Control2.edited.occupations",
                           "Control3.edited.occupations", "Control4.edited.occupations", "Control5.edited.occupations", 
                           "Control6.edited.occupations", "Control7.edited.occupations", "Control8.edited.occupations",
                           "Control9.edited.occupations", "Control10.edited.occupations"),
                         c("idxTreated.num.children", "Control1.num.children", "Control2.num.children",
                           "Control3.num.children", "Control4.num.children", "Control5.num.children", 
                           "Control6.num.children", "Control7.num.children", "Control8.num.children",
                           "Control9.num.children", "Control10.num.children"),
                         c("idxTreated.num.family.member", "Control1.num.family.member", "Control2.num.family.member",
                           "Control3.num.family.member", "Control4.num.family.member", "Control5.num.family.member", 
                           "Control6.num.family.member", "Control7.num.family.member", "Control8.num.family.member",
                           "Control9.num.family.member", "Control10.num.family.member")
             ),
             v.names = c("Control","school.years","experience.years", "age", "marital.status.edit", "fips", "edited.occupations",
                         "num.children", "num.family.member"),
             times = c(1:11),  
             direction = "long")





test$treatment <- 0 
test$treatment[which(test$time == 1)] <- 1



test2 <-  Match(Y=NULL, Tr=test$treatment, X=cbind(test$school.years ,test$experience.years, test$age, test$marital.status.edit,
                                                   test$fips, test$edited.occupations, test$num.children, test$num.family.member) , M=1, ties=F);



index.control.combine.data.complete <- test[test2$index.control, "Control"]


return(combine.data.complete[index.control.combine.data.complete , "weekly.earnings"])

}




#table(combine.data.complete$class.worker)
#table(combine.data.complete$weekly.earnings[which(combine.data.complete$class.worker == 6   )])

#combine.data.complete[which(combine.data.complete$class.worker == 6 | combine.data.complete$class.worker == 7 ) ]


combine.data.complete$edited.weekly.earnings <- NA

for (i in 1:nrow(dfTCWide))  {
  combine.data.complete[dfTCWide$idxTreated[i] , "edited.weekly.earnings"] <- find.match.function(i)
  
}



table(combine.data.complete$weekly.earnings[which(combine.data.complete$class.worker == 8  )])

combine.data.complete$edited.weekly.earnings[which(combine.data.complete$class.worker == 8  )] <- 0 



table(combine.data.complete$employment.status[which(combine.data.complete$employment.status>2)],combine.data.complete$weekly.earnings[which(combine.data.complete$employment.status>2)] )

combine.data.complete$edited.weekly.earnings[which(combine.data.complete$employment.status>2)] <- 0 



combine.data.complete$edited.weekly.earnings <-  combine.data.complete$weekly.earnings


combine.data.complete$edited.weekly.earnings.indicator <- 0
combine.data.complete$edited.weekly.earnings.indicator[is.na(combine.data.complete$weekly.earnings)] <- 1 
table(combine.data$edited.weekly.earnings.indicator)



#http://www.r-bloggers.com/using-the-r-matchit-package-for-propensity-score-analysis/


###################### family income #########
#head(combine.data.complete[,c("edited.family.income", "family.income")], n = 10) 


combine.data.complete$edited.family.income3 <- combine.data.complete$family.income 


combine.data.complete$edited.family.income3[which(is.na(combine.data.complete$edited.family.income3 ) == TRUE)] <- combine.data.complete$edited.family.income[which(is.na(combine.data.complete$edited.family.income3 ) == TRUE)]

# check
tail(combine.data.complete[,c("edited.family.income", "family.income", "edited.family.income3")], n = 10)   



length(which(is.na(combine.data.complete$edited.family.income3 )==TRUE ))
# 13698: it is fine

