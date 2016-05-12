cd "F:\Add_health_data\"



* clean  and save weight files
fdause ".\School Files\School Administrator Questionnaire- Wave I\Schadm1", clear
renvars *, upper

rename ASCHLCDE SCID

save "F:\temp_data\school_w1", replace









fdause ".\School Files\School Administrator Questionnaire- Wave II\Schadm2", clear
renvars *, upper

rename BSCHLCDE SCID2


save "F:\temp_data\school_w2", replace







