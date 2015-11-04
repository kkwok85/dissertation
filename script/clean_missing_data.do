* file to clean data


clear


cd "F:\temp_data"
set maxvar 32767

use Add_Health_merged_w1_to_w4, clear


replace BIO_SEX = . if (BIO_SEX == 6 | BIO_SEX==8)




replace H1DA3 = . if (H1DA3 == 6 | H1DA3 == 8)
replace H1DA8 = . if (H1DA8 >= 996 & H1RM8 <= 999)
replace H1DA9 = . if (H1DA9 >= 996 & H1RM9 <= 999)
replace H1DA10 = . if (H1DA10 >= 996 & H1RM10 <= 999)
replace H1DA11 = . if (H1DA11 >= 996 & H1RM11 <= 999)




replace H1GI1M = . if (H1GI1M == 96)
replace H1GI1Y = . if (H1GI1Y == 96)

replace H1GI6A = . if (H1GI6A == 6 | H1GI6A == 8 | H1GI6A == 9)
replace H1GI6B = . if (H1GI6B == 6 | H1GI6B == 8 | H1GI6A == 9)
replace H1GI6C = . if (H1GI6C == 6 | H1GI6C == 8 | H1GI6A == 9)
replace H1GI6D = . if (H1GI6D == 6 | H1GI6D == 8 | H1GI6A == 9)
replace H1GI6E = . if (H1GI6E == 6 | H1GI6E == 8 | H1GI6A == 9)



replace H1RM4 = . if (H1RM4 >= 96 & H1RM4 <= 99)
replace H1RM7 = . if (H1RM7 >= 996 & H1RM7 <= 999)




replace PA55 = . if (PA55 == 9996)

replace H1WP1 = . if (H1WP1 >= 6 & H1WP1 <= 9)
replace H1WP2 = . if (H1WP2 >= 6 & H1WP2 <= 9)
replace H1WP3 = . if (H1WP3 >= 6 & H1WP3 <= 9)
replace H1WP4 = . if (H1WP4 >= 6 & H1WP4 <= 9)
replace H1WP5 = . if (H1WP5 >= 6 & H1WP5 <= 9)
replace H1WP6 = . if (H1WP6 >= 6 & H1WP6 <= 9)
replace H1WP7 = . if (H1WP7 >= 6 & H1WP7 <= 9)

replace H1GH23A = . if (H1GH23A == 6 | H1GH23A == 8)
replace H1GH23G = . if (H1GH23G == 6 | H1GH23G == 8)
replace H1GH23J = . if (H1GH23J == 6 | H1GH23J == 8)


replace H1GH30A = . if (H1GH30A >= 6 & H1GH30A <= 8)
replace H1GH30B = . if (H1GH30B >= 6 & H1GH30B <= 8)






replace H1TO1 = . if (H1TO1 == 6 | H1TO1 == 8 | H1TO1 == 9)
replace H1TO3 = . if (H1TO3 == 6 | H1TO3 == 7 | H1TO3 == 8)
replace H1TO5 = . if (H1TO5 == 96 | H1TO5 == 97 | H1TO5 == 98 | H1TO5 == 99)
replace H1TO7 = . if (H1TO7 == 96 | H1TO7 == 97 | H1TO7 == 98 | H1TO7 == 99)



replace H1TO12 = . if (H1TO12 == 6 | H1TO12 == 8 | H1TO12 == 9)
replace H1TO15 = . if (H1TO15 == 96 | H1TO15 == 97 | H1TO15 == 98)
replace H1TO16 = . if (H1TO16 == 96 | H1TO16 == 97 | H1TO16 == 98 | H1TO16 == 99)
replace H1TO17 = . if (H1TO17 == 96 | H1TO17 == 97 | H1TO17 == 98)
replace H1TO18 = . if (H1TO18 == 96 | H1TO18 == 97 | H1TO18 == 98)



replace H1CO1 = . if (H1CO1 == 6 | H1CO1 == 8 | H1CO1 == 9)
replace PC47 = . if (PC47 == 6 | PC47 == 8)
replace PC41 = . if (PC41 == 6 | PC41 == 8)





save temp_missing_data, replace
