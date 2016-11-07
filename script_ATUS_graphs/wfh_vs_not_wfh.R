combine.data.regress.graph  <- join(combine.data.regress.v2,atussum, by=c("tucaseid"), type = "left")

#combine.data.regress.graph  <- join(combine.data,atussum, by=c("tucaseid"), type = "left")


# check where did the time save from work from home




#result.wfh.vs.not.wfh <- data.frame(c(0),c(0),c(0))
#colnames(result.wfh.vs.not.wfh) <- c("star", "estimate", "var.name")

#start.num <- match("t010101",names(combine.data.regress.graph))

#for (i in start.num:length(names(combine.data.regress.graph))) {
#  result <- lm(combine.data.regress.graph[,i] ~ wfh.v3, data = combine.data.regress.graph, weights = tufnwgtp )
#  star <- summary(result)$coefficients[2,4] <= .1
# estimate <- summary(result)$coefficients[2,1]
#  result.wfh.vs.not.wfh[i-(start.num-1),1]<- star
#  result.wfh.vs.not.wfh[i-(start.num-1),2]<- estimate
#  result.wfh.vs.not.wfh[i-(start.num-1),3]<- names(combine.data.regress.graph[i])
  
#}





#result.wfh.vs.not.wfh.order <- result.wfh.vs.not.wfh[order(result.wfh.vs.not.wfh$estimate),] 


#result.wfh.vs.not.wfh.order <- result.wfh.vs.not.wfh[order(-result.wfh.vs.not.wfh$estimate),] 






#### rmb to covert the formula into formula object, otherwise svyttest wont work
# svyttest(as.formula(paste0(name, '~ I(wfh.v3 =="1")' )), design=z)



z <- svydesign(id=~1, weights=~tufnwgtp, data=combine.data.regress.graph)



start.num <- match("t010101",names(combine.data.regress.graph))
end.num <- match("t509989",names(combine.data.regress.graph))



result.wfh.vs.not.wfh <- data.frame(c(0),c(0),c(0), c(0), c(0))
colnames(result.wfh.vs.not.wfh) <- c( "var.name","ols.star", "ols.estimate", "mean.diff.test.etimate", "pvalue")


for (i in start.num:end.num) {
  result <- lm(combine.data.regress.graph[,i] ~ wfh.v3, data = combine.data.regress.graph, weights = tufnwgtp )
  star <- summary(result)$coefficients[2,4] <= .1
  estimate <- summary(result)$coefficients[2,1]
  name <- names(combine.data.regress.graph[i])
  
  ttest.result <- svyttest(as.formula(paste0(name, '~ I(wfh.v3 =="1")' )), design=z)
  ttest.estimate  <- ttest.result$estimate
  ttest.pvalue  <- ttest.result$p.value
  
  
  result.wfh.vs.not.wfh[i-(start.num-1),1]<- names(combine.data.regress.graph[i])
  result.wfh.vs.not.wfh[i-(start.num-1),2]<- star
  result.wfh.vs.not.wfh[i-(start.num-1),3]<- estimate
  result.wfh.vs.not.wfh[i-(start.num-1),4]<- ttest.estimate
  result.wfh.vs.not.wfh[i-(start.num-1),5]<- ttest.pvalue 
  
  
  
}

result.wfh.vs.not.wfh$ttest.star <- 0
result.wfh.vs.not.wfh$ttest.star[which(result.wfh.vs.not.wfh$pvalue <=0.1)] <- 1



result.wfh.vs.not.wfh.order.save <- result.wfh.vs.not.wfh[order(result.wfh.vs.not.wfh$mean.diff.test.etimate),] 
graph1 <- result.wfh.vs.not.wfh.order.save$mean.diff.test.etimate[c(1:3,5,7)] # change this when change the data
graph1 <- t(as.data.frame(graph1))

name <- c("Travel to work", "TV/movies", "Grooming", "Relax, thinking", "Research/Homework for class")
colnames(graph1) <- name

graph1  <- graph1[,c(5,4,3,2,1)]

par(mar=c(5,15,4,2))

barplot(graph1 , las=2 , horiz = TRUE, xlab= "Time in minutes")

#title(main = "Top 5 activities (6-digit level activity)\n that save the most time from work from home")




result.wfh.vs.not.wfh.order.spend <- result.wfh.vs.not.wfh[order(-result.wfh.vs.not.wfh$mean.diff.test.etimate),] 
graph2 <- result.wfh.vs.not.wfh.order.spend$mean.diff.test.etimate[c(1:5)]
graph2 <- t(as.data.frame(graph2))

name <- c("Physical care: child", "Work: other jobs", "Cooking", "Reading for interest", "Eat and drink")
colnames(graph2) <- name
graph2  <- graph2[,c(5,4,3,2,1)]


par(mar=c(5,15,4,2))

barplot(graph2 , las=2 , horiz = TRUE, xlab= "Time in minutes")

#title(main = "Top 5 activities (6-digit level activity) \n work from home people spend extra time on")




total.data <- subset(combine.data.regress.graph, select=c( tucaseid, tufnwgtp, wfh.v3 , total01:total18) ) 

total.var <- c("total01","total02","total03","total04","total05","total06","total07",
               "total08","total09", "total10", "total11","total12","total13","total14","total15","total16","total18"  )
z1 <- svydesign(id=~1, weights=~tufnwgtp, data=total.data)


total.data.wavg <- data.frame()
odd.num <- seq(1, 99, 2)

for (i in 1:length(total.var)) {
  row.num <- odd.num[i]
  
  total.data.wavg[row.num,1] <- total.var[i]
  total.data.wavg[row.num,2] <- svyby( ~get(total.var [i]),~wfh.v3, z1, svymean, na.rm = TRUE)[1,2]
  total.data.wavg[row.num,3] <- 0
  
  total.data.wavg[row.num+1,1] <- total.var[i]
  total.data.wavg[row.num+1,2] <- svyby( ~get(total.var [i]),~wfh.v3, z1, svymean, na.rm = TRUE)[2,2]
  total.data.wavg[row.num+1,3] <- 1
  
  
  
}


colnames(total.data.wavg) <- c("activities","w.avg","wfh.v3")




ggplot(total.data.wavg,aes(x=factor(activities),y=w.avg,fill=factor(wfh.v3)), color=factor(wfh.v3)) + 
  geom_bar(stat = "identity", position=position_dodge()) + 
  scale_x_discrete(breaks= total.var ,
                     labels=c("01", "02", "03", "04", "05", "06", ".07", "08","09", "10", "11", "12",
                              "13", "14", "15", "16", "18"), name="ATUS 2-digit activity code") +
  scale_y_continuous(name="Weighted average of time use (minutes)") +
  scale_fill_discrete(name = "Work from home",
                      breaks = c(0,1),
                      labels = c("Work at office or other locations", "Work from home" )) +
  theme(legend.position=c(0.7,0.7))


#ggtitle("Time use on different activites: work from home vs work at office or other location")


