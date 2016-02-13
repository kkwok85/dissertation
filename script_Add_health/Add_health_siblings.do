cd "F:\Add_health_data\"










fdause ".\Sibling Files\Pairs\pairs.xpt", clear
renvars *, upper

keep PAIR AID_1 AID_2 FAMID


reshape long AID_ , i(PAIR) j(sibling)

rename AID_ AID

duplicates drop AID, force

keep AID FAMID

save "F:\temp_data\siblingID", replace

