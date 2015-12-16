/* 
cd "D:\Dropbox"



use ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w3_public_in_home_questionnaire\DS0012\21600-0012-Data", clear


do ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w3_public_in_home_questionnaire\DS0012\21600-0012-Supplemental_syntax.do"


merge 1:1 AID using ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w3_sample_weights\DS0022\21600-0022-Data"


save ".\J file\dissertation\Add_health_data\temp_data\Add_Health_w3_in_home_v2"


*/




cd "F:\Add_health_data\"

* clean  and save weight files

fdause ".\Grand Sample Weights\weights3\weights3.xpt", clear
renvars *, upper

save ".\Grand Sample Weights\weights3\weights3", replace


* clean  and save w3 other files, combine with wieghts file

/*
forvalues i = 17(1)19 {
	fdause ".\In Home Interview Files\wave3a\sect`i'.xpt", clear
	renvars *, upper
	save ".\In Home Interview Files\wave3a\sect`i'", replace

	
}


forvalues i = 22(1)25 {
	fdause ".\In Home Interview Files\wave3a\sect`i'.xpt", clear
	renvars *, upper
	save ".\In Home Interview Files\wave3a\sect`i'", replace

	
}








*/




fdause ".\In Home Interview Files\wave3\wave3.xpt", clear


renvars *, upper



merge 1:1 AID using ".\Grand Sample Weights\weights3\weights3"


/* no need to merge this part. AID not unique cuz it includes partner number
forvalues i = 17(1)19 {

	merge 1:1 AID using ".\In Home Interview Files\wave3a\sect`i'", nogen
}


forvalues i = 22(1)25 {

	merge 1:1 AID using ".\In Home Interview Files\wave3a\sect`i'", nogen
}

*/


rename PSUSCID PSUSCID_w3



save "F:\temp_data\Add_Health_w3", replace







