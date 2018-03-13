

clear 

cd "$data_output"


use Add_Health_w1, clear

* merge first 2 waves
forvalues i = 1(1)2 {
	merge 1:1 AID using Add_Health_w`i', gen(merge_to_w`i') 
}


save Add_Health_merged_w1_to_w4, replace
