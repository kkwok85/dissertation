clear

cd "F:\Add_health_data"

set maxvar 32767


* clean  and save weight files
fdause ".\Friend Files\Wave II In-Home Nominations\hfriend2.xpt", clear

renvars *, upper

merge 1:1 AID using "F:\temp_data\constructed_variables", gen(peer_all)




res_mom interact with peer effect
conscientious interact with peer effect



H2NU77

how_many_days_smoke_w2
how_many_cigarettes_w2
tried_cigarette_w2
regular_cigarette_w2



destring AID, replace

destring MF_AID1, replace
destring MF_AID2, replace
destring MF_AID3, replace
destring MF_AID4, replace
destring MF_AID5, replace


destring FF_AID1, replace
destring FF_AID2, replace
destring FF_AID3, replace
destring FF_AID4, replace
destring FF_AID5, replace



* http://www.stata.com/statalist/archive/2010-08/msg00508.html



forvalues i= 1(1)5  {
	gen trial`i' = .
}


foreach frd in MF_AID FF_AID {
forvalues k = 1(1)5{

gen `frd'_smoke_`k' = .
}
}



foreach frd in MF_AID FF_AID {

forvalues j = 1(1)5 {
forvalues i = 1(1)20792 {



	   
	local b `frd'`j'[`i']


	sum how_many_cigarettes_w2 if AID == `frd'`j'[`i']

	replace `frd'_smoke_`j' = r(min) if (`b' != . & `b' != 88888888  & `b' != 77777777 & `b' != 55555555 & `b' != 99999999 ) in `i'

}


}

}




egen  frd_mean_MFsmoke_w2 = rowmean(MF_AID_smoke_1 MF_AID_smoke_2 MF_AID_smoke_3 MF_AID_smoke_4 MF_AID_smoke_5)
egen  frd_mean_FFsmoke_w2 = rowmean(FF_AID_smoke_1 FF_AID_smoke_2 FF_AID_smoke_3 FF_AID_smoke_4 FF_AID_smoke_5)
