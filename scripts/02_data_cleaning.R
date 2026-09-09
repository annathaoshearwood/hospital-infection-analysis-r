#Clean and standardize patient data set before analysis 

#LOAD PACKAGE:

library(tidyverse)

#CREATE A COPY OF THE ORGINAL DATA:

patients_clean <- patients

#CLEAN NUMERICAL VARIABLES:

#Age: 
#Patient 1009 has a missing age
#Patient 1010 has an age of 250, which is not possible

#Ages above 120 are treated as missing (NA)
#IMPROVEMENT: next time try if_else(), instead of ifelse()
patients_clean <- patients_clean %>%
  mutate(Age = ifelse(Age > 120, NA, Age))

#Replace missing age values with the median age
patients_clean <- patients_clean %>%
  mutate(Age = ifelse(
    is.na(Age),
    median(Age, na.rm = TRUE),
    Age
  ))

#Temperature: 
#Patient 1030 has a temperature of 12°C, which is not possible

#Temperatures below 30°C are treated as missing (NA)
patients_clean <- patients_clean %>%
  mutate(Temperature = ifelse(Temperature < 30, NA, Temperature))

#Replace missing temperature values with the median
patients_clean <- patients_clean %>% 
  mutate(Temperature = ifelse( 
    is.na (Temperature),
    median (Temperature, na.rm = TRUE),
    Temperature 
  ))
                               
#Length of stay: 
#Patient 1026 has a negative length of stay (-3)

#Negative values are impossible and are treated as missing (NA)
patients_clean <- patients_clean %>%
  mutate(Length_of_Stay = ifelse (Length_of_Stay < 0, NA, Length_of_Stay))

#Replace missing length of stay with the median
patients_clean <- patients_clean %>%
  mutate(Length_of_Stay = ifelse(
    is.na(Length_of_Stay),
    median(Length_of_Stay, na.rm = TRUE),
    Length_of_Stay
  ))

#CRP: 
#Replace missing CRP values with the median CRP
patients_clean <- patients_clean %>% 
  mutate(CRP = ifelse(
    is.na(CRP),
    median(CRP, na.rm = TRUE),
    CRP
  ))

#STANDARDISE CATEGORICAL VARIABLES

#Explore the  different representations of male/female
table(patients_clean$Sex, useNA = "ifany")

#Standardize different representations of male/female
patients_clean <- patients_clean %>% 
  mutate(
    Sex = case_when( 
      Sex %in% c("Male", "M", "male") ~ "Male",
      Sex %in% c("Female", "F", "female") ~ "Female",
      TRUE ~ NA_character_
    ))

#Catheter: 

#Explore the  different representations of yes/no responses
table(patients_clean$Catheter, useNA = "ifany")

#Standardize yes/no responses
patients_clean <- patients_clean %>%
  mutate(Catheter = case_when (
    Catheter %in% c("N", "No") ~ "No", 
    Catheter %in% c("Y", "Yes", "YES") ~ "Yes", 
    TRUE ~ NA_character_
  ))
    
#Diabetes: 
#Patient 1018 has a missing diabetes value (NA) 
#The most common value (mode) in the data set is "No"

#View the no. of "Yes", "No" and "NA"
table(patients_clean$Diabetes, useNA = "ifany")


patients_clean <- patients_clean %>%
  mutate(
    Diabetes = ifelse(
      is.na(Diabetes),
      "No",
      Diabetes
    ))

#Ward: 
#Standardize different representations of ward names
 
#View the different ward names
table(patients_clean$Ward, useNA = "ifany")


patients_clean <- patients_clean %>%
  mutate(
    Ward = case_when(
    Ward %in% c("ICU", "I.C.U.") ~ "ICU",
    Ward %in% c("Medical", "medical") ~ "Medical",
    Ward == "Surgery" ~ "Surgery",
    Ward == "Cardiology" ~ "Cardiology",
    TRUE ~ NA_character_
    ))

#CHECK AND REMOVE DUPLICATE PATIENT IDs

#Identify duplicate patient IDs
patients_clean %>%
  count(Patient_ID) %>%
  filter(n > 1)

#Patient 1025 is duplicated
#Find the unique values and remove all duplicates 
#Remove the duplicate row but keep all the other columns 
patients_clean <- patients_clean %>% 
  distinct(Patient_ID, .keep_all = TRUE )

#CONVERT VARIABLES TO APPROPRIATE DATA TYPES

#Need admission dates as actual dates instead of text
patients_clean$Admission_Date <- as.Date(
  patients_clean$Admission_Date,
  format = "%d/%m/%Y"
)

#Check the format 
str(patients_clean$Admission_Date)

#Need categorical variables as factors
patients_clean <- patients_clean %>%
  mutate(
    Sex = factor(Sex),
    Ward = factor(Ward),
    Catheter = factor(Catheter),
    Diabetes = factor(Diabetes),
    Bloodstream_Infection = factor(Bloodstream_Infection)
  )

#Check the format
str(patients_clean)

#VALIDATE THE CLEANED DATASET

#Check missing values
colSums(is.na(patients_clean))

#Check numerical variables
summary(patients_clean$Age)
summary(patients_clean$Temperature)
summary(patients_clean$Length_of_Stay)
summary(patients_clean$CRP)
summary(patients_clean$WBC)

#Check categorical variables
table(patients_clean$Sex)
table(patients_clean$Catheter)
table(patients_clean$Diabetes)
table(patients_clean$Bloodstream_Infection)
table(patients_clean$Ward)

#Check that duplicate patient IDs have been removed
patients_clean %>%
  count(Patient_ID) %>%
  filter(n > 1)

#Check for remaining suspicious values
patients_clean %>%
  filter(
    Age < 0 | Age > 120 |
      Length_of_Stay < 0 |
      WBC < 0 |
      CRP < 0 |
      Temperature < 30 | Temperature > 45
  )

#EXPORT CLEANED DATA
write_csv(patients_clean, "patients_clean.csv")
