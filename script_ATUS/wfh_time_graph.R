Year = c(1997, 1999, 2002, 2005, 2010)
onsite_workers= c(122988, 126823, 127537, 133244, 128244) 
Mixed = c(2862, 2735, 3117, 3186, 4028) 
Home_workers = c(6379, 6742, 7276, 8127 , 9374) 
onsite_workers_percent = c(93, 93, 92.5, 92.2, 90.5)
Mixed_percent = c(2.2,2.0,2.3,2.2,2.8)
Home_workers_percent = c(4.8,4.9,5.3,5.6,6.6)

wfh_graph = data.frame(Year,onsite_workers,Mixed, Home_workers,onsite_workers_percent ,Mixed_percent, Home_workers_percent )       # df is a data frame



ggplot(wfh_graph, aes(x=Year), color= "Work-at-home status") +
  geom_line(aes(y = Mixed_percent, color = "Onsite + work at home")) + 
 geom_line(aes(y = Home_workers_percent, color = "Work at home workers")) +
geom_point(aes(y = Mixed_percent)) +
  geom_point(aes(y = Home_workers_percent)) +
  scale_y_continuous("Percentage of total workers") + 
  labs(title="Work-at-home status from 1997 to 2010") + 
  scale_x_continuous(breaks=Year) +
  theme(legend.title=element_blank())
