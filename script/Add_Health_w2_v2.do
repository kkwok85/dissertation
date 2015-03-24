
*cd "D:\Dropbox"
cd "D:\"



* use ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w2\DS0003\21600-0003-Data", clear
use ".\original_unzip_files\ICPSR_21600_w2\DS0003\21600-0003-Data", clear



gen no_mom_bio_mom_w2 = 0 if H2RM1 < 99
replace no_mom_bio_mom_w2 = 1 if H2RM1 == 97
tab no_mom_bio_mom_w2




gen no_dad_bio_dad_w2 = 0 if H2RF1 < 99
replace no_dad_bio_dad_w2 = 1 if H2RF1 == 97
tab no_dad_bio_dad_w2



* do ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w2\DS0003\21600-0003-Supplemental_syntax.do"
do ".\original_unzip_files\ICPSR_21600_w2\DS0003\21600-0003-Supplemental_syntax.do"




* merge 1:1 AID using ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w2_sample_weights\DS0021\21600-0021-Data"
merge 1:1 AID using ".\original_unzip_files\ICPSR_21600_w2_sample_weights\DS0021\21600-0021-Data"




* save ".\J file\dissertation\Add_health_data\temp_data\Add_Health_w2_v2", replace

save ".\temp_data\Add_Health_w2_v2", replace


* check
tab no_mom_bio_mom_w2

tab no_dad_bio_dad_w2










