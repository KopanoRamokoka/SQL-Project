Select*from healthcare_dataset
---Converting Name column to capital initial

SELECT UPPER(Name) from healthcare_dataset
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

ALTER TABLE healthcare_dataset DROP COLUMN Surname

---Removing duplicates

SELECT DISTINCT Full_Name,Hospital from healthcare_dataset

SELECT Full_Name FROM healthcare_dataset
WHERE Full_Name is Null

---correcting errors

SELECT REPLACE(Hospital,'"','')from healthcare_dataset
UPDATE healthcare_dataset SET Hospital= REPLACE(Hospital,'"','')
SELECT*FROM healthcare_dataset
SELECT RTRIM(REPLACE(Hospital,'and',''))from healthcare_dataset
SELECT LTRIM(REPLACE(Hospital,'and',''))from healthcare_dataset
UPDATE healthcare_dataset SET Hospital= LTRIM(REPLACE(Hospital,'and',''))

SELECT REPLACE([Insurance Provider],'"','')from healthcare_dataset


UPDATE healthcare_dataset SET [Insurance Provider]= (REPLACE([Insurance Provider],'"',''))

SELECT REPLACE([Insurance Provider],'and','')from healthcare_dataset
UPDATE healthcare_dataset SET [Insurance Provider]=LTRIM(REPLACE([Insurance Provider],'and',''))

SELECT REPLACE([Insurance Provider],'','Unknown')from healthcare_dataset

ALTER TABLE healthcare_dataset DROP COLUMN [Room Number]

---Removing incorrect entries

SELECT [Billing Amount] from healthcare_dataset
SELECT COUNT([Billing Amount]) from healthcare_dataset
WHERE [Billing Amount]='UnitedHealthCare'
SELECT REPLACE ([Billing Amount],'UnitedHealthCare','NULL') from healthcare_dataset

UPDATE healthcare_dataset SET [Billing Amount]=REPLACE ([Billing Amount],'UnitedHealthCare','NULL')
SELECT REPLACE ([Billing Amount],'Medicare','NULL') from healthcare_dataset
UPDATE healthcare_dataset SET [Billing Amount]=REPLACE ([Billing Amount],'Medicare','NULL')
SELECT REPLACE ([Billing Amount],'Blue Cross','NULL') from healthcare_dataset
UPDATE healthcare_dataset SET [Billing Amount]=REPLACE ([Billing Amount],'Blue Cross','NULL')
SELECT REPLACE ([Billing Amount],'Aetna','NULL') from healthcare_dataset
UPDATE healthcare_dataset SET [Billing Amount]=REPLACE ([Billing Amount],'Aetna','NULL')
SELECT REPLACE ([Billing Amount],'Cigna','NULL') from healthcare_dataset
UPDATE healthcare_dataset SET [Billing Amount]=REPLACE ([Billing Amount],'Cigna','NULL')
SELECT REPLACE ([Billing Amount],'NULL','') from healthcare_dataset
UPDATE healthcare_dataset SET [Billing Amount]=REPLACE ([Billing Amount],'NULL','')


SELECT REPLACE ([Discharge Date],'Urgent','Unknown') from healthcare_dataset
UPDATE healthcare_dataset SET [Discharge Date]=REPLACE ([Discharge Date],'Urgent','Unknown')
SELECT REPLACE ([Discharge Date],'Elective','Unknown') from healthcare_dataset
UPDATE healthcare_dataset SET [Discharge Date]=REPLACE ([Discharge Date],'Elective','Unknown')
SELECT REPLACE ([Discharge Date],'Emergency','Unknown') from healthcare_dataset
UPDATE healthcare_dataset SET [Discharge Date]=REPLACE ([Discharge Date],'Emergency','Unknown')

SELECT [Medication] FROM healthcare_dataset


UPDATE healthcare_dataset SET [Medication]=
CASE WHEN [Medication] BETWEEN '2019/01/01' AND '2024/12/30' THEN 'Unknown'
else [Medication]
END


SELECT *FROM healthcare_dataset

SELECT REPLACE ([Test Results],'Paracetamol','') from healthcare_dataset
UPDATE healthcare_dataset SET [Test Results]=REPLACE ([Test Results],'Paracetamol','')
SELECT REPLACE ([Test Results],'Aspirin','') from healthcare_dataset
SELECT REPLACE ([Test Results],'Penicillin','') from healthcare_dataset
UPDATE healthcare_dataset SET [Test Results]=REPLACE ([Test Results],'Penicillin,','')
SELECT REPLACE ([Test Results],'Lipitor,','') from healthcare_dataset
UPDATE healthcare_dataset SET [Test Results]=REPLACE ([Test Results],'Lipitor','')
UPDATE healthcare_dataset SET [Test Results]=REPLACE ([Test Results],'Aspirin,','')
UPDATE healthcare_dataset SET [Test Results]=REPLACE ([Test Results],',','')

SELECT LTRIM([Test Results]) from healthcare_dataset
UPDATE healthcare_dataset SET [Insurance Provider]=REPLACE ([Insurance Provider],'','Unknown')

---DATA CLEANING DONE!!!!


----Questions and Answers
--1;Show doctors with most assigned appointments
--2;Show Hospitals with most appointments
--3;Show top 5 most recorded medical condition
--4;Show count of "Emergency" medical condition in every hospitals
--5;Show medication that was mostly distributed
--6;Show an insurance provider that covered most people




--1;Show doctors with most assigned appoinments
SELECT [Doctor],COUNT([Date of Admission])as Patients_Assigned from healthcare_dataset
GROUP BY [Doctor]
ORDER BY COUNT([Date of Admission])DESC

--2;Show Hospitals with most appointments
SELECT TOP 3 [Hospital],COUNT([Date of Admission])as Appointments from healthcare_dataset
GROUP BY [Hospital]
ORDER BY COUNT([Date of Admission])DESC

--3;Show top 5 most recorded medical conditions
SELECT TOP 5 [Medical Condition],COUNT([Patients])from healthcare_dataset
GROUP BY [Medical Condition]
ORDER BY COUNT([Patients])DESC

--4;Show count of "Emergency" medical condition in every hospitals
SELECT [Hospital],COUNT([Patients]) AS Count_of_Emergency_Medical_Condition from healthcare_dataset
WHERE [Admission Type]='Emergency'
GROUP BY [Hospital]
ORDER BY COUNT([Patients])DESC

--5;Show medication that was mostly distributed in every hospital
SELECT [Hospital],COUNT([Medication]),[Medication]AS Most_Distributed_Medicine from healthcare_dataset
GROUP BY [Medication],[Hospital]
ORDER BY COUNT([Hospital])DESC


--6;Show Top 3 insurance provider that covered most people
SELECT TOP 3[Insurance Provider],COUNT([Patients])as Number_of_Patients_Covered from healthcare_dataset
GROUP BY [Insurance Provider]
ORDER BY COUNT([Patients])DESC 


SELECT*from healthcare_dataset