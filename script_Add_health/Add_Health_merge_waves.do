

clear 

*set maxvar 32767

cd "F:\temp_data"


use Add_Health_w1, clear


forvalues i = 2(1)4 {
	merge 1:1 AID using Add_Health_w`i', gen(merge_to_w`i') 
}


merge 1:1 AID using  "F:\temp_data\siblingID", gen(merge_sibling)



*merge m:1 SCID using  "F:\temp_data\school_w1", gen(merge_school_w1)
*merge m:1 SCID2 using  "F:\temp_data\school_w2", gen(merge_school_w2)



save Add_Health_merged_w1_to_w4, replace
