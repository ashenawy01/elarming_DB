
-- DML File




 
--     ((((((       Queries       )))))))



-- 1.	Select The full name of students users, their IDs, Academic year their current semester

 Select Fname + ' ' + Lname AS 'Full name', User_ID, Ac_Year, Semester
 From Users u right join Student s
 On u.User_ID = s.Stud_ID;


-- 2.	Select All students First name and ID who study Math 1 or 2 in their First Academic year

 Select Fname + ' ' + Lname AS 'Full name', User_ID
 From Users
 Where User_ID IN
		(Select Stud_ID  From Study st join Module m 
		On st.Mod_ID = m.Mod_ID
		and m.Mod_name = 'Database 1');


-- 3.	Select each student�s full name and his module�s name, ID and Progress of his current semester for all students 
 Select Stud_ID,  Ac_Year, Semester, Mod_name, r.Progress
 from Student Join
		(Select Stud_ID AS id, Mod_name, s.Progress
		From Study s join Module m
		On s.Mod_ID = m.Mod_ID
		) r
		On Student.Stud_ID = r.id;
	
	
-- 4- Select the name of student with ID 225328  and the number of his enrollment module
 Select s.Fname, Count(Mod_name)
 From (Select * From Users Join Student s on Stud_ID = User_ID and Stud_ID = 225328) s 
	Join (Select Stud_ID AS id, Mod_name
		From Study s join Module m
		On s.Mod_ID = m.Mod_ID
		) r
	On s.Stud_ID = r.id
	Group by S.Fname;

-- 5- The modules and progress of the student whose ID is 227824
 Select m.Mod_ID, m.Mod_name, s.Progress
 From Module m
 Join (Select * From Study
		Where Stud_ID = 227824) s
		On m.Mod_ID = s.Mod_ID;

-- Insertation to test the next query
 /*Insert Into Study(Stud_ID, Mod_ID, Progress, Enroll_date, Grade)
 Values (225328, 267, 97, '05.01.2020', 55);*/

-- 6- Selectc the past modules' id, name and grade of the student with ID 225328 (Enroll Date < 2022)
 Select m.Mod_ID, m.Mod_name, s.Grade
 From Module m
 Join (Select * From Study
		Where Stud_ID = 225328 
		and Enroll_date < '01.01.2022') s
		On m.Mod_ID = s.Mod_ID;


-- 7- Select the user name who is a year 1 students and enrolled in databse 1
 Select Stud_ID, Fname + ' ' + Lname As 'Full Name'
 From Users join Student
 On User_ID = Stud_ID
 And Stud_ID IN 
			(Select Stud_ID 
			From Study st join Module m
			On st.Mod_ID = m.Mod_ID
			AND m.Mod_name = 'Database 1');          

			
-- 8 - Select all proffesors who teach Database 1 or Database 2

-- Insert for testing the next query 
 /*INSERT INTO Teach (Stuff_ID, Mod_ID, Is_creator)
 VALUES (123, 136, 1), (134, 190, 0);*/

 Select Fname As 'Prof Name', Stuff_ID 
 From Users join (Select * From Stuff where profession = 'Professor') p
 On User_ID = Stuff_ID
 And p.Stuff_ID IN
		(Select Stuff_ID From Teach T join Module M
		ON T.Mod_ID = M.Mod_ID
		AND (UPPER(Mod_name) = 'DATABASE 1' OR UPPER(Mod_name) = 'DATABASE 2'));



-- 9 - Get all TAs who are student as well and present their department
 Select Stuff_ID, Fname, Lname, Ac_year, Dept_name
 From Users Join 
		(Select * From Stuff s where profession = 'TA') s
		on User_ID = s.stuff_ID
		join Student
		on s.Stuff_ID = Stud_ID;

-- 10 - Present all Students name and id with their address
 Select Fname + ' ' + Lname As 'Student name', u.User_ID,  ad.City
 From (Select * From Users Where User_ID IN 
				(Select Stud_ID From Student)) u
	Join 
	User_Address ad
	on u.User_ID = ad.User_ID;

-- 11 Select the The stuff name and profession who can delete course and insert course
 Select Fname + ' ' + Lname As 'Full Name', Profession
 From 
	(Select * From Users Join Stuff on User_ID = Stuff_ID WHERE Fname IS NOT NULL AND Lname IS NOT NULL) stf
	Join 
	User_Role r
	ON stf.Role_ID = r.Role_ID
	AND r.Insert_crs = 1
	AND r.Delete_crs = 1;

-- 12- Present All Professions with their role name and its accessability
 Select  Profession, Role_name, 
 Case Add_user
	When  1 Then 'True'
	When 0 Then 'False'
	End 'Add User' 
	,
	Case Edit_user
	When  1 Then 'True'
	When 0 Then 'False'
	End 'Edit User' 
	,
	Case Insert_crs
	When  1 Then 'True'
	When 0 Then 'False'
	End 'Insert Course' 
	,
	Case Delete_crs
	When  1 Then 'True'
	When 0 Then 'False'
	End 'Delete course' 
 From Stuff s Join User_Role u
 On s.Role_ID = u.Role_ID;

-- 13- Number of students payed online
 SELECT COUNT(*) AS 'Number of students paid credit' 
 FROM Online_Pay
 WHERE Trans_type = 'online payment';

-- 14- Total number of payments from all students
 SELECT SUM(Amount) AS 'Total amount of payments by students' 
 FROM Online_Pay;


-- 15- Number of students in each module 
 SELECT Mod_ID, COUNT(Stud_ID) AS 'Number of Students'
 FROM Study
 GROUP BY Stud_ID,Mod_ID;

-- 16- Number of exams made by Dr Doaa
 SELECT COUNT(*) AS 'Number of exams made by Dr Doaa'
 FROM Past_Exam
 WHERE Creator = 'Dr_Doaa';

-- 17- Student names with 'Meet your TA' comment on their task
 SELECT stud_ID, Fname + ' ' + Lname AS 'Full_name' , Comment 
 FROM Submission, Users
 WHERE User_ID = Stud_ID
 AND Comment LIKE '%Meet your TA%';
 
-- 18- Number of users in each department
 SELECT Dept_name, count(User_ID) AS ' Number of users' 
 FROM Users
 Group BY Dept_name;


-- 19- Names of students offline on student hub on motion graphics course
 SELECT Stud_ID, Fname + ' ' + Lname AS 'Full name', IS_online
 FROM StudHub_Enroll, Users
 WHERE User_ID = Stud_ID
 AND Hub_ID = 7
 AND Is_online = 0;

-- 20- How many students enrolled into each course in student hub
 SELECT Title, Count(Stud_ID)
 FROM Student_Hub, StudHub_Enroll
 WHERE ID = Hub_ID
 Group by Title

-- 21- Name of students' progress over 50 in summer program
 SELECT Stud_ID,Fname + ' ' + Lname AS 'Full name', Progress
 FROM Users, Sum_Enroll
 WHERE USER_ID = Stud_ID
 AND Progress > 50;

-- 22- How many students enrolled into each course in summer program
 SELECT Title, Count(Stud_ID)
 FROM Summer_Prog, Sum_Enroll
 WHERE ID = Sum_ID
 Group by Title;
	
-- 23- Query to show modern and old sites "Learn = old, Learn1=new"  

 SELECT M.Mod_ID, Mod_name, CASE
 WHEN Mod_link LIKE '%learn1.%' THEN 'Modern'
 WHEN Mod_link LIKE '%learn.%'THEN 'Old'
 END 'Site_State'
 FROM [Module] M
 JOIN Course_Overview ON Course_Overview.Mod_ID=M.Mod_ID;

-- 24-Query to show site id from the site link

 SELECT M.Mod_ID, Mod_name,RIGHT(Mod_link,4) AS Site_ID
 FROM Module M
 JOIN Course_Overview ON Course_Overview.Mod_ID=M.Mod_ID;

-- 25-Query to show the creators who have more than one module in Past exams  

 SELECT *
 FROM Past_Exam
 WHERE Creator IN
  (
   SELECT Creator 
   FROM Past_Exam 
   GROUP BY Creator
   HAVING COUNT(Creator)>1
  );

-- 26-Query to show past exams files that older than 11.11.2019

 SELECT ID,Mod_name, Title AS OLD_EXAMS,Exam_date
 FROM [Module] M
 JOIN(
 SELECT * FROM [Past_Exam] 
 WHERE Exam_date<='11.11.2019'
 )P
 ON M.Mod_ID=P.Mod_ID;
 
-- 27-Query to show course work without final

 SELECT ID,Mod_name,Title AS Course_Work,Exam_date
 FROM Module M 
 JOIN (
 SELECT * FROM Past_Exam
 WHERE Title LIKE '%ClassTest%' 
 OR Title LIKE '%LabTest%'
 )P
 ON P.Mod_ID=M.Mod_ID;

-- 28-Query to show files that more than 15.5 miga bite  

 SELECT File_ID,Mod_name, name,size
 FROM Module M
 JOIN(
 SELECT * FROM Mod_Files
 WHERE [size]>15.5
 )F
 ON M.Mod_ID=F.Mod_ID;
 
-- 29-Query to show files that belong to semester 1

 SELECT F.Mod_ID,File_ID , Mod_name, name ,F_type,upload_date,Semester_No
 FROM Mod_Files F
 INNER JOIN (
 SELECT * FROM Module 
 WHERE Semester_No = 1
 )M
 ON M.Mod_ID=F.Mod_ID;

-- 30-Query to calculate the remaining time in days 

 SELECT Task_ID,DATEDIFF(DAY,Open_date,Deadline)AS Days_Remaining,Group_NO
 FROM Task
 WHERE Group_NO IS NOT NULL
 ORDER BY  Days_Remaining DESC;

-- 31-Query to show repeaters ID and Repeated times

 SELECT Task_ID AS Reapeatrs_ID, Attemps_No AS Repeated_Times,T_weight,T_type AS Assignment
 FROM Task
 WHERE Attemps_No>1
 ORDER BY Repeated_Times DESC;

-- 32-Query To show the Individual Tasks ID with its grade

 SELECT Task_ID AS Individual_Task_ID , T_weight
 From Task
 Where Group_NO IS NULL;
 
-- 33-Query to show students name,ID with issues in thier submition

 SELECT S.Stud_ID,Fname + ' ' + Lname As 'Full Name',Comment AS Promblem
 FROM Student Stu
 JOIN Users ON Users.User_ID=Stu.Stud_ID
 JOIN(
	 SELECT * FROM Submission
	  WHERE Comment IS NOT NULL
 )S
 ON S.Stud_ID=Stu.Stud_ID;
 
-- 34-Query that Calulate the student grade with letter
 
 SELECT  Submission.Stud_ID,Fname + ' ' + Lname As 'Full Name',Score ,T_weight,Case
 WHEN T_weight*70/100<Score THEN 'A'
 WHEN T_weight*60/100<Score THEN 'B'
 WHEN T_weight*50/100<Score THEN 'C'
 ELSE 'D'
 END 'Grade'
 FROM Submission 
 JOIN Student ON Student.Stud_ID=Submission.Stud_ID
 JOIN Users ON Users.User_ID=Student.Stud_ID
 JOIN Task ON Task.Task_ID=Submission.Task_ID
 WHERE Score IS NOT NULL
 ORDER BY Grade;
 
-- 35-Files that should be submeted with Student Name's and his id and Submit date 
 
 SELECT File_ID,Submission.Stud_ID,Fname + ' ' + Lname As 'Full Name',name,Submit_date
 FROM Sub_File
 JOIN Submission ON Submission.Sub_ID=Sub_File.Sub_ID 
 JOIN Student ON Student.Stud_ID=Submission.Stud_ID
 JOIN Users ON Users.User_ID=Student.Stud_ID
 JOIN Task ON Task.Task_ID=Submission.Task_ID;

-- 36-retriving the repeater students from all users in the system... 

 SELECT Users.Fname + ' '+ Users.Lname
 AS 'stuednt name', Student.S_Status AS 'student status' FROM users JOIN Student
 ON Users.User_ID = Student.Stud_ID
 WHERE S_Status LIKE 'repeater'
 ORDER by Fname;

-- 37-retriving the content of announcment for all modules if there are...

 SELECT Ann_Desc AS 'announcment content',
 Mod_name As 'module'
 FROM Announcement  JOIN Module 
 ON Announcement.Mod_ID = Module.Mod_ID;

-- 38-retriving the modules and the specification of those modules and the tasks that every module has and it's weight and also retriving the modules that has no tasks...

 SELECT Mod_name AS 'module name',
 Mod_specific As 'module specification'
 , T_type As 'task type'
 , T_weight As 'task weight'
 FROM Module mod left OUTER JOIN Task tsk 
 ON tsk.Mod_ID = mod.Mod_ID
 ORDER BY Mod_name;

 -- Another way to do it

 SELECT Mod_name AS 'module name',
 Mod_specific As 'module specification'
 , T_type As 'task type'
 , T_weight As 'task weight'
 FROM Module left OUTER JOIN Task
 ON Task.Mod_ID = Module.Mod_ID
 ORDER BY Mod_name;


-- 39-retriving stuff who are working in engineering department with their mails.
 SELECT s.Fname AS 'name of the stuff' 
 , s.Dept_name AS 'department name'
 , s.Mail AS 'stuff mail'
 from Users s 
 WHERE s.User_ID IN (select User_ID
 from Stuff
 where s.Dept_name = 'engineering');

-- 40-retriving the users who works as TA's and in the same time they are students and what department they are working on...
 SELECT s.Fname AS 'name of the stuff' 
 , s.Dept_name AS 'department name'
 from Users s 
 WHERE s.User_ID IN (select User_ID
 from Stuff, Student
 where s.User_ID = Stuff.Stuff_ID AND
  s.User_ID=Student.Stud_ID );

-- 41-retriving the teacher name and the id of this teacher from the users who are from stuff and teaching the module that it's name is oop
 Select Stuff_ID AS 'teacher ID'
 , Fname AS 'Teacher Name' 
 From  stuff join Users
 On Stuff_ID = User_ID  
 And Stuff_ID IN 
		(Select Stuff_ID 
		From Module m join  Teach t 
		On m.Mod_ID  = t.Mod_ID  
		AND m.Mod_name = 'oop');

-- 42-retriving the amount, the date and the type of the transaction for the students whose payment amount is greater than 100k pounds.
 Select op.Amount AS 'amount of transaction'
 , op.Trans_type AS 'transaction Date'
 , op.Pay_date AS 'pament date'
 , s.Stud_ID AS 'student Id'
 , s.Ac_year AS 'academic year'
 From Online_Pay op
 Join (Select * From Online_Pay
		Where Amount >100000 ) s
		On op.Stud_ID = s.Stud_ID;

-- 43-retriving the sum , avrage , max, min payment amount for all student who are in year one and paid the fees before the beginning of the new year 2022 ... 
 SELECT SUM (Amount) AS 'sum of payments'
 , AVG (Amount) AS 'avrage of payments'
 , MIN (Amount) AS 'minimum  payment'
 , MAX (Amount) AS 'maximum  payment'
 FROM Online_Pay WHERE  Ac_year= 1 AND Pay_date < '01.01.2022';