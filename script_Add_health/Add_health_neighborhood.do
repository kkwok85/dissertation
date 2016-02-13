cd "F:\Add_health_data\"


fdause ".\Contextual Files\nhood1.xpt", clear
renvars *, upper
save "F:\temp_data\neighborhood_w1", replace



fdause ".\Contextual Files\nhood2.xpt", clear
renvars *, upper
save "F:\temp_data\neighborhood_w2", replace





