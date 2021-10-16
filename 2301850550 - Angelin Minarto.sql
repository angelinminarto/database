
-- Nama : Angelin Minarto
-- NIM : 2301850550
-- KELAS : LA01
-- Kode Mata Kuliah : ISYS6169 – Database Systems
--					  ISYS6280 – Database Systems

--START
-- 1. DDL
CREATE DATABASE MajuUniversityDB
USE MajuUniversityDB

CREATE TABLE Student
(
	StudentID VARCHAR(12) PRIMARY KEY,
	StudentName VARCHAR(255),
	PlaceOfBirth VARCHAR(255),
	DateOfBirth DATE,
	ProgramID VARCHAR(8) FOREIGN KEY (ProgramID) REFERENCES Program(ProgramID),
	[Address] VARCHAR(255)
)

CREATE TABLE Program
(
	ProgramID VARCHAR(8) PRIMARY KEY,
	ProgramName VARCHAR(255)
)

CREATE TABLE ScoreComponent
(
	[Component] VARCHAR(8) PRIMARY KEY,
	[Description] VARCHAR(255),
	[Weight] DECIMAL(4,2)
)

CREATE TABLE Course
(
	CourseID CHAR(8) CHECK(SUBSTRING(CourseID,1,4) LIKE '[A-Z]%' AND SUBSTRING(CourseID,5,4) LIKE '%[0-9]'),
	CourseName VARCHAR(255),
	[Credit] INT,
	PRIMARY KEY(CourseID)
)

CREATE TABLE [Weight]
(
	Grade CHAR(2) PRIMARY KEY,
	ScoreMin INT,
	ScoreMax INT,
	[Weight] DECIMAL(3,2)
)

CREATE TABLE StudentScore
(
	StudentID VARCHAR(12) FOREIGN KEY(StudentID) REFERENCES Student(StudentID),
	Semester VARCHAR(8),
	CourseID CHAR(8) FOREIGN KEY(CourseID) REFERENCES Course(CourseID),
	TotalScore INT,
	Grade CHAR(2) FOREIGN KEY(Grade) REFERENCES [Weight](Grade),
	PRIMARY KEY(StudentID, CourseID, Semester)
)

CREATE TABLE StudentScoreDetail
(
 StudentID VARCHAR(12),
 Semester VARCHAR(8),
 CourseID CHAR(8),
 [Component] VARCHAR(8),
 Score INT CHECK(Score BETWEEN 0 AND 100),
 PRIMARY KEY(StudentID, Semester, CourseID, Component),
 FOREIGN KEY(StudentID, CourseID, Semester) REFERENCES StudentScore(StudentID, CourseID, Semester),
 FOREIGN KEY (Component) REFERENCES ScoreComponent(Component)
)

--TABLE PROGRAM
INSERT INTO Program
VALUES('25','Computer Science')
INSERT INTO Program
VALUES('26','Information Systems')
INSERT INTO Program
VALUES('44','Accounting')
INSERT INTO Program
VALUES('45','Management')
INSERT INTO Program
VALUES('47','International Business')
INSERT INTO Program
VALUES('77','Communication')
SELECT * FROM Program

--TABEL STUDENT
INSERT INTO Student
VALUES('2301234234', 'NADYA STUFANY', 'Makasar', '1990/02/24', '45', 'Jl. Kebon Jeruk Raya No.55 RT 6 RW 7,Kampung Bahagia')
INSERT INTO Student
VALUES('2301234237', 'JUAN KANAM', 'Bandung', '1991/03/01', '45', NULL)
INSERT INTO Student
VALUES('2301234614', 'RANGGA ADATYI', 'Surabaya', '1996/03/11', '26', 'Jl. Mangga Manalagi No.27 RT 01 RW 02 Kemanggisan')
INSERT INTO Student
VALUES('2301234734', 'SYLVIA KUYEPUTRA', 'Jakarta', '1995/01/10', '45', 'Perumahan Ramainya Luar Biasa Blok A1 No.200 RT 01')
INSERT INTO Student
VALUES('2301234866', 'RYAN RUSLEN', 'Bekasi', '1997/11/05', '25', 'Jalan Petukangan Utara Raya No.99, Gang Senggol, RT 01')
INSERT INTO Student
VALUES('2301234885', 'ANDRUW TANAMAS', 'Riau', '1995/02/17', '25', 'Perumahan Alfa Indah Blok C40 No.76 Tangerang Selatan')
INSERT INTO Student
VALUES('2301234916', 'AAN AGUNG JULEAN', 'Jambi', '1997/07/09', '26', 'Kampung Buah Mangga Harum Manis No.5B, Depan Kebayoran')
SELECT * FROM Student

--TABEL SCORE COMPONENT
INSERT INTO ScoreComponent
VALUES('ASG', 'Assignment', '30.00')
INSERT INTO ScoreComponent
VALUES('MID', 'Mid Test', '35.00')
INSERT INTO ScoreComponent
VALUES('FIN', 'Final Test', '35.00')
SELECT * FROM ScoreComponent

--TABEL COURSE
INSERT INTO Course
VALUES('ACCT6164','Financial Accounting','2')
INSERT INTO Course
VALUES('COMP6141','Interactive Computer Graphic','4')
INSERT INTO Course
VALUES('COMP6143','Mobile Multimedia','4')
INSERT INTO Course
VALUES('COMP6449','Machine Learning','3')
INSERT INTO Course
VALUES('ENGL6171','Academic English I','3')
INSERT INTO Course
VALUES('FINC6067','International Financial Management','2')
INSERT INTO Course
VALUES('ISYS6440','Introduction to Business Databases','4')
INSERT INTO Course
VALUES('MKTG6286','Consumer Psychology and Behavior','4')
INSERT INTO Course
VALUES('MKTG6287','Products and Brand Management','4')
INSERT INTO Course
VALUES('MKTG6288','Digital Business and Analytics','4')
SELECT * FROM Course

--TABEL WEIGHT
INSERT INTO Weight
VALUES('A','91','100','4.00')
INSERT INTO Weight
VALUES('A-','86','90','3.67')
INSERT INTO Weight
VALUES('B','76','80','3.00')
INSERT INTO Weight
VALUES('B+','81','85','3.33')
INSERT INTO Weight
VALUES('B-','71','75','2.67')
INSERT INTO Weight
VALUES('C', '61','65','2.00')
INSERT INTO Weight
VALUES('C+','66','70','2.33')
INSERT INTO Weight
VALUES('D','50','60','1.00')
INSERT INTO Weight
VALUES('E','1','49','0.00')
INSERT INTO Weight
VALUES('F','0','0','0.00')
SELECT * FROM Weight

--TABEL STUDENT SCORE 
INSERT INTO StudentScore
VALUES('2301234734','20192','ACCT6164','94','A')
INSERT INTO StudentScore
VALUES('2301234734','20192','COMP6141','82','B+')
INSERT INTO StudentScore
VALUES('2301234734','20192','COMP6143','87','A-')
INSERT INTO StudentScore
VALUES('2301234734','20192','COMP6449','89','A-')
INSERT INTO StudentScore
VALUES('2301234734','20192','ENGL6171','91','A')
INSERT INTO StudentScore
VALUES('2301234734','20192','ISYS6440','88','A-')
SELECT * FROM StudentScore

--TAMBAHAN TEST DATA UNTUK QUERY
INSERT INTO StudentScore
VALUES('2301234734','20193','ACCT6164','0','F')
INSERT INTO StudentScore
VALUES('2301234734','20193','COMP6141','35','E')
INSERT INTO StudentScore
VALUES('2301234734','20193','COMP6143','79','B')
INSERT INTO StudentScore
VALUES('2301234734','20193','COMP6449','100','A'), ('2301234734','20193','ENGL6171','0','F'), ('2301234734','20193','ISYS6440','0','F')
SELECT * FROM StudentScore

--TABEL STUDENT SCORE DETAIL //Data insert into values terhapus (lupa di save)
SELECT * FROM StudentScoreDetail

-- 2.
--2a.
SELECT * FROM Course
WHERE Credit > 3

--2b.
SELECT StudentID, 
	   StudentName,
	   s.ProgramID,
	   ProgramName
FROM Student s
JOIN Program p 
ON s.ProgramID = p.ProgramID

-- 3.
--Subquery with aggregate
SELECT 
	CourseName, 
	StudentScore.CourseID, 
	Semester, 
	'#Students' = COUNT(Student.StudentID),
SUM(CASE WHEN StudentScore.Grade = 'A' THEN 1 ELSE 0 END) AS 'A',
SUM(CASE WHEN StudentScore.Grade = 'A-' THEN 1 ELSE 0 END) AS 'A-',
SUM(CASE WHEN StudentScore.Grade = 'B+' THEN 1 ELSE 0 END) AS 'B+',
SUM(CASE WHEN StudentScore.Grade = 'B' THEN 1 ELSE 0 END) AS 'B',
SUM(CASE WHEN StudentScore.Grade = 'B-' THEN 1 ELSE 0 END) AS 'B-'
FROM StudentScore
JOIN Course
ON StudentScore.CourseID = Course.CourseID
JOIN Student
ON StudentScore.StudentID = Student.StudentID
JOIN Weight
ON StudentScore.Grade = Weight.Grade
GROUP BY CourseName, Semester, StudentScore.CourseID

-- 4.
GO
SELECT 
	StudentScore.StudentID, 
	Student.StudentName,
	StudentScore.Semester,
	SUM (Course.Credit) AS [CREDIT SEMESTER],
	CAST(SUM(Weight.Weight * Course.Credit) / SUM(Course.Credit) AS DECIMAL (15, 2)) AS [SEMESTER GPA],
	-- MULAI SUBQUERY 1 // RUMUSNYA
	'CREDIT CULUMATIVE' = (SELECT SUM(Course.Credit)
		FROM StudentScore
		JOIN Course 
		ON StudentScore.CourseID = Course.CourseID
		WHERE StudentScore.Semester >= StudentScore.Semester),
		-- MULAI SUBQUERY 2 // RUMUSNYA
	'CUMULATIVE GPA' = (SELECT CAST(SUM (Weight.Weight * Course.Credit) / SUM(Course.Credit) AS DECIMAL(15, 2))
		FROM StudentScore
		JOIN Course
		ON StudentScore.CourseID = Course.CourseID
		JOIN Weight
		ON StudentScore.Grade = Weight.Grade
		WHERE StudentScore.Semester >= StudentScore.Semester)
		-- selesai subquery
	FROM Student
	--Menggabungkan 3 tabel menjadi 1 tabel
	JOIN StudentScore
	ON Student.StudentID = StudentScore.StudentID
	JOIN Course
	ON StudentScore.CourseID = Course.CourseID
	JOIN Weight
	ON StudentScore.Grade = Weight.Grade
	GROUP BY StudentScore.StudentID, Student.StudentName, StudentScore.Semester

-- 5. STORED PROCEDURE
GO
CREATE PROC Sp_CreateNewStudent
(
--PARAMETER YANG KITA CARI
	 @studentid VARCHAR(12),
 	 @studentname VARCHAR(255),
	 @placeofbirth VARCHAR(255),
	 @dateofbirth DATE,
	 @programid VARCHAR(8),
	 @address VARCHAR(255)
)
AS
BEGIN

			INSERT INTO Student --MEMASUKKAN DATA SESUAI PARAMETER
			VALUES
			(
			@studentid,
			@studentname,
			@placeofbirth,
			@dateofbirth,
			@programid,
			@address
			)
END
GO

EXEC Sp_CreateNewStudent '2301850550', 'ANGELIN MINARTO', 'Tangerang' , '2001/05/26', '25', 'Jl. Duren Villa Blok D3 no. 5'
SELECT * FROM Student

-- 6. TRIGGER //menjaga integritas data dari tabel tertentu dan sistemnya akan update secara otomatis mengikuti perubahan pada insert, delete atau update
--TRIGGER (INSERT, UPDATE, DELETE)
GO
ALTER TRIGGER Trigger_UpdateStudentScore 
ON StudentScoreDetail
	AFTER INSERT, UPDATE, DELETE
AS 
BEGIN
	--Mendeclare sesuai data create table
	DECLARE @StudentID VARCHAR(12)
	DECLARE @Semester VARCHAR(8)
	DECLARE @CourseID CHAR(8)
	DECLARE @TotalScore INT
	DECLARE @Grade CHAR(2)

	--Get data from  insert/update
	SELECT 
		@StudentID = inserted.StudentID,
		@Semester = inserted.Semester,
		@CourseID = inserted.CourseID
	FROM inserted

	--Get data from delete
	SELECT
		@StudentID = deleted.StudentID,
		@Semester = deleted.Semester,
		@CourseID = deleted.CourseId
	FROM deleted

	--Insert Case
	SET @TotalScore = (SELECT CAST(SUM((Score * [Weight]) / 100) AS INT )
						FROM StudentScoreDetail 
						JOIN ScoreComponent sc
						ON StudentScoreDetail.Component = sc.Component
						WHERE StudentID LIKE @StudentID
						AND Semester LIKE @Semester
						AND CourseID LIKE @CourseID)
	SET @Grade = (SELECT Grade 
				  FROM Weight
				  WHERE @TotalScore 
				  BETWEEN ScoreMin AND ScoreMax)
		UPDATE StudentScore
		SET TotalScore = @TotalScore, Grade = @Grade
		WHERE StudentID LIKE @StudentID
			AND Semester LIKE @Semester 
			AND CourseID LIKE @CourseID
END

BEGIN TRAN
UPDATE StudentScoreDetail SET Score = 0
WHERE CourseID = 'ACCT6164' AND SEMESTER = '20192' AND StudentID = '2301234734' AND Component = 'ASG' 

BEGIN TRAN
DELETE StudentScoreDetail
WHERE CourseID = 'ACCT6164' AND SEMESTER = '20192' AND StudentID = '2301234734' AND Component = 'ASG' 

ROLLBACK

SELECT * FROM StudentScoreDetail

SELECT * FROM StudentScore

