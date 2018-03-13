cd "$data_input"


* clean and save weight files
fdause ".\Grand Sample Weights\wt\Homewt1.xpt", clear
renvars *, upper

save ".\Grand Sample Weights\wt\HOMEWT1", replace



* clean and save w1 files, combine with weights file
fdause ".\In Home Interview Files\allwave1\allwave1.xpt", clear
renvars *, upper

merge 1:1 AID using ".\Grand Sample Weights\wt\HOMEWT1", gen(w1_weight)

rename PSUSCID PSUSCID_w1

save "$data_output\Add_Health_w1", replace
