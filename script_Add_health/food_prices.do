clear

cd "F:\Add_health_data"

set maxvar 32767


* clean  and save weight files
fdause ".\ONE\w1_ONE\Wave I Cost of Living Index\w1accra.xpt", clear

renvars *, upper



merge 1:1 AID using "F:\temp_data\constructed_variables", gen(price_all)
