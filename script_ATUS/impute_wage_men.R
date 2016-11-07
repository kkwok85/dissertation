############################################################################################################################################################################################
############################################################################################################################################################################################
# This impute_wage_men.R script is responsible for imputing weekly wage variables for men
# I assume you have the data and have already run clean_data.R to clean the data
# Note: treatment observation = respondents who are self-employed, control observation = respondents who are employed by firms)
# The whole idea is to first find 10 controls that have the closest predicted earnings to the predicted earning of each treatment observations. 
# Then find the control observation that matches (in terms of attributes) the treatment observation the best. Then use the true value(not the predicted value) of the best match control 
# to impute the treatment observations
############################################################################################################################################################################################
############################################################################################################################################################################################













############ match treatement observations with controls. "Match" function will calcuate everything for you  ############

rr  <- Match(Y=NULL, Tr=combine.data.complete.regress.male.employ$treatment, X=combine.data.complete.regress.male.employ$predicted.wage, M=10, ties=F, caliper=0.5);





############ find 10 controls for each treatment observations ############

dfTC = data.frame(idxTreated = rr$index.treated, idxControl = rr$index.control,
                  numControl = factor(rep(1:10), labels = paste0("Control", 1:10)))
dfTCWide = reshape2::dcast(dfTC, idxTreated ~ numControl,
                           value.var = "idxControl")







############ get the attributes for each treatment observations ############

for (i in 1:nrow(dfTCWide)) {
  dfTCWide$idxTreated.school.years[i] <- combine.data.complete.regress.male.employ[ dfTCWide[i,1], c("school.years")]
  dfTCWide$idxTreated.experience.years[i] <- combine.data.complete.regress.male.employ[ dfTCWide[i,1], c("experience.years")]
  dfTCWide$idxTreated.age[i] <- combine.data.complete.regress.male.employ[ dfTCWide[i,1], c("age")]
  dfTCWide$idxTreated.marital.status.edit[i] <- combine.data.complete.regress.male.employ[ dfTCWide[i,1], c("marital.status.edit")]
  dfTCWide$idxTreated.fips[i] <- combine.data.complete.regress.male.employ[ dfTCWide[i,1], c("fips")]
  dfTCWide$idxTreated.edited.occupations[i] <- combine.data.complete.regress.male.employ[ dfTCWide[i,1], c("edited.occupations")]
  dfTCWide$idxTreated.num.children[i] <- combine.data.complete.regress.male.employ[ dfTCWide[i,1], c("num.children")]
  dfTCWide$idxTreated.num.family.member[i] <- combine.data.complete.regress.male.employ[ dfTCWide[i,1], c("num.family.member")]
  
  
}


############ create empty variables so as to put in the attributes for the controls ############

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









############  put in the attributes for the controls ############



col <- seq(from = 20, to = 92, by = 8)

for (j in 1:10)  {
  
  
  for (i in 1:nrow(dfTCWide)) {
    print(i)
    print(j)
    
    dfTCWide[i,col[j]] <- combine.data.complete.regress.male.employ[ dfTCWide[i,j+1], c("school.years")]
    dfTCWide[i,col[j]+1] <- combine.data.complete.regress.male.employ[ dfTCWide[i,j+1], c("experience.years")]
    dfTCWide[i,col[j]+2] <- combine.data.complete.regress.male.employ[ dfTCWide[i,j+1], c("age")]
    dfTCWide[i,col[j]+3] <- combine.data.complete.regress.male.employ[ dfTCWide[i,j+1], c("marital.status.edit")]
    dfTCWide[i,col[j]+4] <- combine.data.complete.regress.male.employ[ dfTCWide[i,j+1], c("fips")]
    dfTCWide[i,col[j]+5] <- combine.data.complete.regress.male.employ[ dfTCWide[i,j+1], c("edited.occupations")]
    dfTCWide[i,col[j]+6] <- combine.data.complete.regress.male.employ[ dfTCWide[i,j+1], c("num.children")]
    dfTCWide[i,col[j]+7] <- combine.data.complete.regress.male.employ[ dfTCWide[i,j+1], c("num.family.member")]
    
    
  }
  
  
}















############  create a function that can find the best match to the treatment observations among the 10 controls, then use the true value of the control observations (not the predicted value) ############


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
  
  
  
  index.control.combine.data.complete.regress.male.employ <- test[test2$index.control, "Control"]
  
  
  return(combine.data.complete.regress.male.employ[index.control.combine.data.complete.regress.male.employ , "weekly.earnings"])
  
}





############  impute weekly earnings ############

# create a empty variable
combine.data.complete.regress.male.employ$edited.weekly.earnings <- NA

# impute the treatment observations
for (i in 1:nrow(dfTCWide))  {
  combine.data.complete.regress.male.employ[dfTCWide$idxTreated[i] , "edited.weekly.earnings"] <- find.match.function(i)
  
}



# put weekly earning = 0 if the worker is self-employed without pay
combine.data.complete.regress.male.employ$edited.weekly.earnings[which(combine.data.complete.regress.male.employ$class.worker == 8  )] <- 0 



# put weekly earning = 0 if the worker is unemployed
combine.data.complete.regress.male.employ$edited.weekly.earnings[which(combine.data.complete.regress.male.employ$employment.status>2)] <- 0 


# put the original weekly earning data into the new weekly earning variable
combine.data.complete.regress.male.employ$edited.weekly.earnings[which(is.na(combine.data.complete.regress.male.employ$weekly.earnings)==FALSE)] <-  combine.data.complete.regress.male.employ$weekly.earnings[which(is.na(combine.data.complete.regress.male.employ$weekly.earnings)==FALSE)]

# divide the weekly earning by 100 so that the unit makes more sense

combine.data.complete.regress.male.employ$edited.weekly.earnings <- combine.data.complete.regress.male.employ$edited.weekly.earnings/100


# generate impute indicator variable
combine.data.complete.regress.male.employ$edited.weekly.earnings.indicator <- 0
combine.data.complete.regress.male.employ$edited.weekly.earnings.indicator[is.na(combine.data.complete.regress.male.employ$weekly.earnings)==TRUE] <- 1 






