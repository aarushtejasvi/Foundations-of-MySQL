-- GOAL: Familiarisation with SQL subqueries/ inner queries

CREATE DATABASE DBMSLab7;
USE DBMSLab7;

SELECT * FROM diabetes;

-- Task 1: return complete data of patients with highest glucose level compared to average patient's vitals
SELECT * FROM diabetes WHERE Glucose > (SELECT AVG(Glucose) FROM diabetes);

-- Task 2: return complete data of patients with age above average of the dataset
SELECT * FROM diabetes WHERE Age > (SELECT AVG(Age) FROM Diabetes);

-- Task 3: return complete information of patient whose age is same as the oldest person who has more than 5 pregnancies
SELECT * FROM diabetes WHERE Age = (SELECT MAX(Age) FROM diabetes WHERE Pregnancies > 5);

-- Task 4: return complete information of patients with highest glucose level compared to average patient's vitals
SELECT * FROM diabetes WHERE Glucose > (SELECT AVG(Glucose) FROM diabetes);

-- Task 5: return the complete patient information who have the same number of pregnancies as the patient with lowest BMI
SELECT * FROM diabetes WHERE Pregnancies IN (SELECT Pregnancies FROM diabetes WHERE BMI = (SELECT MIN(BMI) FROM diabetes));

-- Task 6: return patient information who have more pregnancies than the patient with the fewest pregnancies among those who have a glucose level higher than 150.
SELECT * FROM diabetes WHERE Pregnancies > (SELECT MIN(Pregnancies) FROM diabetes WHERE Glucose > 150);

-- Task 7: Creating a view to diaplay the patients with their BMIs and return if their BMI is classifies as "normal", "overweight" or "obese"
-- BMI<25 is NORMAL | BMI>=25 is OVERWEIGHT | BMI>=30 is OBESE 
CREATE VIEW BMI_Status AS
SELECT *, 
    CASE 
        WHEN BMI < 25 THEN 'normal'
        WHEN BMI >= 25 AND BMI < 30 THEN 'overweight'
        WHEN BMI >= 30 THEN 'obese'
    END AS BMI_Classification
FROM diabetes;

-- return NORMAL category of patients
SELECT * FROM BMI_Status WHERE BMI_Classification = "normal";

-- return OBESE category of patients
SELECT * FROM BMI_Status WHERE BMI_Classification = 'obese';

-- return OVERWIEGHT category of patients
SELECT * FROM BMI_Status WHERE BMI_Classification = 'overweight';
