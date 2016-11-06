



# add quotation if u input dep.var name 
table.obs.unobs <- function(data.input, dep.var) {
  
  
  #data.input$total.job.time.dum[which( data.input$total.job.time2 < 0.75 )] <- 0
  #data.input$total.job.time.dum[which( data.input$total.job.time2 >= 0.75 )] <- 1
  data.input$total.job.time.dum <- 0
  data.input$total.job.time.dum[which( data.input$total.job.time2 > 0 )] <- 1
  
  result<- lm(paste0(dep.var," ~   wfh.v3   + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  
  
  data.input$predicted.yhat <- predict(result, newdata = data.input) 
  
  
  
  
  
  a <- weighted.mean(data.input$predicted.yhat[which(data.input$total.job.time.dum == 1)], data.input$tufnwgtp[which(data.input$total.job.time.dum == 1)] , na.rm=TRUE)
  
  b <- weighted.mean(data.input$predicted.yhat[which(data.input$total.job.time.dum == 0)], data.input$tufnwgtp[which(data.input$total.job.time.dum == 0)] , na.rm=TRUE)
  
  
  
  
  
  col1 <- (a - b)/var(data.input$predicted.yhat, na.rm = TRUE)
  
  
  col2 <- var(resid(result), na.rm=TRUE)
  #col2 <- var(data.input$predicted.yhat, na.rm = TRUE)
  col3 <- (a - b)
  
  
  
  result2 <- lm(paste0("total.job.time.dum"," ~   wfh.v3   + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  
  
  
  
  
  
  
  
  variance.ratio <- var(data.input$total.job.time.dum, na.rm = TRUE)/var(resid(result2), na.rm=TRUE)
  
  col4 <- (a - b)*variance.ratio
  
  
  full.reg <- lm(paste0(dep.var," ~   wfh.v3 + total.job.time.dum  + edited.occupations + work.hours.last.week+ edited.work.hours + factor(edited.work.hours.indicator) + factor(treatment)", demographic.no.sex.var , family.bus, family.var, time.var, location.var, spouse.var, earnings.var, family.inc.var,  children.sick.var), data = data.input , weights = tufnwgtp )
  
  
  
  
  
  wfh.coeff <- summary(full.reg)$coefficients[3, 1]
  
  col5 <- wfh.coeff
  col6 <-  wfh.coeff/ ((a - b)*variance.ratio)
  col7 <- summary(full.reg)$adj.r.squared
  
  result.array <-array(0,7)
  
  
  result.array[1] <- col1
  result.array[2] <- col2 
  result.array[3] <- col3
  result.array[4] <- col4
  result.array[5] <- col5
  result.array[6] <- col6
  result.array[7] <- col7
  return(result.array)
  
}












# total primary + secondary

combine.data.complete.regress.female.employ.temp <- combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$wfh.v3 <=1 ),]


combine.data.complete.regress.female.employ.temp.under13 <- combine.data.complete.regress.female.employ.temp[which(combine.data.complete.regress.female.employ.temp$age.youngest.child < 13 & combine.data.complete.regress.female.employ.temp$interview.year != "2003"),]

combine.data.complete.regress.female.employ.under13.v2 <- combine.data.complete.regress.female.employ[which(combine.data.complete.regress.female.employ$age.youngest.child < 13 & combine.data.complete.regress.female.employ$interview.year != "2003"),]





# all other variables
empty.frame.total <- data.frame(matrix(ncol = 8, nrow = length(yvariables.v3))) 


for (i in 1:length(yvariables.v3)) {
  dep.var <-  yvariables.v3[i]
  if (dep.var == "sec.child.care.hh" | dep.var == "total.time.child.prim.sec" | dep.var == "portion.sec.child.care.hh" | dep.var == "sec.child.care_total.job" | dep.var == "sec.child.care_social.act" | dep.var == "sec.child.care_house.act" | dep.var == "sec.child.care_eat.drink") {
    result.all <- table.obs.unobs(combine.data.complete.regress.female.employ.temp.under13 , yvariables.v3[i])
  } else {
    result.all <- table.obs.unobs(combine.data.complete.regress.female.employ.temp, yvariables.v3[i])
  }
  
  for (j in 1:7) {
    empty.frame.total[i,j+1] <- round(result.all[j], digits = 3)
    empty.frame.total[i,1] <- names.y[i]
  }
  
}

empty.frame.total$diff <- empty.frame.total$X6 - empty.frame.total$X5 

empty.frame.total <- empty.frame.total[,c(1,2, 3, 4,5,6,7,9,8)]


print(xtable(empty.frame.total, caption = "OLS Results of Working from Home and Marginal Effect of Maternal Employment",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )


# for presentation 

ME.bias.table <- data.frame(cbind( empty.frame.total$X5, empty.frame.total$X6, empty.frame.total$X8), stringsAsFactors = FALSE)
ME.bias.table$true.value.ME <- ME.bias.table$X2  - ME.bias.table$X1

ME.bias.table <- data.frame(cbind( empty.frame.total$X1, ME.bias.table))


ME.bias.table <- ME.bias.table[,c(1,2, 3, 5,4)]

print(xtable(ME.bias.table, caption = "OLS Results of Working from Home and Marginal Effect of Maternal Employment",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )



# for comparison of wfh and maternal employment 


all.table <- data.frame(cbind(wfh.bias.table , ME.bias.table))

all.table$total.effect.low.bound <- all.table$true.value.wfh + all.table$true.value.ME

all.table.total <- data.frame(cbind(empty.frame.total$X1, wfh.bias.table$true.value.wfh, ME.bias.table$true.value.ME, all.table$total.effect.low.bound ))


print(xtable(all.table.total, caption = "OLS Results of Working from Home and Marginal Effect of Maternal Employment",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )


























# total primary + secondary

combine.data.complete.regress.male.employ.temp <- combine.data.complete.regress.male.employ[which(combine.data.complete.regress.male.employ$wfh.v3 <=1 ),]


combine.data.complete.regress.male.employ.temp.under13 <- combine.data.complete.regress.male.employ.temp[which(combine.data.complete.regress.male.employ.temp$age.youngest.child < 13 & combine.data.complete.regress.male.employ.temp$interview.year != "2003"),]

combine.data.complete.regress.male.employ.under13.v2 <- combine.data.complete.regress.male.employ[which(combine.data.complete.regress.male.employ$age.youngest.child < 13 & combine.data.complete.regress.male.employ$interview.year != "2003"),]





# all other variables
empty.frame.total <- data.frame(matrix(ncol = 8, nrow = length(yvariables.v3))) 


for (i in 1:length(yvariables.v3)) {
  dep.var <-  yvariables.v3[i]
  if (dep.var == "sec.child.care.hh" | dep.var == "total.time.child.prim.sec" | dep.var == "portion.sec.child.care.hh" | dep.var == "sec.child.care_total.job" | dep.var == "sec.child.care_social.act" | dep.var == "sec.child.care_house.act" | dep.var == "sec.child.care_eat.drink") {
    result.all <- table.obs.unobs(combine.data.complete.regress.male.employ.temp.under13 , yvariables.v3[i])
  } else {
    result.all <- table.obs.unobs(combine.data.complete.regress.male.employ.temp, yvariables.v3[i])
  }
  
  for (j in 1:7) {
    empty.frame.total[i,j+1] <- round(result.all[j], digits = 3)
    empty.frame.total[i,1] <- names.y[i]
  }
  
}


empty.frame.total$diff <- empty.frame.total$X6 - empty.frame.total$X5 

empty.frame.total <- empty.frame.total[,c(1,2, 3, 4,5,6,7,9,8)]


print(xtable(empty.frame.total, caption = "OLS Results of Working from Home and Marginal Effect of Paternal Employment",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )





# for presentation 


PE.bias.table <- data.frame(cbind( empty.frame.total$X5, empty.frame.total$X6, empty.frame.total$X8), stringsAsFactors = FALSE)
PE.bias.table$true.value.PE <- PE.bias.table$X2  - PE.bias.table$X1

PE.bias.table <- data.frame(cbind( empty.frame.total$X1, PE.bias.table))


PE.bias.table <- PE.bias.table[,c(1,2, 3, 5,4)]

print(xtable(PE.bias.table, caption = "OLS Results of Working from Home and Marginal Effect of Paternal Employment",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )





# for comparison of wfh and Paternal employment 



all.table <- data.frame(cbind(wfh.bias.table.fathers , PE.bias.table))

all.table$total.effect.low.bound <- all.table$true.value.wfh + all.table$true.value.PE

all.table.total <- data.frame(cbind(empty.frame.total$X1, wfh.bias.table.fathers$true.value.wfh, PE.bias.table$true.value.PE, all.table$total.effect.low.bound ))


print(xtable(all.table.total, caption = "OLS Results of Working from Home and Marginal Effect of Paternal Employment",   digits=3) ,include.rownames = FALSE, include.colnames = TRUE  )




