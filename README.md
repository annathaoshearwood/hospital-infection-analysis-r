# Hospital Infection Analysis 

* This project explores patient characteristics and clinical factors that are associated with bloodstream infection in hospital patients.
* The analysis focuses on exploring the dataset, data cleaning, visualisations, and statistical analysis using R and the tidyverse package.
* The main aim is to investigate whether factors such as age, length of hospital stay, CRP, WBC, and catheter use differ between patients with and without bloodstream infection.
* It is important to note that the dataset is synthetic and was generated using AI. The idea was to use a small, synthetic dataset to develop my coding skills as a beginner in R and build my confidence before working with actual patient datasets.

# Research Questions

the project investigated the following questions...

1. Is there a difference in age between patients with and without bloodstream infection?
2. Is there a difference in the length of hospital stay between patients with and without bloodstream infection?
3. Is CRP different between patients with and without bloodstream infection?
4. Is WBC different between patients with and without bloodstream infection?
5. Is age associated with the length of hospital stay?
6. Is catheter use associated with bloodstream infection?
7. Is the mean age significantly different between patients with and without bloodstream infection?

# Dataset 

hospital_infections.csv = raw and uncleaned dataset
patients_clean.csv = cleaned dataset 

* Patient_ID – unique patient identifier
* Age – patient age in years
* Sex – patient sex
* Ward – hospital ward
* Admission_Date – date of hospital admission
* Length_of_Stay – length of hospital stay in days
* WBC – white blood cell count
* CRP – C-reactive protein level
* Temperature – body temperature in °C
* Catheter – whether the patient had a catheter
* Diabetes – whether the patient had diabetes
* Bloodstream_Infection – bloodstream infection status

# Data Cleaning

* Numerical variables were treated for missing values and then replaced using the median. Median imputation was the method chosen for this project, as medians are not strongly affected by extreme values.
* Categorical variables were standardised to ensure consistent coding. Missing diabetes values were replaced with "No" based on the most common response (mode) in the dataset.
* Duplicate patient IDs were removed, retaining only the first record for each patient.
* Admission dates were converted from character format to Date format. Categorical variables were also converted to factors for statistical analysis.

# Visualisations 

visualisations were created using ggplot2 

Boxplots:
* Age by Bloodstream Infection Status
* Length of Stay by Bloodstream Infection Status
* CRP by Bloodstream Infection Status
* WBC by Bloodstream Infection Status

Scatterplot:
* Age and Length of Stay

# Statistical Analysis

two statistical tests were performed

1. A chi-squared test of independence was used to investigate whether catheter use was associated with bloodstream infection.
2. An independent samples t-test was used to compare mean age between patients with and without bloodstream infection.

# Packages Used 

* tidyverse – used for data import, data cleaning, manipulation, visualisation, and exploratory analysis.
* Statistical tests, including the chi-squared test and independent samples t-test, were performed using base R.

# Key Findings
Catheter vs bloodstream infection: [add chi-squared test result and p-value]
Age vs bloodstream infection: [add t-test result and p-value]
CRP vs bloodstream infection: [describe observed pattern]
WBC vs bloodstream infection: [describe observed pattern]
Length of stay vs bloodstream infection: [describe observed pattern]
Age vs length of stay: [describe observed relationship]

# Limitations
