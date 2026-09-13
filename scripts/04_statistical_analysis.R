#Purpose: 
#Test whether selected patient characteristics are associated 
#with bloodstream infection.

#Statistical tests: 
# 1. Chi-squared test -> Catheter vs Bloodstream Infection 
# 2. Independent samples t-test -> Age vs Bloodstream Infection

#Load packages
library(tidyverse)

##1. Chi-squared Test: Catheter vs Bloodstream Infection

#Research question: 
#Is catheter use associated with bloodstream infection?

#Create contingency table 
table(patients_clean$Catheter, 
      patients_clean$Bloodstream_Infection)

#Run chi-squared test
chisq.test(table(patients_clean$Catheter, 
                 patients_clean$Bloodstream_Infection))

##2. Independent Samples t-test: Age vs Bloodstream Infection

#Research question: 
#Is mean age different between patients with and without 
#bloodstream infection?

#Run t-test 
t.test(
  Age ~ Bloodstream_Infection, 
  data = patients_clean
)



