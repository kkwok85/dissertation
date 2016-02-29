# check where did the time save from work from home


combine.combine.reg.atussum <- join(combine.data.regress.v2$wfh.v3,atussum, by=c("tucaseid"), type = "left")


result.wfh.vs.not.wfh <- data.frame(c(0),c(0),c(0))
colnames(result.wfh.vs.not.wfh) <- c("star", "estimate", "var.name")


for (i in 89:length(names(combine.combine.reg.atussum))) {
  result <- lm(combine.combine.reg.atussum[,i] ~ wfh.v2, data = combine.combine.reg.atussum , weights = tufnwgtp )
  star <- summary(result)$coefficients[2,4] <= .1
  estimate <- summary(result)$coefficients[2,1]
  result.wfh.vs.not.wfh[i-88,1]<- star
  result.wfh.vs.not.wfh[i-88,2]<- estimate
  result.wfh.vs.not.wfh[i-88,3]<- names(combine.combine.reg.atussum[i])
  
}





result.wfh.vs.not.wfh.order <- result.wfh.vs.not.wfh[order(result.wfh.vs.not.wfh$estimate),] 


result.wfh.vs.not.wfh.order <- result.wfh.vs.not.wfh[order(-result.wfh.vs.not.wfh$estimate),] 





svyttest(formula, design, ...)











# check where did the time save from work from home


combine.combine.reg.atussum <- join(combine.data.regress.v2,atussum, by=c("tucaseid"), type = "left")


result.wfh.vs.not.wfh <- data.frame(c(0),c(0),c(0))
colnames(result.wfh.vs.not.wfh) <- c("star", "estimate", "var.name")


for (i in 89:length(names(combine.combine.reg.atussum))) {
  result <- lm(combine.combine.reg.atussum[,i] ~ hourly.status, data = combine.combine.reg.atussum, weights = tufnwgtp )
  star <- summary(result)$coefficients[2,4] <= .1
  estimate <- summary(result)$coefficients[2,1]
  result.wfh.vs.not.wfh[i-88,1]<- star
  result.wfh.vs.not.wfh[i-88,2]<- estimate
  result.wfh.vs.not.wfh[i-88,3]<- names(combine.combine.reg.atussum[i])
  
}





result.wfh.vs.not.wfh.order <- result.wfh.vs.not.wfh[order(result.wfh.vs.not.wfh$estimate),] 


result.wfh.vs.not.wfh.order <- result.wfh.vs.not.wfh[order(-result.wfh.vs.not.wfh$estimate),] 