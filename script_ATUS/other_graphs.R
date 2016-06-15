

library(ggplot2)




          
ggplot(data=combine.data.regress.v2, aes(combine.data.regress.v2$total.percent.total.job.wfh)) + geom_histogram()+
  theme_set(theme_grey(base_size = 30))+  
scale_x_continuous( name="Percentage of work hours working from home") + 
scale_y_continuous( name="Number of employed persons")





ggplot(data=combine.data.regress.v2, aes(combine.data.regress.v2$total.job.time)) + geom_histogram()+
  theme_set(theme_grey(base_size = 30))+  
scale_x_continuous( name="Minutes spent on work") + 
scale_y_continuous( name="Number of employed persons")



# ggplot(data=combine.data.regress.v2, aes(combine.data.regress.v2$total.percent.total.job.wf)) + geom_bar(aes(y = (..count..)/sum(..count..)))





