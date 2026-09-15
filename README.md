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
6. Is catheter use associated with bloodstream infection? (chi-squared test)
7. Is the mean age significantly different between patients with and without bloodstream infection? (t-test)

# Dataset

hospital_infections.csv = raw and uncleaned dataset

patients_clean.csv = cleaned dataset 

* Patient_ID - unique patient identifier
* Age - patient age in years
* Sex - patient sex
* Ward - hospital ward
* Admission_Date - date of hospital admission
* Length_of_Stay - length of hospital stay in days
* WBC - white blood cell count
* CRP - C-reactive protein level
* Temperature - body temperature in °C
* Catheter - whether the patient had a catheter
* Diabetes - whether the patient had diabetes
* Bloodstream_Infection - bloodstream infection status

# 1. Exploring dataset

* This script imports and explores the hospital infection dataset.
* It checks the structure and types of variables, summarises numerical and categorical variables, identifies missing values and duplicate patient IDs, and checks for potentially impossible values.
*  These initial checks help identify data quality issues before further cleaning and statistical analysis.
  
# 2. Data Cleaning

* Numerical variables were treated for missing values and then replaced using the median. Median imputation was the method chosen for this project, as medians are not strongly affected by extreme values.
* Categorical variables were standardised to ensure consistent coding. Missing diabetes values were replaced with "No" based on the most common response (mode) in the dataset.
* Duplicate patient IDs were removed, retaining only the first record for each patient.
* Admission dates were converted from character format to Date format. Categorical variables were also converted to factors for statistical analysis.

# 3. Visualisations

visualisations were created using ggplot2 

Boxplots:
* Age by Bloodstream Infection Status
* Length of Stay by Bloodstream Infection Status
* CRP by Bloodstream Infection Status
* WBC by Bloodstream Infection Status

Scatterplot:
* Age and Length of Stay

# 4. Statistical Analysis

two statistical tests were performed

1. A chi-squared test of independence was used to investigate whether catheter use was associated with bloodstream infection.
2. An independent samples t-test was used to compare mean age between patients with and without bloodstream infection.

# Packages Used

* tidyverse – used for data import, data cleaning, manipulation, visualisation, and exploratory analysis.
* Statistical tests, including the chi-squared test and independent samples t-test, were performed using base R.

# Key Findings
Catheter vs bloodstream infection: 

- X-squared = 26.133
- df = 1
- p-value = 3.186e-07

* There was a statistically significant association between the use of catheters and bloodstream infection (χ²(1) = 26.133, p < 0.001), suggesting that bloodstream infection rates differed between patients with and without catheters.
  
Age vs bloodstream infection: 

- Mean age without bloodstream infection: 49.8 years
- Mean age with bloodstream infection: 72.2 years
- t = -6.824
- df = 26.417
- p = 2.798 × 10⁻⁷, which is p < 0.001
- 95% CI for the difference: -29.14 to -15.66

* There was a statistically significant difference in mean age between patients with and without bloodstream infection (Welch's t-test, t(26.42) = -6.824, p < 0.001). Patients with bloodstream infection had a higher mean age (72.2 years) compared with patients without bloodstream infection (49.8 years).

CRP vs bloodstream infection:

* The boxplot shows that CRP levels were higher in patients with bloodstream infection compared to those without. Patients with bloodstream infection had a higher median CRP and greater variability. The group without bloodstream infection had lower CRP levels, with two high outliers.

WBC vs bloodstream infection:

* The boxplot shows that WBC levels were higher in patients with bloodstream infection compared to those without. Patients with bloodstream infection had a higher median WBC and greater variability, whereas patients without bloodstream infection had a lower median WBC.

Length of stay vs bloodstream infection:

* The boxplot shows that length of hospital stay in days was significantly higher in patients with bloodstream infection compared to those without. Patients with bloodstream infection had a higher median length of stay and greater variability compared to those without.
  
Age vs length of stay:
* The scatter plot suggests a positive association between age and length of hospital stay, indicating that older patients tended to have longer hospital stays.

# Limitations

* Median imputation was used for missing numerical values, which may reduce variability.
* Missing diabetes values were replaced with "No", the mode. This assumes that missing values were more likely to represent patients without diabetes, which may not necessarily be true.
* Only a limited number of variables and statistical tests were examined.
* The statistical tests used examined individual variables separately and did not account for potential interactions between multiple patient characteristics.

# Reproducibility

1. Install R and RStudio.
2. Download this repository.
3. Place the dataset in the appropriate project directory.
4. Install the required packages:
   install.packages("tidyverse")
5. Run the 01_exploring_dataset script.
6. Run the 02_data_cleaning script.
7. Run the 03_visualisations script.
8. Run the 04_statistical_analysis script.

# Conclusion

* This project demonstrates a basic clinical data analysis workflow in R.
* This analysis provides an initial assessment of factors that may be associated with bloodstream infection and provides a foundation for more advanced statistical modelling and projects in the future.



