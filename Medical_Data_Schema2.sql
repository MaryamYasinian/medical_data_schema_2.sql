USE MedicalData;
GO
/*1. An [INNER] JOIN query which represnets patients' names and phone numbers as well as physicians' names and phone numberrs by joining physicians' ID in both tables*/

SELECT p.Name AS [Patient Name]
, p.Phone AS [Patient Phone]
, d.Name AS [Physician Name]
, d.Phone AS [Physician Phone]
FROM Patients p
JOIN Physicians d
ON p.PhysicianId = d.Id
ORDER BY p.Name;
GO
/*2. An [INNER] JOIN query which represents physicians' names and phones as well as hospitals' names addresses, and phones*/

SELECT p.Name AS [Physician Name]
, p.Phone AS [Physician Phone]
, h.Name AS [Hospital Name]
, (h.address + ',' + h.City) AS [Address]
, h.Phone AS [Hospital Phone]
FROM Physicians p
JOIN Hospitals h
ON p.HospitalId = h.Id
ORDER BY p.Name;
GO
/*3. An [INNER] JOIN query that represents pateints' name their MEdical plans, address of medical plan, and the phone number of medical plan*/

SELECT p.Name AS [Patient Name]
, m.Name AS [Medical Plan]
, (m.Address + ',' + m.City) AS [Address]
, m.Phone AS [Medical Phone]
FROM Patients p
JOIN MedicalPlans m
ON p.MedicalId = m.Id
ORDER BY p.Name;
GO
/*4. This query joins 3 tables: Patients, Medical Plans, and physicians*/

SELECT p.Name [Patient Name]
,m.Name [Medical Plan]
,d.Name [Physician Name]
, p.KinName [Patient Kin]
,p.KinPhone [Patient Kin Phone]
FROM Patients p
JOIN MedicalPlans m
ON p.MedicalId = m.Id
JOIN Physicians d
ON p.PhysicianId = d.Id
ORDER BY p.Name;
GO
/*5. Joining 5 tables to get thefollosing result*/
SELECT o.Id AS [Operation Id]
,mp.Name [Procedure]
,p.Name AS [Patient]
,d.Name AS [Physician]
,h.Name AS [Hospital]
FROM Patients p
JOIN Operations o
ON p.Id = o.PatientId
JOIN MedicalProcedures mp
ON o.ProcedureId = mp.Id
JOIN Physicians d
ON p.PhysicianId = d.Id
JOIN Hospitals h
ON h.Id = d.HospitalId
Go

USE Ch07_Fact;
GO

/*6. Joining two tables of AUTHOR and WRITES*/

SELECT a.AU_LNAME 
,a.AU_FNAME
,w.BOOK_NUM
FROM AUTHOR a
JOIN WRITES w
ON a.AU_ID = w.AU_ID
ORDER BY a.AU_LNAME, a.AU_FNAME, w.BOOK_NUM
GO
/*7. joining two tables of BOOK and WRITES*/

SELECT w.AU_ID
,w.BOOK_NUM
,b.BOOK_TITLE
,b.BOOK_SUBJECT
FROM WRITES w
JOIN BOOK b
ON w.BOOK_NUM = b.BOOK_NUM
ORDER BY w.BOOK_NUM, w.AU_ID
GO
/*8. Joining 3 tables of AUTHOR, BOOK, and WRITES to get the following results*/

SELECT a.AU_LNAME
,a.AU_FNAME
,b.BOOK_TITLE
,b.BOOK_COST
FROM AUTHOR a
JOIN WRITES w
ON a.AU_ID =w.AU_ID
JOIN BOOK b
ON b.BOOK_NUM = w.BOOK_NUM
ORDER BY b.BOOK_NUM, a.AU_ID
GO
/*9. Joining 3 tables of CHECKOUT, BOOK, and PATRON to display the following connections and indicating which books have been checked out */
SELECT c.PAT_ID
,c.BOOK_NUM
,p.PAT_FNAME
,p.PAT_LNAME
,b.BOOK_TITLE
FROM CHECKOUT c
JOIN PATRON p
ON p.PAT_ID = c.PAT_ID
JOIN BOOK b
ON b.BOOK_NUM = c.BOOK_NUM
WHERE c.CHECK_IN_DATE IS NULL
ORDER BY p.PAT_LNAME, b.BOOK_TITLE
GO
/*10. Joining 3 tables of WRITES, AUTHOR, and BOOK to find the following relationship. COMMENT- my last row (Robert Lake) is different from the last row on the result table in the assignment page. I assume that mine is correct as the one in the assignemt page and the book do not include the word Cloud*/

SELECT w.AU_ID
,a.AU_FNAME
,a.AU_LNAME
,w.BOOK_NUM
,b.BOOK_TITLE
FROM WRITES w
JOIN AUTHOR a
ON w.AU_ID = a.AU_ID
JOIN BOOK b
ON b.BOOK_NUM = w.BOOK_NUM
WHERE b.BOOK_TITLE LIKE '%Cloud%'
ORDER BY b.BOOK_TITLE, a.AU_LNAME;
GO
/*11. Joining 5 tables, focusing on distinct rows to eliminate repitation in book numbers*/
SELECT DISTINCT w.BOOK_NUM
,b.BOOK_TITLE
,a.AU_LNAME
,a.AU_FNAME
,c.PAT_ID
,p.PAT_LNAME
,p.PAT_TYPE
FROM WRITES w
JOIN AUTHOR a
ON w.AU_ID = a.AU_ID
JOIN BOOK b
ON b.BOOK_NUM = w.BOOK_NUM
JOIN CHECKOUT c
ON c.PAT_ID = b.PAT_ID
JOIN PATRON p
ON p.PAT_ID = c.PAT_ID
WHERE c.CHECK_IN_DATE IS NULL
ORDER BY b.BOOK_TITLE;
GO
/*12. Joioning 2 tables to explore which patrons have never checked out books*/
SELECT p.PAT_ID
,p.PAT_FNAME
,p.PAT_LNAME
FROM PATRON p
LEFT JOIN CHECKOUT c
ON p.PAT_ID =c.PAT_ID 
WHERE c.PAT_ID IS NULL
ORDER BY p.PAT_LNAME ASC

