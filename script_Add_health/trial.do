gen H4PE11_reverse =  6 - H4PE11
gen H4PE27_reverse =  6 - H4PE27
gen H4PE9_reverse =  6 - H4PE9
gen H4PE25_reverse =  6 - H4PE25
gen H4PE10_reverse =  6 - H4PE10
gen H4PE26_reverse =  6 - H4PE26
gen H4PE13_reverse =  6 - H4PE13
gen H4PE21_reverse =  6 - H4PE21
gen H4PE29_reverse =  6 - H4PE29
gen H4PE12_reverse =  6 - H4PE12
gen H4PE28_reverse =  6 - H4PE28




gen Extraversion_w4 = H4PE1 + H4PE9_reverse + H4PE17 + H4PE25_reverse     // beaware that the higher the number the lower the extravert
gen Agreeableness_w4 = H4PE2 + H4PE10_reverse + H4PE18 + H4PE26_reverse  // beaware that the higher the number the lower the agreeable
gen Conscientiousness_w4 = H4PE3 + H4PE11_reverse + H4PE19 + H4PE27_reverse // beaware that the higher the number the lower the conscientious
gen Neuroticism_w4 = H4PE4 + H4PE12_reverse + H4PE20 + H4PE28_reverse // beware the higher the number the lower the neurotic
gen Openness_w4 = H4PE5 + H4PE13_reverse + H4PE21_reverse + H4PE29_reverse  // beware the higher the number the lower openness





gen H4PE3_reverse =  6 - H4PE3
gen H4PE19_reverse =  6 - H4PE19



gen H4PE4_reverse =  6 - H4PE4
gen H4PE20_reverse =  6 - H4PE20

gen H4PE1_reverse =  6 - H4PE1
gen H4PE17_reverse =  6 - H4PE17


gen Conscientiousness_t = H4PE3_reverse + H4PE11 + H4PE19_reverse + H4PE27 // beaware that the higher the number the lower the conscientious
gen Neuroticism_t = H4PE4_reverse + H4PE12 + H4PE20_reverse + H4PE28 
gen Extraversion_t = H4PE1_reverse + H4PE9 + H4PE17_reverse + H4PE25     // beaware that the higher the number the lower the extravert
