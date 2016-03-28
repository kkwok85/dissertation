cd "F:\temp_data"



clear
set maxvar 32767


use constructed_variables, clear




svy: mean tv_hours_per_week_w1


sort AH_PVT
egen rank = rank(AH_PVT)

egen rank_raw = rank(AH_RAW)




svyset PSUSCID_w1 [pweight= GSWGT1], strata(REGION)

* strata does not affect much, but PSUSCID_w1 affects a lot
svy: regress  AH_PVT age_w1 BIO_SEX tv_hours_per_week_w1



* if cluster at individual level, then it is just like no clustering!!!
* vce is the same as cluster

set maxvar 32767


cd "F:\Add_health_data\"

fdause ".\In Home Interview Files\ahpvt3\ahpvt3.xpt", clear

renvars *, upper

merge 1:1 AID using "F:\temp_data\constructed_variables", gen(ahpvt)

svy: regress  PVTPCT1C age_w1 BIO_SEX tv_hours_per_week_w1



log using "F:\temp_result_2", replace


replace PVTPCT1C = .  if PVTPCT1C == 995

svyset PSUSCID_w1 [pweight= GSWGT1], strata(REGION)

svy: regress  PVTPCT1C age_w1 BIO_SEX tv_hours_per_week_w1



svy: mean PVTPCT1C
svy: mean age_w1
svy: mean BIO_SEX
svy: mean tv_hours_per_week_w1
