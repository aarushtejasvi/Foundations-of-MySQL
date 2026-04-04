CREATE DATABASE DBMSLab6;
USE DBMSLab6;
CREATE TABLE PATIENTS (
  patient_id INT NOT NULL UNIQUE,
  patient_name VARCHAR(70) NOT NULL,
  patient_age INT NOT NULL,
  gender ENUM('Male', 'Female') NOT NULL
  );
  
INSERT INTO PATIENTS (patient_id, patient_name, patient_age, gender) VALUES
(1001, 'John Smith', 45, 'Male'),
(1002, 'Sarah Johnson', 29, 'Female'),
(1003, 'Michael Chen', 52, 'Male'),
(1004, 'Emily Davis', 34, 'Female'),
(1005, 'Robert Wilson', 61, 'Male'),
(1006, 'Jessica Martinez', 22, 'Female'),
(1007, 'David Thompson', 40, 'Male'),
(1008, 'Lisa Anderson', 47, 'Female'),
(1009, 'William Taylor', 31, 'Male'),
(1010, 'Ashley Thomas', 55, 'Female');

SELECT * FROM PATIENTS;

CREATE TABLE VISITS (
  visit_id INT NOT NULL UNIQUE,
  patient_id INT NOT NULL,
  visit_date DATE NOT NULL,
  doctor_id INT NOT NULL,
  diagnosis VARCHAR(70) NOT NULL,
  treatment_cost INT NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES PATIENTS (patient_id)
  );

INSERT INTO VISITS (visit_id, patient_id, visit_date, doctor_id, diagnosis, treatment_cost) VALUES
(5001, 1001, '2024-01-10', 201, 'Hypertension', 150),
(5002, 1002, '2024-01-12', 205, 'Common Cold', 80),
(5003, 1003, '2024-01-15', 202, 'Type 2 Diabetes', 200),
(5004, 1004, '2024-01-18', 201, 'Asthma Flare-up', 120),
(5005, 1005, '2024-01-20', 203, 'Back Pain', 300),
(5006, 1006, '2024-01-22', 205, 'Migraine', 95),
(5007, 1007, '2024-01-25', 204, 'Skin Rash', 110),
(5008, 1008, '2024-01-28', 202, 'High Cholesterol', 180),
(5009, 1009, '2024-02-01', 201, 'Seasonal Allergies', 75),
(5010, 1010, '2024-02-03', 203, 'Arthritis', 250);

SELECT * FROM VISITS;

-- Grouping data by diagnosis
SELECT diagnosis, AVG(treatment_cost) AS average_cost
FROM VISITS
GROUP BY diagnosis;

-- HAVING clause implementation
SELECT diagnosis, AVG(treatment_cost) AS average_cost
FROM VISITS
GROUP BY diagnosis
HAVING AVG(treatment_cost) > 200;

-- Sorting the results
SELECT diagnosis, AVG(treatment_cost) AS average_cost
FROM VISITS
GROUP BY diagnosis
ORDER BY average_cost DESC;

-- Result optimisation using indexes
-- Creating index
CREATE INDEX idx_patient_id ON VISITS(patient_id);
-- Displaying the optimised result
EXPLAIN SELECT * FROM VISITS WHERE patient_id = 1001;
