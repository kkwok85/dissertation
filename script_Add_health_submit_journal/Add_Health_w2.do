cd "$data_input"

* clean and save weight files

fdause ".\Grand Sample Weights\wt\Homewt2.xpt", clear
renvars *, upper

save ".\Grand Sample Weights\wt\HOMEWT2", replace

* clean and save w2 files, combine with weights file

fdause ".\In Home Interview Files\wave2\wave2.xpt", clear

renvars *, upper

merge 1:1 AID using ".\Grand Sample Weights\wt\HOMEWT2", gen(w2_weight)

rename PSUSCID PSUSCID_w2

save "$data_output\Add_Health_w2", replace












