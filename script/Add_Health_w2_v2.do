
*cd "D:\Dropbox"
*cd "D:\"



* use ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w2\DS0003\21600-0003-Data", clear
*use ".\original_unzip_files\ICPSR_21600_w2\DS0003\21600-0003-Data", clear


cd "F:\Add_health_data\"

* clean  and save weight files

fdause ".\Grand Sample Weights\wt\Homewt2.xpt", clear
renvars *, upper

save ".\Grand Sample Weights\wt\HOMEWT2", replace


* clean  and save w2 files, combine with wieghts file

fdause ".\In Home Interview Files\wave2\wave2.xpt", clear


renvars *, upper


gen no_mom_bio_mom_w2 = 0 if H2RM1 < 99
replace no_mom_bio_mom_w2 = 1 if H2RM1 == 97
tab no_mom_bio_mom_w2






gen no_dad_bio_dad_w2 = 0 if H2RF1 < 99
replace no_dad_bio_dad_w2 = 1 if H2RF1 == 97
tab no_dad_bio_dad_w2




gen no_mom_w2 = 0 if H2RM4 < 99
replace no_mom_w2 = 1 if H2RM4 == 97
tab no_mom_w2




gen no_dad_w2 = 0 if H2RF4 < 99
replace no_dad_w2 = 1 if H2RF4 == 97
tab no_dad_w2


* do ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w2\DS0003\21600-0003-Supplemental_syntax.do"
*do ".\original_unzip_files\ICPSR_21600_w2\DS0003\21600-0003-Supplemental_syntax.do"


destring H2RI34* , replace
rename H2SIB* STUDSIB*
rename H2TWIN* TWINSIB*



* check this again!!!!!
* do ".\temp_data\original_unzip_files\ICPSR_21600_w2\DS0003\21600-0003-Supplemental_syntax.do"



* merge 1:1 AID using ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w2_sample_weights\DS0021\21600-0021-Data"
* merge 1:1 AID using ".\original_unzip_files\ICPSR_21600_w2_sample_weights\DS0021\21600-0021-Data"


merge 1:1 AID using ".\Grand Sample Weights\wt\HOMEWT2", gen(w2_weight)


* save ".\J file\dissertation\Add_health_data\temp_data\Add_Health_w2_v2", replace


rename PSUSCID PSUSCID_w2


merge 1:1 AID using "F:\temp_data\neighborhood_w2", gen(w2_neighborhood)

save "F:\temp_data\Add_Health_w2", replace


* check
tab no_mom_bio_mom_w2

tab no_dad_bio_dad_w2










