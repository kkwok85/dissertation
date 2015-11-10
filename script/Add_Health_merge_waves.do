

clear 

set maxvar 32767

cd "F:\temp_data"


use Add_Health_w1, clear


forvalues i = 2(1)4 {
	merge 1:1 AID using Add_Health_w`i', gen(merge_to_w`i') 
}


merge 1:1 AID using  "F:\temp_data\sibling3", gen(merge_sibling)
merge 1:1 AID using  "F:\temp_data\neighborhood", gen(merge_neighborhood)

save Add_Health_merged_w1_to_w4, replace
