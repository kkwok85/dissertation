library(foreign)
library(sandwich)
library(lmtest)
install.packages("multcomp")

library(multcomp)


dfAPI = read.dta("http://www.ats.ucla.edu/stat/stata/webbooks/reg/elemapi2.dta")



lmAPI = lm(api00 ~ acs_k3 + acs_46 + full + enroll, data= dfAPI)

summary(glht(lmAPI, linfct = c("40*acs_k3 + acs_46=0") ))
