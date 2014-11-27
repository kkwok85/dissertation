
cd "D:\Dropbox"



use ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w3_public_in_home_questionnaire\DS0012\21600-0012-Data", clear


do ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w3_public_in_home_questionnaire\DS0012\21600-0012-Supplemental_syntax.do"


merge 1:1 AID using ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w3_sample_weights\DS0022\21600-0022-Data"


save ".\J file\dissertation\Add_health_data\temp_data\Add_Health_w3_in_home_v2"












