

* internal consistency access reliability
* Reliability Definition:
* Consistency between two measures of the same thing
* Ratio of true to total variance
* In research, the term reliability means "repeatability" or "consistency".
* A measure is considered reliable if it would give us the same result over and over again (assuming that what we are measuring isn't changing!).

* internal consistency (Cronbach’s alpha) for the scale and possible the average interitem correlation
* Definition of internal consistency: How well are three or more scale items measuring a single underlying characteristic?




* clean missing value first (check with the original missing value of conscientious)
* then do item-reverse
* then do internal consistency test (alpha test)


cd "F:\temp_data"



clear


set maxvar 32767

use constructed_variables, clear

alpha H1PF18_reverse  H1PF19_reverse H1PF20_reverse  H1PF21_reverse , std item  detail

* http://link.springer.com/referenceworkentry/10.1007%2F978-94-007-0753-5_1493   <- average inter-item correlation
/*
Conscientiousness:
Alpha score: 0.7430
Average interitem correlation: 0.4195

*/




alpha H1PF30  H1PF32  H1PF33  H1PF34  H1PF35 H1PF36, std item  detail

/*
Neuroticism:
Alpha score: 0.8492
Average interitem correlation: 0.4841
*/
