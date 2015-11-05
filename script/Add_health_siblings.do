cd "F:\Add_health_data\"


fdause ".\Sibling Files\Siblings\sibling3.xpt", clear



renvars *, upper

gen SIB_AID5 = AID
* keep AID SIB_AID1 SIB_AID2 SIB_AID3 SIB_AID4 SIB_AID5

reshape long SIB_AID SIB_REL, i(AID) j(sibling)

drop if SIB_AID == ""


duplicates drop SIB_AID, force

rename AID FAMILY_ID
rename SIB_AID AID

save "F:\temp_data\sibling3", replace

