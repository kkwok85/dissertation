svyset PSUSCID_w1 [pweight= GSWGT1], strata(REGION)
svy: mean tv_hours_per_week_w1


sort AH_PVT
egen rank = rank(AH_PVT)

egen rank_raw = rank(AH_RAW)


svy: regress  AH_RAW age_w1 BIO_SEX tv_hours_per_week_w1
