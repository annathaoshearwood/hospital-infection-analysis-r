#Purpose: 
#Explore whether age, length of hospital stay, CRP, and WBC 
#differ between patients with and without bloodstream infection

#Data set: 
#patients_clean 

#Load packages 
library(tidyverse)

##1. Age (years) vs Bloodstream Infection 

#Research question:
#Are the patient ages different between those with and without
#bloodstream infection?

#Plot type: 
#Boxplot -> compares the distribution of a numerical variable 
#between two groups

AgebyBlood <- ggplot(patients_clean,
       aes(x = Bloodstream_Infection, y = Age)) +
  geom_boxplot() +
  labs(
    title = "Age by Bloodstream Infection Status",
    x = "Bloodstream Infection",
    y = "Age (years)"
  )
AgebyBlood 

#Save boxplot as a PNG  
ggsave("~/R project/AgebyBlood.png", AgebyBlood)

#Mean age of patients with and without bloodstream infection 
patients_clean %>%
  group_by(Bloodstream_Infection) %>%
  summarise(
    median_age = median(Age, na.rm = TRUE)
  )

##2. Length of Stay (days) by Bloodstream Infection 

#Research question:
#Is length of hospital stay different between patients 
#with and without bloodstream infection?

#Plot type:
#Boxplot 

StaybyBlood <- ggplot(patients_clean,
       aes(x = Bloodstream_Infection, y = Length_of_Stay)) +
  geom_boxplot() + 
  labs(
    title = "Length of Stay by Bloodstream Infection", 
    x = "Bloodstream Infection", 
    y = "Length of Stay (days)"
  )
StaybyBlood

#Save boxplot as a PNG  
ggsave("~/R project/StaybyBlood.png", StaybyBlood)

#Median length of stay (in days) in patients with and without bloodstream infection
patients_clean %>%
  group_by(Bloodstream_Infection) %>% 
  summarise(
    median_lengthofstay = median(Length_of_Stay, na.rm = TRUE)
  )

##3. CRP (mg/L) vs Bloodstream Infection
#CRP = level of C-reactive protein in blood 

#Research question: 
#Is CRP different between patients with and without 
#bloodstream infection?

#Plot type: 
#Boxplot

CRPbyBlood <- ggplot(patients_clean,
       aes(x = Bloodstream_Infection, y = CRP)) +
  geom_boxplot() +
  labs(
    title = "CRP by Bloodstream Infection Status",
    x = "Bloodstream Infection",
    y = "CRP (mg/L)"
  )
CRPbyBlood

#Save boxplot as a PNG  
ggsave("~/R project/CRPbyBlood.png", CRPbyBlood)

#Median CRP in patients with and without bloodstream infection 
patients_clean %>%
  group_by(Bloodstream_Infection) %>% 
  summarise(
    median_CRP = median(CRP, na.rm = TRUE)
  )

##4. WBC (×10⁹/L) by Bloodstream Infection 
#WBC = level of white blood cells in blood

#Research question: 
#Is WBC different between patients with and without 
#bloodstream infection? 

#Plot type: 
#Boxplot

WBCbyBlood <- ggplot(patients_clean,
       aes ( x = Bloodstream_Infection, y = WBC )) +
      geom_boxplot()+
      labs ( title = "WBC by Bloodstream Infection Status",
             x = "Bloodstream Infection", 
             y = "WBC (×10⁹/L)"
      )
WBCbyBlood 

#Save boxplot as a PNG  
ggsave("~/R project/WBCbyBlood.png", WBCbyBlood)

#Median WBC in patients with and without bloodstream infection
patients_clean %>% 
  group_by(Bloodstream_Infection) %>% 
  summarise (
    median_WBC = median(WBC, na.rm = TRUE)
  )

##5. Age (years) vs Length of Stay (days) 

#Research question: 
#Is age associated with length of hospital stay?

#Plot type: 
#Scatterplot -> used to examine the relationship between 
#two numerical variables

AgebyStay <- ggplot(patients_clean,
       aes (x = Age, y = Length_of_Stay)) +
  geom_point() +
  labs( title = "Age vs Length of Stay", 
        x = "Age (years)", 
        y = "Length of Stay (days)"
        )
AgebyStay

#Save scatterplot as a PNG 
ggsave("~/R project/AgebyStay.png", AgebyStay)
