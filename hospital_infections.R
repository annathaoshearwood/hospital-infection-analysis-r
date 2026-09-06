install.packages("tidyverse")
library(tidyverse)

#IMPORT THE DATA 
#Importing the data set
patients <- read_csv("data/hospital_infections.csv")
View(patients)

#INSPECT THE DATA TYPES 
#Internal structure of the object, patients
str(patients)

#Quick look at the data 
glimpse(patients)

#SUMMARISE EACH VARIABLE 
# Statistical summary of numerical variables
summary(patients$Age)
summary(patients$Length_of_Stay)
summary(patients$WBC)
summary(patients$CRP)
summary(patients$Temperature)

#Statistical summary of categorical variables
summary(patients$Sex)
summary(patients$Ward)
summary(patients$Catheter)
summary(patients$Diabetes)
summary(patients$Bloodstream_Infection)

# Summary of all variables at once
summary(patients)

#COUNT MISSING VALUES
# Which values in patients are missing? Produces logical values  
# TRUE and FALSE from the data set 
is.na(patients)

#Add the TRUE and FALSE down each column
#TRUE = 1 & FALSE = 0 
colSums(is.na(patients))

#Calculate the percentage missing
colMeans(is.na(patients)) * 100

#CHECK THE CATEGORICAL VARIABLES 
#Check categorical variables to correct inconsistent data 
table(patients$Sex)
table(patients$Ward)
table(patients$Catheter)
table(patients$Diabetes)
table(patients$Bloodstream_Infection)

#CHECK FOR DUPLICATES IN PATIENTS 
patients %>% count(Patient_ID) %>% filter(n>1)

#LOOK FOR IMPOSSIBLE VALUES
patients %>% filter(Age > 120 | Length_of_Stay < 0 | Temperature < 30)
