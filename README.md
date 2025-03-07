# SQL-Project

This is a raw healthcare dataset containing important information that will serve as a valuable resource in improving patient care, optimizing hospitals workflows
and supporting data-driven decision-making. By leveraging this dataset, healthcare professionals, researchers and analysts can gain a deeper understanding of hospital performance,identify potential areas for improvement and enhance the overall quality of care delivered to patients

###### Below is the raw dataset captured
![Screenshot 2025-03-05 210701](https://github.com/user-attachments/assets/1d0adaab-3146-4063-bac0-fc856a21a5fb)

#### Data Cleaning Process
```Select*from healthcare_dataset
Converting Name column to capital initial

```SELECT UPPER(Name) from healthcare_dataset
UPDATE healthcare_dataset SET Name= UPPER(Name) from healthcare_dataset

SELECT CONCAT(SUBSTRING(Name,1,1),LOWER(SUBSTRING(Name,2,LEN(Name))))from healthcare_dataset

UPDATE healthcare_dataset SET Name=CONCAT(SUBSTRING(Name,1,1),LOWER(SUBSTRING(Name,2,LEN(Name))))

SELECT REPLACE(Name, ' ', '_') from healthcare_dataset;

UPDATE healthcare_dataset SET Name=REPLACE(Name, ' ', '_') from healthcare_dataset;

SELECT UPPER(SUBSTRING(Name,(CHARINDEX('_', Name) + 1),(LEN(Name))))FROM healthcare_dataset

ALTER TABLE healthcare_dataset ADD Surname varchar(50)

UPDATE healthcare_dataset SET Surname=UPPER(SUBSTRING(Name,(CHARINDEX('_', Name) + 1),(LEN(Name))))

SELECT CONCAT(SUBSTRING(Surname,1,1),LOWER(SUBSTRING(Surname,2,LEN(Surname))))from healthcare_dataset


UPDATE healthcare_dataset SET Surname=CONCAT(SUBSTRING(Surname,1,1),LOWER(SUBSTRING(Surname,2,LEN(Surname))))

SELECT REPLACE(Name,SUBSTRING(Name,(CHARINDEX('_', Name)+1),(LEN(Name))),'')from healthcare_dataset

UPDATE healthcare_dataset SET Name= REPLACE(Name,SUBSTRING(Name,(CHARINDEX('_', Name)+1),(LEN(Name))),'')

SELECT REPLACE(Name,'_','')from healthcare_dataset

UPDATE healthcare_dataset SET Name=REPLACE(Name,'_','')

SELECT CONCAT(Name,' ',Surname)as Full_Name from healthcare_dataset


UPDATE healthcare_dataset SET Name=  CONCAT(Name,' ',Surname)

Exec sp_rename 'healthcare_dataset.Full_Name','Patients','COLUMN'

ALTER TABLE healthcare_dataset DROP COLUMN Surname ```
