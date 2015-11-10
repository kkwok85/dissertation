cd "F:\Add_health_data\"


fdause ".\Contextual Files\nhood1.xpt", clear



renvars *, upper



save "F:\temp_data\neighborhood", replace
