
combine.data.complete$interview.year == 2010 |

ACA.data <- combine.data.complete[which(combine.data.complete$interview.year == 2007 | combine.data.complete$interview.year == 2008 |
                                        combine.data.complete$interview.year == 2009 | 
                                        combine.data.complete$interview.year == 2011 | combine.data.complete$interview.year == 2012 |
                                        combine.data.complete$interview.year == 2013 | combine.data.complete$interview.year == 2014),]
                                  
                                  
                                  

ACA.data <- ACA.data[which(ACA.data$age == 23 | ACA.data$age == 24 | ACA.data$age == 25 |
                           ACA.data$age == 27 | ACA.data$age == 28 | ACA.data$age == 29),]




ACA.data$Treatment <- as.numeric(c(""))
ACA.data$Treatment[which(ACA.data$age == 23 | ACA.data$age == 24 | ACA.data$age == 25 )] <- 1

ACA.data$Treatment[which(ACA.data$age == 27 | ACA.data$age == 28 | ACA.data$age == 29 )] <- 0


ACA.data$Post <- as.numeric(c("")) 
ACA.data$Post[which(ACA.data$interview.year == 2007 | ACA.data$interview.year == 2008 | ACA.data$interview.year == 2009 )] <- 0

ACA.data$Post[which(ACA.data$interview.year == 2011 | ACA.data$interview.year == 2012 | ACA.data$interview.year == 2013 |
                    ACA.data$interview.year == 2014 )] <- 1



ACA.data$interaction <- ACA.data$Post*ACA.data$Treatment   


ACA.data.combine <- join(ACA.data,atussum,  by="tucaseid", type = "left")


full.model <- lm(paste0("total13","~ Treatment*Post", demographic.var ,employ.var, current.sit,family.bus, family.var, time.var, location.var, spouse.var, family.inc.var,  childcare.service.var, children.sick.var  ), data = ACA.data.combine, weights = tufnwgtp )

ACA.data.combine.female <- ACA.data.combine[which(ACA.data.combine$sex == "Female"),]


ACA.data.combine.male <- ACA.data.combine[which(ACA.data.combine$sex == "Male"),]



#total 01, 02 , 04, 07 , 15 and Working out, unspecified



ACA.data.combine.trial <- join(ACA.data,atuscps,  by="tucaseid", type = "left")

#prunedur, pelkdur has effects




test <- join(combine.data.complete ,atussum,  by="tucaseid", type = "left")
