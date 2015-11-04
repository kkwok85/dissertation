
*cd "D:\"


* cd "D:\Dropbox"

* use ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w1\DS0001\21600-0001-Data", clear
* use ".\original_unzip_files\ICPSR_21600_w1\DS0001\21600-0001-Data", clear



cd "F:\Add_health_data\"



* clean  and save weight files
fdause ".\Grand Sample Weights\wt\Homewt1.xpt", clear
renvars *, upper

save ".\Grand Sample Weights\wt\HOMEWT1", replace



* clean  and save w1 files, combine with wieghts file

fdause ".\In Home Interview Files\allwave1\allwave1.xpt", clear



renvars *, upper

gen no_mom_w1 = 0 if H1RM1 < 99
replace no_mom_w1 = 1 if H1RM1 == 97
tab no_mom_w1




gen no_dad_w1 = 0 if H1RF1 < 99
replace no_dad_w1 = 1 if H1RF1 == 97
tab no_dad_w1





* do ".\temp_data\original_unzip_files\ICPSR_21600_w1\DS0001\21600-0001-Supplemental_syntax.do"




*do ".\original_unzip_files\ICPSR_21600_w1\DS0001\21600-0001-Supplemental_syntax.do"


* merge 1:1 AID using ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w1_sample_weights\DS0002\21600-0002-Data"
* merge 1:1 AID using ".\original_unzip_files\ICPSR_21600_w1_sample_weights\DS0002\21600-0002-Data"



merge 1:1 AID using ".\Grand Sample Weights\wt\HOMEWT1"


* save ".\J file\dissertation\Add_health_data\temp_data\Add_Health_w1_v2", replace

*save ".\temp_data\Add_Health_w1_v2", replace


* check
tab no_mom_w1
tab no_dad_w1



save "F:\temp_data\Add_Health_w1", replace
