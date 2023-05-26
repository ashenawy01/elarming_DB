CREATE DATABASE BUE_ELEARNING_SYSTEM;



-- Setting format of date of Insertation (DD/MM/YYYY) EX. '15.12.2022'
SET DATEFORMAT 'dmy';



-- Creating DATABSE TABLES (Schema Implementation)

-- Create Role Table 
-- Many attributes is BIT so that it stores 0 or 1 only (True/False)
Create table User_Role (
Role_ID INT,
Role_name varchar(50) NOT NULL UNIQUE,
Insert_crs BIT Default 0,
Update_crs BIT Default 0,
Add_user BIT Default 0,
Edit_user BIT Default 0

CONSTRAINT Role_PK primary key (Role_ID)
);

-- Add another Column
Alter table User_Role add Delete_crs BIT;

-- Add constraint to set the default value to 0
Alter table User_Role
Add Constraint Dlt_NN
Default 0 for Delete_crs;

-- A constrain was made to check the data value 0 or 1
Alter table User_Role
Add Constraint CHK_Role
Check (Delete_crs = 0 OR Delete_crs = 1);

-- It was found that there is no point for such a constraint, so It is dropped 
Alter table User_Role
Drop constraint CHK_Role;

-- Inserting Data
Insert INTO User_Role(Role_ID, Role_name, Insert_crs, Update_crs, Delete_crs, Add_user, Edit_user)
Values (1, 'Admin', 1, 2, 4, 5, 6);

Insert INTO User_Role(Role_ID, Role_name, Insert_crs, Update_crs, Delete_crs)
Values (2, 'Professor', 1, 1, 1);

Insert INTO User_Role(Role_ID, Role_name, Insert_crs, Update_crs, Delete_crs, Add_user, Edit_user)
Values (3, 'TA', 0, 1, 2, 0, 0);

-- Update one row cause one 
UPDATE User_Role
SET Delete_crs = 0
WHERE Role_name = 'TA';

Insert INTO User_Role(Role_ID, Role_name, Insert_crs, Update_crs, Delete_crs, Add_user, Edit_user)
Values (4, 'Teache', 1, 1, 0, 0, 0);

Insert INTO User_Role(Role_ID, Role_name)
Values (5, 'Checker');

Insert INTO User_Role(Role_ID, Role_name, Insert_crs, Update_crs, Delete_crs, Add_user, Edit_user)
Values (6, 'Tech', 0, 0, 0, 0, 1);

Insert INTO User_Role(Role_ID, Role_name, Insert_crs, Update_crs, Delete_crs, Add_user, Edit_user)
Values (7, 'Dean', 0, 0, 0, 1, 1);


Insert INTO User_Role(Role_ID, Role_name, Update_crs, Edit_user)
Values (8, 'Adviser', 1, 1); 


Insert INTO User_Role(Role_ID, Role_name, Update_crs, Delete_crs)
Values (0, 'Adiser', 2, 4); 
 
-- Deleting a mistaken Row.
Delete from User_Role
where Role_ID = 0;

-- *****************************************************************************************************

-- Creating User table 
Create table Users(
User_ID INT,
Fname varchar(50) not null,
Lname varchar(50),
Pass varchar(50) not null,
Img_src varchar(300),
Mail varchar(100) not null,
Dept_name varchar(100)

constraint user_PK primary key (User_ID),
constraint pass_CHK check (len(Pass) > 5 and pass like '%[0-9]%' and pass like '%[A-Z]%')
);

-- Adding a constraint to check the email address to follow BUE rules
Alter table Users
Add constraint mail_chk check(Mail like '%@bue.edu.eg');



-- Inserting Data
-- the user_ID's which consist of 6 digits is refering to a student user and which consist of 3 digits refering to a stuff 
-- ID's  which consist of 6 digits and is used for a stuff, beacasue this stuff is an TA and in the same time is a student so his/her id is a student ID (6 digits ID)....

insert into Users (User_ID, Fname, Lname, Pass, Mail, Dept_name)
Values (225328, 'Abdelrhman', 'Elshenawy', 'aaAA1234', 'abdelrhman225328@bue.edu.eg', 'ICS');

-- Adding a forgetn attribute
update Users
SET Img_src = 'midea/img/225328.jpg'
where User_ID = 225328;


insert into Users (User_ID, Fname, Pass, Mail)
Values (224455, 'Doaa', 'aad934', 'Doaa@bue.edu.eg');

insert into Users
(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (227824, 'mostapha', 'abdulaziz', 'aaAA1234', 'picturs/24984r4.jpeg', 'mostapha227824@bue.edu.eg', 'ICS');

insert into Users
Values (226444, 'ahmed', 'elshal', 'babb1453', 'picturs/226444.jpeg', 'ahmed226444@bue.edu.eg', 'ICS');

insert into Users
Values (213434, 'menna', 'ashraf', 'aaAA1234', 'picturs/213434.png', 'menna213434@bue.edu.eg', 'ICS');

insert into Users
Values (203422, 'maram', 'ahmed', 'aaAA1234', 'picturs/203422.jpeg', 'maram203422@bue.edu.eg', 'Masscom');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (234284, 'abanob', 'zaky', 'aaAA1234', 'picturs/234284.jpeg', 'abanob234284@bue.edu.eg', 'Arts and Design');

-- Updating an atrribute
UPDATE Users
SET Dept_name = 'Humanites'
WHERE User_ID = '234284';
insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (234345, 'maha', 'ramy', 'aaAA1234', 'picturs/234345.jpeg', 'maha234345@bue.edu.eg', 'Arts and Design');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (223432, 'kareem', 'alaa', 'aaAA1234', 'picturs/223432.jpeg', 'kareem223432@bue.edu.eg', 'engineering');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (203434, 'randa', 'samy', 'aaAA1234', 'picturs/203434.jpeg', 'randa203434@bue.edu.eg', 'nursing');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (234994, 'yara', 'soliman', 'aaAA1234', 'picturs/234994.jpeg', 'yara234994@bue.edu.eg', 'Arts and Design');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (123, 'samy', 'zaky', 'aaAA1234', 'picturs/123.jpeg', 'samy.zaky@bue.edu.eg', 'law');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (134, 'mohamed', 'ashraf', 'aaAA1234', 'picturs/134.jpeg', 'mohamed.ashraf@bue.edu.eg', 'masscom');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (145, 'rana', 'saher', 'aaAA1234', 'picturs/145.jpeg', 'rana.saher@bue.edu.eg', 'arts and design');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (156, 'sandra', 'noamaan', 'aaAA1234', 'picturs/156.jpeg', 'sandra.nomaan@bue.edu.eg', 'ICS');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (167, 'merihan', 'gerges', 'aaAA1234', 'picturs/167.jpeg', 'merihan.gerges@bue.edu.eg', 'engineering');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (178, 'ramy', 'aiash', 'aaAA1234', 'picturs/178.jpeg', 'ramy.aiash@bue.edu.eg', 'nursing');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (189, 'merry', 'zaky', 'aaAA1234', 'picturs/189.jpeg', 'merry.zaky@bue.edu.eg', 'dentestiry');

insert into Users(User_ID, Fname, Lname, Pass, Img_src, Mail, Dept_name)
Values (190, 'maria', 'ahmed', 'aaAA1234', 'picturs/190.jpeg', 'maria.ahmed@bue.edu.eg', 'law');


-- *****************************************************************************************************

-- Creating Address Table (Multi-valued attribute in User Table)
Create table User_Address(
User_ID INT, 
City varchar(30),
Region varchar(30),
Str_name varchar(30),
Str_No INT,
Zip INT

Constraint Addr_PK primary key (User_ID)
);

-- Connect the address to the user
Alter table User_Address
Add constraint addrs_FK Foreign key (User_ID) References Users(User_ID) on delete CASCADE ON UPDATE CASCADE;

-- Inserting Data
Insert into User_Address(User_ID, City, Region, Str_name, Str_No, Zip)
Values (225328, 'Cairo', 'Elshorouk', 'Elsadat', 122, 117532);
Insert into User_Address(User_ID, City, Region, Str_No, Zip)
Values (224455, 'Alex', 'Sedepishr', 11, 1317532);

Insert into User_Address(User_ID, City, Region, Str_name, Str_No, Zip)
Values (227824, 'alex', 'Elmotazah', 'omar ibn elkhatab', 125, 117562);

Insert into User_Address(User_ID, City, Region, Str_name, Str_No, Zip)
Values (226444, 'cairo', '5th setellment', 'elsafwa', 139, 115452);

Insert into User_Address(User_ID, City, Region, Str_name, Str_No, Zip)
Values (213434, 'giza', '6th of october', 'alhoria', 132, 117642);

Insert into User_Address(User_ID, City, Region, Str_name, Str_No, Zip)
Values (203422, 'menofia', 'shiben', 'elmary', 142, 114562);

Insert into User_Address(User_ID, City, Region, Str_name, Str_No, Zip)
Values (234284, 'new Cairo', 'madinaty', 'Elmonara', 155, 113432);

Insert into User_Address(User_ID, City, Region, Str_name, Str_No, Zip)
Values (234345, 'qaliobia', 'benha', 'omar ibn abdelaziz', 182, 114532);

Insert into User_Address(User_ID, City, Region, Str_name, Str_No, Zip)
Values (223432, 'gharbia', 'tanta', 'elshohda', 162, 117562);

Insert into User_Address(User_ID, City, Region, Str_name, Str_No, Zip)
Values (203434, 'Cairo', 'Elmokatam', 'ahmed khairi', 192, 110532);

Insert into User_Address(User_ID, City, Region, Str_name, Str_No, Zip)
Values (234994, 'Cairo', 'garden city', 'abass basha', 102, 118032);


-- *****************************************************************************************************

-- Creating Phone table (Mali-valued attribute)
-- User can have mmore than one number
Create table Phone (
Phone_ID INT primary key,
Phone_No INT,
IS_Confirmed BIT default 0,
User_ID INT

Constraint user_phone foreign key (User_ID) references Users(User_ID)  On delete cascade on update cascade
);

-- Editing soms column with conditions 
Alter table Phone 
Alter column Phone_No varchar(20) not null;

Alter table Phone
Add unique (Phone_No);


-- Insering Data ....
insert into Phone(Phone_ID, Phone_No, IS_Confirmed, User_ID)
Values (1, '01117168861', 1, 225328);

insert into Phone(Phone_ID, Phone_No, IS_Confirmed, User_ID)
Values (2, '01093773833', 1, 225328);


insert into Phone(Phone_ID, Phone_No, IS_Confirmed, User_ID)
Values (3, '01093458736', 0, 226444);

insert into Phone(Phone_ID, Phone_No, IS_Confirmed, User_ID)
Values (4, '01092356430', 1, 213434);

insert into Phone(Phone_ID, Phone_No, IS_Confirmed, User_ID)
Values (5, '01293453532', 1, 203422);

insert into Phone(Phone_ID, Phone_No, IS_Confirmed, User_ID)
Values (6, '01176773833', 1, 234284);

insert into Phone(Phone_ID, Phone_No, IS_Confirmed, User_ID)
Values (7, '01567773835', 1, 234345);

insert into Phone(Phone_ID, Phone_No, IS_Confirmed, User_ID)
Values (8, '012678773833', 0, 223432);

insert into Phone(Phone_ID, Phone_No, IS_Confirmed, User_ID)
Values (9, '01093734567', 1, 203434);

insert into Phone(Phone_ID, Phone_No, IS_Confirmed, User_ID)
Values (10, '01093774564', 1, 234994);


-- *****************************************************************************************************
-- Creating Studebt 
-- Student status can be New, repeater or graduted

create table Student(
Stud_ID INT,
Ac_year INT,
Semester TINYINT,
S_Status varchar(30) default 'New'

constraint stud_PK primary key (Stud_ID)
);

-- Editing some column 
Alter table Student
Alter column Semester TINYINT not null;
Alter table Student
Alter column Ac_year Tinyint;

-- Connect Student to User to make sure that each student is a user
Alter table Student 
add constraint Stud_Fk foreign key (Stud_ID) references Users(User_ID)
On Delete CASCADE
ON UPDATE CASCADE;

-- Inserting Date ....
Insert into Student (Stud_ID, Ac_year, Semester)
Values (225328, 2, 1);

Insert into Student (Stud_ID, Ac_year, Semester)
Values (227824, 1, 1);

Insert into Student (Stud_ID, Ac_year, Semester)
Values (226444, 3, 1);

Insert into Student (Stud_ID, Ac_year, Semester, S_Status)
Values (213434, 1, 1, 'repeater');

Insert into Student (Stud_ID, Ac_year, Semester)
Values (203422, 2, 1);

Insert into Student (Stud_ID, Ac_year, Semester)
Values (234284, 1, 1);

Insert into Student (Stud_ID, Ac_year, Semester)
Values (234345, 1, 1);

Insert into Student (Stud_ID, Ac_year, Semester)
Values (223432, 2, 1);

Insert into Student (Stud_ID, Ac_year, Semester,S_Status)
Values (203434, 3, 1, 'repeater');

Insert into Student (Stud_ID, Ac_year, Semester)
Values (234994, 4, 1);


-- *****************************************************************************************************

-- Creating Stuff table 
Create table Stuff (
Stuff_ID INT,
profession varchar(30),
Role_ID INT

constraint stuff_role foreign key (Role_ID) references User_Role(Role_ID)
);

-- Editing some column
alter table Stuff
alter column Stuff_ID INT not null;

Alter table Stuff
Add constraint stuff_pk  primary key (Stuff_ID);

alter table Stuff
alter column Role_ID INT not null;

-- connecting the stuff to the user to make sure that each stuf is a user
Alter table Stuff 
add constraint stuff_Fk foreign key (Stuff_ID) references Users(User_ID)
On Delete CASCADE
ON UPDATE CASCADE;

Insert into Stuff (Stuff_ID, profession, Role_ID)
Values (224455, 'prof', 2);
INSERT into Stuff(Stuff_ID, profession, Role_ID)
values (203434, 'TA',3);


INSERT into Stuff(Stuff_ID, profession, Role_ID)
values (234345, 'TA',3);


INSERT into Stuff(Stuff_ID, profession, Role_ID)
values (123, 'Professor',2);

INSERT into Stuff(Stuff_ID, profession, Role_ID)
values (134, 'Professor',2);

INSERT into Stuff(Stuff_ID, profession, Role_ID)
values (145, 'Teacher',4);

INSERT into Stuff(Stuff_ID, profession, Role_ID)
values (156, 'Checker',5);

INSERT into Stuff(Stuff_ID, profession, Role_ID)
values (167, 'Dean',7);

INSERT into Stuff(Stuff_ID, profession, Role_ID)
values (178, 'Adviser',8);

INSERT into Stuff(Stuff_ID, profession, Role_ID)
values (189, 'Checker',5);

INSERT into Stuff(Stuff_ID, profession, Role_ID)
values (190 , 'TA',3);
-- *****************************************************************************************************

-- Creatin online payment table 
-- Ac_year stands for the current academic year that the fees for
create table Online_Pay (
ID INT not null,
Amount float not null,
Pay_date date default getDate(),
Ac_year Tinyint,
Trans_type varchar(45),
Stud_ID INT
); 

Alter table Online_Pay
Add constraint online_pay_Pk primary key (ID);

Alter table Online_Pay
Add constraint online_pay_FK foreign key (Stud_ID) references Student(Stud_ID)
On update cascade
On Delete set Null;

-- Inserting ...
Insert Into Online_Pay(ID, Amount, Pay_date, Ac_year, Trans_type, Stud_ID)
Values (1, 100000, '15.09.2020', 1, 'Credit Card', 225328);

Insert Into Online_Pay(ID, Amount, Pay_date, Ac_year, Trans_type, Stud_ID)
Values (232, 93000, '03.08.2020', 1, 'online payment', 227824);

Insert Into Online_Pay(ID, Amount, Pay_date, Ac_year, Trans_type, Stud_ID)
Values (342, 130000, '13.12.2020', 3, 'Credit Card', 226444);

Insert Into Online_Pay(ID, Amount, Pay_date, Ac_year, Trans_type, Stud_ID)
Values (452, 80000, '30.09.2020', 1, 'Credit Card', 213434);

Insert Into Online_Pay(ID, Amount, Pay_date, Ac_year, Trans_type, Stud_ID)
Values (454, 113000, '18.07.2020', 2, 'cash', 203422);

Insert Into Online_Pay(ID, Amount, Pay_date, Ac_year, Trans_type, Stud_ID)
Values (723, 40000, '15.11.2020', 1, 'cash', 234284);

Insert Into Online_Pay(ID, Amount, Pay_date, Ac_year, Trans_type, Stud_ID)
Values (942, 115000, '29.11.2020', 1, 'bank transfer', 234345);

Insert Into Online_Pay(ID, Amount, Pay_date, Ac_year, Trans_type, Stud_ID)
Values (158, 170000, '22.08.2020', 2, 'Credit Card', 223432);

Insert Into Online_Pay(ID, Amount, Pay_date, Ac_year, Trans_type, Stud_ID)
Values (931, 99000, '05.11.2020', 3, 'online payment', 203434);

Insert Into Online_Pay(ID, Amount, Pay_date, Ac_year, Trans_type, Stud_ID)
Values (530, 123000, '14.09.2020', 4, 'Credit Card', 234994);


-- *****************************************************************************************************
-- Ctratin Exam_TT Table (Exam Time Table)
-- Ac_year stands for the current academic year that the fees for
-- One student can have manyexams time tables
-- Img_src is must coz it is thepic of the exams table
Create table Exam_TT(
Exam_ID INT,
Ac_year Tinyint,
semester Tinyint,
publish_Date Datetime,
Img_src varchar(200) not null,
Stud_ID INT

constraint exm_PK primary key (Exam_ID),
constraint exm_FK foreign Key (Stud_ID) references Student(Stud_ID) On Delete set Null On update cascade

);

-- Inserting data ..

Insert Into Exam_TT (Exam_ID, Ac_year, semester, publish_Date, Img_src, Stud_ID) 
Values (1, 2, 1, '06/08/2013 00:00:00', 'media/exmTT23.jpg', 225328);

Update Exam_TT
Set Exam_ID = 12634
Where Exam_ID = 1;

Insert Into Exam_TT (Exam_ID, Ac_year, semester, publish_Date, Img_src, Stud_ID) 
Values (12563, 1, 1, '05/12/2019 00:00:00', 'media/exmTT23.jpg', 227824);

Insert Into Exam_TT (Exam_ID, Ac_year, semester, publish_Date, Img_src, Stud_ID) 
Values (12734, 3, 1, '06/08/2015 00:00:00', 'media/exmTT63.jpg', 226444);

Insert Into Exam_TT (Exam_ID, Ac_year, semester, publish_Date, Img_src, Stud_ID) 
Values (12465, 1, 1, '15/04/2013 00:00:00', 'media/exmTT73.jpg', 213434);

Insert Into Exam_TT (Exam_ID, Ac_year, semester, publish_Date, Img_src, Stud_ID) 
Values (65771, 2, 1, '29/03/2020 00:00:00', 'media/exmTT33.jpg', 203422);

Insert Into Exam_TT (Exam_ID, Ac_year, semester, publish_Date, Img_src, Stud_ID) 
Values (57661, 1, 1, '06/04/2022 00:00:00', 'media/exmTT55.jpg', 234284);

Insert Into Exam_TT (Exam_ID, Ac_year, semester, publish_Date, Img_src, Stud_ID) 
Values (56761, 1, 1, '06/04/2014 00:00:00', 'media/exmTT65.jpg', 234345);

Insert Into Exam_TT (Exam_ID, Ac_year, semester, publish_Date, Img_src, Stud_ID) 
Values (90871, 2, 1, '23/11/2015 00:00:00', 'media/exmTT22.jpg', 223432);

Insert Into Exam_TT (Exam_ID, Ac_year, semester, publish_Date, Img_src, Stud_ID) 
Values (89071, 3, 1, '24/04/2017 00:00:00', 'media/exmTT21.jpg', 203434);

Insert Into Exam_TT (Exam_ID, Ac_year, semester, publish_Date, Img_src, Stud_ID) 
Values (67651, 4, 1, '06/08/2013 00:00:00', 'media/exmTT23.jpg', 234994);


-- *****************************************************************************************************
-- Creating Module Table
-- Module (perent) knows only the number of its week but each Week (Child) knows its module
Create table Module(
Mod_ID INt,
Mod_name varchar(90) not null,
Mod_specific text,
Week_No INt

constraint Mod_Pk primary key (Mod_ID)
);

-- The semester and academic year are must
Alter table Module 
Add Semester_No TinyInt not null, Ac_Year TinyInt not null;

-- Inserting Data
Insert into Module(Mod_ID, Mod_name, Ac_Year, Semester_No)
Values(1, 'Database 1', 2, 1);

update Module 
Set Week_No = 12, Mod_specific = 'Database One specifications'
where Mod_ID = 1;

update Module 
Set Mod_ID = 136
where Mod_ID = 1;

Insert into Module(Mod_ID, Mod_name, Mod_specific, Week_No, Ac_Year, Semester_No)
Values(267, 'math2', 'Math 2 students study quadratic, square root and inverse variation functions. In geometry units,
 students study rigid motions and prove theorems about lines, angles and properties of triangles. The focus is on congruence, similiarity and right triangle trigonometry.',7,3,1);

Insert into Module(Mod_ID, Mod_name, Mod_specific, Week_No, Ac_Year, Semester_No)
Values(345, 'technical writing', 'The traditional definition of technical writing is: Technical writing is the practice of documenting processes such as software manuals or instructional materials.
 Traditionally it was limited to user manuals of some sort.',8,1,1);

Insert into Module(Mod_ID, Mod_name, Mod_specific, Week_No, Ac_Year, Semester_No)
Values(454, 'oop', 'Object-oriented programming (OOP) is a computer programming model that organizes software design around data,
 or objects, rather than functions and logic. An object can be defined as a data field that has unique attributes and behavior',7,2,1);

Insert into Module(Mod_ID, Mod_name, Mod_specific, Week_No, Ac_Year, Semester_No)
Values(534, 'massmedia', 'the means of communication that reach large numbers of people in a short time such as television,
 newspapers, magazines, and radio.',8,3,1);

Insert into Module(Mod_ID, Mod_name, Mod_specific, Week_No, Ac_Year, Semester_No)
Values(634, 'electronics and digital circuts Digital','electronics and digital circuts Digital circuits or digital electronics is a branch of electronics which deals with digital signals to perform the various task to meet various requirement.
 The input signal applied to these circuits is of digital form which is represented in 0s & 1s binary language format.',7,4,1);

Insert into Module(Mod_ID, Mod_name, Mod_specific, Week_No, Ac_Year, Semester_No)
Values(745, 'Patient Care', '
 Image result for Patient Care
 Patient care refers to the prevention, treatment, and management of illness and the preservation of physical and mental well-being through services offered by health professionals.',8,2,1);

Insert into Module(Mod_ID, Mod_name, Mod_specific, Week_No, Ac_Year, Semester_No)
Values(348, 'Advanced Numerical Methods in Geomechanics', 'Numerical application of Plasticity to Geomechanics is an area of research that has grown rapidly since its origins in the late 1960s.
 This growth led to new methodologies and analysis approaches that are nowadays commonly employed in Geotechnical Engineering practice. Through the contribution of well-known scholars this book intends to provide an updated overview of some relevant developments and applications in this field. The topics covered in the various chapters of the volume can be summarised as follows: constitutive models for geomaterials, "damage|� soil mechanics, non-linear consolidation, swelling soils,
 influence of the statistical variability of soil properties on the stability of slopes and foundations, numerical analysis of ground improvement techniques, tunneling problems.',8,1,1);

Insert into Module(Mod_ID, Mod_name, Mod_specific, Week_No, Ac_Year, Semester_No)
Values(659, 'Integrated System Design', 'ISD represents some of the best known material handling and machinery manufacturers in the world to provide turn key integrated systems utilizing: conveyor, robots, automated storage and retrieval systems (ASRS),
 controls, software, pick to light, A frames, horizontal carousels, vertical lift modules (VLMs), vertical ...',8,3,1);

Insert into Module(Mod_ID, Mod_name, Mod_specific, Week_No, Ac_Year, Semester_No)
Values(190, 'Database 2', '
Db2, or Database 2, is a set of relational database products built and offered by IBM. Relational databases enable enterprises to create declarative data models accessible via queries. For this purpose,
 IBM invented the popular and now standardized Structured Query Language (SQL).',8,2,1);



-- *****************************************************************************************************

-- Creatin Teach table as a "Junction Table" to connect between Stuff and module
-- Is creator returns true or alse (is this stuff who inserted this module or not)

Create Table Teach (
Mod_ID INT,
Stuff_ID INT,
Last_update Date default getDate(),
Is_creator BIT default 0

Constraint Tech_PK primary key (Mod_ID, Stuff_ID)
);

-- Conncting the 2 main tables to make sure all ides in Teach table is exised in both tables
Alter table Teach
Add constraint Teach_mod_fk foreign key (Mod_ID) references Module(Mod_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE;

Alter table Teach
Add constraint Teach_stuff_fk foreign key (Stuff_ID) references Stuff(Stuff_ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO Teach (Mod_ID, Stuff_ID, Is_creator)
VALUES (136, 203434, 1 );
-- editing the pervious attribute
UPDATE Teach
SET Is_creator = '0'
WHERE Stuff_ID = '203434';

INSERT INTO Teach (Mod_ID, Stuff_ID, Is_creator)
VALUES (267, 234345, 0 );

INSERT INTO Teach (Mod_ID, Stuff_ID, Is_creator)
VALUES (345, 123, 1 );

INSERT INTO Teach (Mod_ID, Stuff_ID, Is_creator)
VALUES (454, 134, 1 );

INSERT INTO Teach (Mod_ID, Stuff_ID, Is_creator)
VALUES (534, 145, 1 );

INSERT INTO Teach (Mod_ID, Stuff_ID, Is_creator)
VALUES (634, 190, 0 );

INSERT INTO Teach (Mod_ID, Stuff_ID, Is_creator)
VALUES (454, 190, 0 );

INSERT INTO Teach (Mod_ID, Stuff_ID, Is_creator)
VALUES (454, 123, 1 );

INSERT INTO Teach (Mod_ID, Stuff_ID, Is_creator)
VALUES (634, 134, 1 );

INSERT INTO Teach (Mod_ID, Stuff_ID, Is_creator)
VALUES (267, 145, 1 );
-- *****************************************************************************************************

-- Creatin Study table as a "Junction Table" to connect between Student and module

Create Table Study (
Mod_ID INT,
Stud_ID INT,
Study_ID INT ,
Enroll_date Date default getDate(),
Last_view Date default getDate(),
Grade Tinyint,

Constraint Study_pk primary key (Mod_ID, Stud_ID),
Constraint Study_Hr_ID Unique(Study_ID)
);

-- Conncting the 2 main tables to make sure all ides in Teach table is exised in both tables
Alter table Study
Add constraint Study_mod_fk foreign key (Mod_ID) references Module(Mod_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE;

Alter table Study
Add constraint Study_stud_fk foreign key (Stud_ID) references Student(Stud_ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- #Later Addition: It is recognaized that the progress is related to a specific student for a specific Module
Alter table Study
Add Progress Int default 0;

-- Inserting Data
insert into Study(Mod_ID, Stud_ID, Study_ID, Grade)
values (136, 225328,30, 78);


insert into Study(Mod_ID, Stud_ID, Study_ID, Grade)
values (267, 227824,43, 76 );

insert into Study(Mod_ID, Stud_ID, Study_ID, Grade)
values (345, 226444, 55, 45 );

insert into Study(Mod_ID, Stud_ID, Study_ID, Grade)
values (454, 213434, 39, 87 );

insert into Study(Mod_ID, Stud_ID, Study_ID, Grade)
values (534, 203422, 47, 66);

insert into Study(Mod_ID, Stud_ID, Study_ID, Grade)
values (634, 234284, 54, 56);

insert into Study(Mod_ID, Stud_ID, Study_ID, Grade)
values (745, 234345, 33, 83 );

insert into Study(Mod_ID, Stud_ID, Study_ID, Grade)
values (348, 223432, 53, 90);

insert into Study(Mod_ID, Stud_ID, Study_ID, Grade)
values (659, 203434, 34, 74);

insert into Study(Mod_ID, Stud_ID, Study_ID, Grade)
values (190, 234994, 60, 39);

-- *****************************************************************************************************

-- Creating Mod_week table topresent info of each week
-- A week may have a text comment and a video but all its files are stored in another table
Create Table Mod_Week (
ID INT primary key,
Week_no TinyInt not null,
Media_src varchar(100),
Comment Text,
Mod_ID INT

Constraint week_fk Foreign key (Mod_ID) References Module(Mod_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
);
INSERT into Mod_Week(ID, Week_no,Mod_ID )
VALUES (234, 7,136 );

INSERT into Mod_Week(ID, Week_no,Mod_ID )
VALUES (865, 8, 267);

INSERT into Mod_Week(ID, Week_no,Mod_ID )
VALUES (578, 8,345 );

INSERT into Mod_Week(ID, Week_no,Mod_ID )
VALUES (976, 8,454 );

INSERT into Mod_Week(ID, Week_no,Mod_ID )
VALUES (276, 7,534 );

INSERT into Mod_Week(ID, Week_no,Mod_ID )
VALUES (386, 8,634 );

INSERT into Mod_Week(ID, Week_no,Mod_ID )
VALUES (275, 8,745 );

INSERT into Mod_Week(ID, Week_no,Mod_ID )
VALUES (354, 8,348 );

INSERT into Mod_Week(ID, Week_no,Mod_ID )
VALUES (686, 8,659);

INSERT into Mod_Week(ID, Week_no,Mod_ID )
VALUES (253, 8, 190 );

-- *****************************************************************************************************

-- Creating week hours  (Multi-Valued attribute)
-- Storing The number of hours that is spent in a mudule by a student each week
-- it is connected to one table ( Study Table )Which is a junction table between Student and Module

Create Table Week_Hr (
ID INt primary key,
Week_No TinyINT,
Day_no TinyINT,
Hr_No TinyInt,
Study_ID INT

Constraint week_hr_fk Foreign key (Study_ID) References Study(Study_ID)
On Delete Cascade
On Update Cascade
);

-- Inserting Data
insert into Week_Hr(ID, Week_no, Day_no, Hr_no, Study_ID)
values (1, 3, 23, 234, 30);

insert into Week_Hr(ID, Week_no, Day_no, Hr_no, Study_ID)
values (2, 3, 23, 254, 43);

insert into Week_Hr(ID, Week_no, Day_no, Hr_no, Study_ID)
values (3, 3, 25, 234, 55);

insert into Week_Hr(ID, Week_no, Day_no, Hr_no, Study_ID)
values (4, 4, 23, 212, 39);

insert into Week_Hr(ID, Week_no, Day_no, Hr_no, Study_ID)
values (5, 4, 26, 132, 47);

insert into Week_Hr(ID, Week_no, Day_no, Hr_no, Study_ID)
values (6, 3, 24, 193, 54);

insert into Week_Hr(ID, Week_no, Day_no, Hr_no, Study_ID)
values (7, 2, 27, 190, 33);

insert into Week_Hr(ID, Week_no, Day_no, Hr_no, Study_ID)
values (8, 3, 24, 154, 53);

insert into Week_Hr(ID, Week_no, Day_no, Hr_no, Study_ID)
values (9, 5, 30, 223, 34);

insert into Week_Hr(ID, Week_no, Day_no, Hr_no, Study_ID)
values (10, 4, 34, 224, 60);



-- *****************************************************************************************************











   

   -- Nour Start Here #####









-- Creating Course overview table to present the general info of modules in the home page
Create table Course_Overview (
Mod_ID INT,
Title varchar(50),
Img_src varchar(200),
Mod_link varchar(300),

Constraint CO_pk primary key (Mod_ID)
);

Alter table Course_Overview
Add constraint CO_fk FOREIGN KEY (Mod_ID) References Module(Mod_ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

--INSERT
 INSERT into Course_Overview(Mod_ID,Title,Img_src,Mod_link)
 VALUES 
 (634,'Elctronics and digital Circuits', 'src=learn.BUE' , 'https://learn1.bue.edu.eg/course/view.php?id=2242'),
 (454,'Object Oreintated Programming' , 'src=learn.BUE' , 'https://learn1.bue.edu.eg/course/view.php?id=2247'),
 (136,'DataBase_1', 'src=learn.BUE' , 'https://learn.bue.edu.eg/course/view.php?id=2222'),
 (267,'Math_2', 'src=learn.BUE' , 'https://learn1.bue.edu.eg/course/view.php?id=2288'),
 (345,'Technical_writing', 'src=learn.BUE' , 'https://learn1.bue.edu.eg/course/view.php?id=2218'),
 (534,'Mass_Media', 'src=learn.BUE' , 'https://learn.bue.edu.eg/course/view.php?id=2282'),
 (745,'Patient_Care', 'src=learn.BUE' , 'https://learn.bue.edu.eg/course/view.php?id=2290'),
 (348,'Numerical_Techniques', 'src=learn.BUE' , 'https://learn.bue.edu.eg/course/view.php?id=2210'),
 (659,'Integraded_System_Design', 'src=learn.BUE' , 'https://learn.bue.edu.eg/course/view.php?id=2242'),
 (190,'DataBase_2', 'src=learn.BUE' , 'https://learn1.bue.edu.eg/course/view.php?id=2278');

-- *****************************************************************************************************

--Creating Past exam table to hold past exams data of each module
CREATE Table Past_Exam (
ID Int primary key,
Title varchar(35),
Exam_date Date,
Creator varchar(50),
Mod_ID INT

Constraint Past_exam_FK foreign key (Mod_ID) References Module(Mod_ID)
);

Alter table Past_Exam
Drop Constraint Past_exam_FK;

Alter table Past_Exam
Add constraint past_exam_fk foreign key (Mod_ID) References Module(Mod_ID)
ON DELETE SET NULL
ON UPDATE CASCADE;

--INSERT

 Insert into Past_Exam(ID, Title, Exam_date, Creator, Mod_ID)
  VALUES
  (01, 'Database 1 Final', '11.11.2019', 'Dr_Doaa', 136),
  (02, 'Math 2 ClassTest 1', '11.12.2012', 'Dr_Khalid', 267),
  (03, 'Technical writing Final', '10.5.2020', 'Dr_Sara', 345),
  (04, 'OOP LabTest 1', '11.11.2012', 'Dr_Nivin', 454),
  (05, 'Massmedia ClassTest', '5.9.2018', 'Dr_Wisam', 534), 
  (06, 'Elctronics Final', '11.12.2020', 'Dr_Khalid', 634),
  (07, 'Patient Care LabTest', '11.11.2019', 'Dr_Osama', 745),
  (08, 'Advanced Numerical Methods LabTest2', '11.11.2010', 'Dr_Afaf', 348),
  (09, 'Integrated System Design LabTest', '11.10.2019', 'Dr_Shiab', 659),
  (10, 'Database 2 LabTest 2', '10.11.2019', 'Dr_Doaa', 190);

--Edit
 
  UPDATE Past_Exam
  SET Exam_date = '05.09.2018'
  WHERE ID=05;
  UPDATE Past_Exam
  SET Exam_date = '10.05.2021' , Title = 'Technical writing ClassTest'
  WHERE ID = 03;

-- *****************************************************************************************************
--Creating Module Files table to hold different kind of files
-- File types (pastExam, MarketingCriteria, Lecture, Tutorial, Guidline, WeeklyPlan)
Create table Mod_Files (
File_ID INT primary key,
name varchar(70) not null,
size Float,
F_type varchar(50),
upload_date Datetime not null,
week_no TINYINT,
Mod_ID INT

constraint Mod_file_FK foreign key (Mod_ID) References Module(Mod_ID)
ON DELETE SET NULL
ON UPDATE CASCADE
);

--INSERT

 INSERT Into Mod_Files (File_ID, name, size, F_type, upload_date, week_no, Mod_ID)
  VALUES
   (01, '21CSICO3C Dtabase System Module Specs', 22.30, 'Guidline', '12.1.2020 01:00:00 PM', 1, 136),
   (02, 'LEEE_Style', 10.5, 'Lecture', '12.1.2020 04:00:00 pm', 5, 345),
   (03, 'OOP_22-23', 22.2, 'WeeklyPlan', '10.1.2020 08:00:00 pm', 1, 454),
   (04, 'Databse_plan', 27.8, 'WeeklyPlan', '12.12.2020 01:00:00 pm', 3, 190),
   (05, 'Databse_plan', 27.8, 'WeeklyPlan', '12.12.2020 01:00:00 pm', 3, 267),
   (06, 'Databse_plan', 24.2, 'WeeklyPlan', '12.12.2020 01:00:00 pm', 0, 634),
   (07, 'Fourier_Series', 25.50, 'Lecture', '12.12.2020 01:00:00 pm', 9, 267),
   (08, 'Project Marking Criteria', 15.2, 'MarketingCriteria', '12.5.2020 01:00:00 AM', 1, 136),
   (09, 'Massmedia_Specs', 15.5, 'Guidline', '10.1.2020 12:00:00 Am', 1, 534),
   (10, 'Sentence_Fragment_WorkSheet', 25.0, 'Tutorial', '12.1.2020 12:00:00 pm', 7, 345);

--Edit

  DELETE FROM Mod_Files
  WHERE File_ID = 04;
  INSERT Into Mod_Files (File_ID, name, size, F_type, upload_date, week_no, Mod_ID)
  VALUES (04, 'OOP_Specs', 11.2, 'Guidline', '11.1.2021 08:00:00 pm', 1, 454);
  UPDATE Mod_Files
  SET name = 'Partial_Fraction',F_type='Lecture'
  WHERE File_ID = 05;
  UPDATE Mod_Files
  SET name = 'Full_Adder',F_type='Lecture'
  WHERE File_ID = 06;
  UPDATE Mod_Files
  SET upload_date = '04.04.2021 12:30:10 AM'
  WHERE File_ID = 07;


-- *****************************************************************************************************
-- Creatin Task Table
-- Each module can have a number of files
-- Task types (Report, Project, Group project)
 
CREATE TABLE Task (
Task_ID INT,
Open_date datetime not null default getDate(),
Deadline datetime not null,
Attemps_No INT,
T_type varchar(30),
T_weight TinyINT,
Group_NO TinyINT,
Mod_ID INT

CONSTRAINT Task_pk primary key (Task_ID),
Constraint Task_fk FOREIGN KEY (Mod_ID) references Module(Mod_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
);



-- Task type can be either project, group project or report


-- Inserting ..
Insert Into Task(Task_ID, Open_date, Deadline, Attemps_No, T_type, T_weight, Group_NO)
 Values 
  (01, '10.8.2020 01:30:00 pm',  '17.8.2020 11:59:00 pm', 1, 'Report', 15, 0),
  (02, '12.5.2020 12:00:00 pm',  '16.5.2020 11:59:00 pm', 2, 'Group_Project', 30, 5),
  (03, '1.12.2020 01:00:00 pm',  '1.1.2021 11:59:00 pm', 1, 'Group_Project', 50, 5),
  (04, '11.11.2020 01:00:00 pm',  '26.11.2020 11:59:00 pm', 3, 'Project', 20, 0),
  (05, '10.1.2020 01:00:00 pm',  '11.1.2021 11:59:00 pm', 1, 'Group_Project', 05, 3),
  (06, '12.12.2020 12:00:00 am',  '13.12.2020 11:59:00 pm', 2, 'Report', 20, 0),
  (07, '11.1.2021 01:00:00 pm',  '15.1.2022 11:59:00 pm', 1, 'Group_Project', 40, 4),
  (08, '10.1.2020 01:00:00 pm',  '15.1.2020 11:59:00 pm', 3, 'Report', 40, 4),
  (09, '10.1.2020 01:00:00 pm',  '15.1.2020 11:59:00 pm', 3, 'Project', 40, 4),
  (10, '10.1.2020 01:00:00 pm',  '12.1.2020 11:59:00 pm', 3, 'Group_project', 70, 4);

--Edit
  UPDATE Task
  SET Group_NO=null , Open_date= '14.8.2020 01:30:00 pm'
  WHERE Task_ID = 01;
  UPDATE Task
  SET Deadline='11.1.2021 11:59:00 pm'
  WHERE Task_ID=03;
  UPDATE Task
  SET Group_NO=null
  WHERE Task_ID = 04 OR Task_ID = 06 OR Task_ID = 07 OR Task_ID = 08 OR Task_ID = 09;
  UPDATE Task
  SET Deadline='17.11.2021 01:00:00 pm'
  WHERE Task_ID=05;
  UPDATE Task
  SET Open_date='10.11.2021 01:00:00 pm'
  WHERE Task_ID=05;
  UPDATE Task
  SET Mod_ID= 136 
  WHERE Task_ID = 1;

   UPDATE Task
  SET Mod_ID= 267 
  WHERE Task_ID = 11;

   UPDATE Task
  SET Mod_ID= 345
  WHERE Task_ID = 08;

   UPDATE Task
  SET Mod_ID= 534
  WHERE Task_ID = 02;

   UPDATE Task
  SET Mod_ID= 634
  WHERE Task_ID = 03;

   UPDATE Task
  SET Mod_ID= 745
  WHERE Task_ID = 05;

   UPDATE Task
  SET Mod_ID= 348
  WHERE Task_ID = 07;

-- *****************************************************************************************************
-- Submission of each task 
Create Table Submission (
Task_ID INT, 
Stud_ID INT,
Sub_ID INT unique,
Score INT, 
Comment Text, 

Constraint Submit_pk primary key (Task_ID, Stud_ID),
Constraint submit_ID_UN Unique (Sub_ID)
);

-- If ever a module was deleted, Submission shold remain 
Alter table Submission
Add constraint Submit_Task_fk foreign key (Task_ID) References Task(Task_ID)
ON DELETE NO ACTION 
ON UPDATE CASCADE;

-- However, if the student who submit the task is deleted from the system, There is no point of the submission 
Alter table Submission
Add constraint Submit_stud_fk foreign key (Stud_ID) References Student(Stud_ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Inserting ...

 Insert Into Submission (Task_ID, Stud_ID, Sub_ID, Score, Comment)
 Values 
 (02, 225328, 01, 25, 'there is a mistake, It will be Regraded'),
 (04, 203434, 02, 11, 'Meet your TA'),
 (01, 213434, 03, 10, Null),
 (09, 223432, 04, 30, Null),
 (01, 225328, 05, 9, 'Technical isssue submission daily'),
 (06, 226444, 06, 16, 'there is a mistake, It will be Regraded'),
 (01, 227824, 07, 15, 'Technical isssue submission daily'),
 (10, 226444, 08, 55, 'Your Submission is late'),
 (03, 225328, 09, 35, 'Meet your TA'),
 (01, 203434, 10, 7, Null);

--Edit

 UPDATE Submission
 SET Comment = Null
 WHERE Task_ID = 03;
 UPDATE Submission
 SET Score = Null
 WHERE Task_ID = 10;
 UPDATE Submission
 SET Score = Null
 WHERE Task_ID = 02 OR Task_ID = 06;


-- *****************************************************************************************************

-- Submission files (Malti-Valued attribute)
-- Each  submission may have a number of files
Create TABLE Sub_File (
File_ID INT primary key,
name varchar(70) not null,
size Float,
Submit_date Datetime not null,
Sub_ID Int

constraint Sub_file_FK foreign key (Sub_ID) References Submission(Sub_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

Insert Into Sub_File (File_ID, name, size, Submit_date, Sub_ID)
Values
(01, 'Elctronics Proposal', 12.2, '12.12.2020 01:00:00 pm', 01),
(02, 'DataBase_Phase_1', 10.5, '12.7.2020 12:00:00 pm', 02),
(03, 'HCI_Phase_1', 13.2, '12.2.2020 01:00:00 pm', 03),
(04, 'Elcotronics_Report', 15.5, '1.2.2020 12:00:00 pm', 04),
(05, 'TR_Report', 20.5, '12.12.2020 02:00:00 pm', 05),
(06, 'OOP_Assignment', 10.5, '12.1.2021 12:00:00 pm', 06),
(07, 'TR_Essay', 12.0, '12.1.2020 01:00:00 pm', 07),
(08, 'DataBase_Phase_2', 17.2, '12.1.2021 12:00:00 pm', 08),
(09, 'Java_GUI_Phase_1', 14.0, '12.10.2020 01:00:00 pm', 09),
(10, 'DataStructure_Assignmet', 10.0, '12.2.2020 01:00:00 am', 10);

-- *****************************************************************************************************

-- Claims Table 
Create table Claims(

ID INT primary Key,
C_subject varchar(100),
C_content Text,
Stud_ID INT,
Stuff_ID INT,
Mod_ID INt
);

ALTER TABLE Claims
Add Constraint Claim_Stud_fk foreign key (Stud_ID) References Student(Stud_ID)
ON UPDATE CASCADE
ON DELETE SET Null;

ALTER TABLE Claims
Add Constraint Claim_Mod_fk foreign key (Mod_ID) References Module(Mod_ID)
ON UPDATE CASCADE
ON DELETE SET Null;

ALTER TABLE Claims
Add Constraint Claim_Stuff_fk foreign key (Stuff_ID) References Stuff(Stuff_ID)
ON UPDATE NO ACTION
ON DELETE NO ACTION;


INSERT INTO Claims (ID, C_subject, C_content, Stud_ID, Mod_ID, Stuff_ID)
values (1, 'Daily uploading lectures', 'It takes too long to get the lecture', 225328, 136, 190);

INSERT INTO Claims (ID, C_subject, C_content, Stud_ID, Mod_ID, Stuff_ID)
values (2, 'Daily uploading lectures', 'It takes too long to get the lecture', 213434, 190, 203434);

INSERT INTO Claims (ID, C_subject, C_content, Stud_ID, Mod_ID, Stuff_ID)
values (3, 'Daily uploading lectures', 'It takes too long to get the lecture', 226444, 267, 234345);

INSERT INTO Claims (ID, C_subject, C_content, Stud_ID, Mod_ID, Stuff_ID)
values (4, 'Daily uploading lectures', 'It takes too long to get the lecture', 227824, 345, 224455);

INSERT INTO Claims (ID, C_subject, C_content, Stud_ID, Mod_ID, Stuff_ID)
values (5, 'Daily uploading lectures', 'It takes too long to get the lecture', 225328, 267, 234345);

INSERT INTO Claims (ID, C_subject, C_content, Stud_ID, Mod_ID, Stuff_ID)
values (6, 'Daily uploading lectures', 'It takes too long to get the lecture', 223432, 345, 178);

INSERT INTO Claims (ID, C_subject, C_content, Stud_ID, Mod_ID, Stuff_ID)
values (7, 'Daily uploading lectures', 'It takes too long to get the lecture', 203434, 348, 190);

INSERT INTO Claims (ID, C_subject, C_content, Stud_ID, Mod_ID, Stuff_ID)
values (8, 'Daily uploading lectures', 'It takes too long to get the lecture', 203434, 454, 224455);

-- *****************************************************************************************************

CREATE TABLE Announcement (
ID INT, 
Ann_Subject varchar(100),
Ann_Desc Text,
Department varchar(100),
Mod_ID INT,
Stuff_ID INT

Constraint Ann_pk primary key (ID) 
);

Alter Table Announcement
Add Ann_date Datetime Default GetDate();

Alter table Announcement
Add constraint Ann_fk foreign key(Mod_ID) References Module(Mod_ID)
On Delete No Action 
On update cascade;

Alter table Announcement
Add constraint Ann_fk_stuff foreign key(Stuff_ID) References Stuff(Stuff_ID)
On Delete Set null
On update cascade;


Insert Into Announcement(ID, Ann_Subject, Ann_Desc, Department, Mod_ID, Stuff_ID) 
VAlues (1, 'Dedline', 'Dear student,\n note that the final submission was postponded to week 12', 'ICS', 267, 190);

Insert Into Announcement(ID, Ann_Subject, Ann_Desc, Department, Mod_ID, Stuff_ID) 
VAlues (2, 'Dedline', 'Dear student,\n note that the final submission was postponded to week 12', 'ICS', 345, 203434);

Insert Into Announcement(ID, Ann_Subject, Ann_Desc, Department, Mod_ID, Stuff_ID) 
VAlues (3, 'Dedline', 'Dear student,\n note that the final submission was postponded to week 12', 'ICS', 136, 234345);

Insert Into Announcement(ID, Ann_Subject, Ann_Desc, Department, Mod_ID, Stuff_ID) 
VAlues (4, 'Dedline', 'Dear student,\n note that the final submission was postponded to week 12', 'ICS', 190, 224455);

Insert Into Announcement(ID, Ann_Subject, Ann_Desc, Department, Mod_ID, Stuff_ID) 
VAlues (5, 'Dedline', 'Dear student,\n note that the final submission was postponded to week 12', 'ICS', 267, 190);

Insert Into Announcement(ID, Ann_Subject, Ann_Desc, Department, Mod_ID, Stuff_ID) 
VAlues (6, 'Dedline', 'Dear student,\n note that the final submission was postponded to week 12', 'ICS', 345, 134);

Insert Into Announcement(ID, Ann_Subject, Ann_Desc, Department, Mod_ID, Stuff_ID) 
VAlues (7, 'Dedline', 'Dear student,\n note that the final submission was postponded to week 12', 'ICS', 454, 224455);

Insert Into Announcement(ID, Ann_Subject, Ann_Desc, Department, Mod_ID, Stuff_ID) 
VAlues (8, 'Dedline', 'Dear student,\n note that the final submission was postponded to week 12', 'ICS', 534, 189);

-- ***************************************************************************************************************************

Create Table Announc_Files (
File_ID INT primary key,
Name varchar(50) Not null,
Upload_date Datetime Not null default getDate(),
Size float,
Ann_ID INT

Constraint AnnFile_fk Foreign key (Ann_ID) references Announcement(ID)
ON DELETE CASCADE
ON UPDATE CASCADE
);


INSERT Into Announc_Files(File_ID, Name, Upload_date, Size, Ann_ID)
Values (1,'Project Discussion time table', 09/12/2022, 10,1)

INSERT Into Announc_Files(File_ID, Name, Upload_date, Size, Ann_ID)
Values (2,'OOP Grades', 09/12/2022, 15,2)

INSERT Into Announc_Files(File_ID, Name, Upload_date, Size, Ann_ID)
Values (3,'Class Test Grades', 09/12/2022, 15,3)

INSERT Into Announc_Files(File_ID, Name, Upload_date, Size, Ann_ID)
Values (4,'Database feedback', 09/12/2022, 20,4)

INSERT Into Announc_Files(File_ID, Name, Upload_date, Size, Ann_ID)
Values (5,'Assignment 2 Domains', 09/12/2022, 25,5)

INSERT Into Announc_Files(File_ID, Name, Upload_date, Size, Ann_ID)
Values (6,'Assignment 1 Grades', 10/12/2022, 25,6)

INSERT Into Announc_Files(File_ID, Name, Upload_date, Size, Ann_ID)
Values (7,'Weekly Plan', 10/12/2022, 26,7)

INSERT Into Announc_Files(File_ID, Name, Upload_date, Size, Ann_ID)
Values (8,'Project Group Members', 10/12/2022, 22,8)




-- ***************************************************************************************************************************


Create Table Mod_Evaluation (
ID INT primary key,
Mod_rate TinyINT,
Prof_rate TinyINT,
TA_rate TinyINT,
Eva_date date not null default getDAte(),
Comment Text,
Stud_ID INT,
Mod_ID INT,
Prof_ID INT,
TA_ID INT
);

-- The evaluation is considered as an independent table 
-- So, It remains the same by deleting any of its Foreign keys except when updating the student ID or Module ID

Alter table Mod_Evaluation
Add constraint Eva_Stud Foreign key (Stud_ID) References Student(Stud_ID)
ON DELETE SET NULL
ON UPDATE CASCADE;

Alter table Mod_Evaluation
Add constraint Eva_mod Foreign key (Mod_ID) References Module(Mod_ID)
ON DELETE SET NULL
ON UPDATE CASCADE;

Alter table Mod_Evaluation
Add constraint Eva_prof Foreign key (Prof_ID) References Stuff(Stuff_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

Alter table Mod_Evaluation
Add constraint Eva_TA Foreign key (TA_ID) References Stuff(Stuff_ID)
ON DELETE  NO ACTION
ON UPDATE  NO ACTION;



INSERT Into Mod_Evaluation(ID, Mod_rate, Prof_rate, TA_rate, Comment, Stud_ID, Mod_ID, Prof_ID, TA_ID)
Values (2, 9, 5, 7,'TA was not helpful with giving requirements of submission nor what is needed to Ace the project and I had to reach prof everytime for their guidance.', 213434, 190, 224455, 203434)

INSERT Into Mod_Evaluation(ID, Mod_rate, Prof_rate, TA_rate, Comment, Stud_ID, Mod_ID, Prof_ID, TA_ID)
Values (3, 10, 10, 10,'I was very satisfied with TAs and professors guidance with the module', 234284, 136, 224455, 234345)

INSERT Into Mod_Evaluation(ID, Mod_rate, Prof_rate, TA_rate, Comment, Stud_ID, Mod_ID, Prof_ID, TA_ID)
Values (4, 8, 8, 8,'TA and Prof were helpful with me during the entire semester.', 227824, 454, 224455, 234345)

INSERT Into Mod_Evaluation(ID, Mod_rate, Prof_rate, TA_rate, Comment, Stud_ID, Mod_ID, Prof_ID, TA_ID)
Values (5, 10, 9, 10,'I was very satisfied with TAs and professors guidance with the module', 203422, 534, 224455, 190)

INSERT Into Mod_Evaluation(ID, Mod_rate, Prof_rate, TA_rate, Comment, Stud_ID, Mod_ID, Prof_ID, TA_ID)
Values (6, 7, 7, 7,'Instructions on final project were not clear but I was satisfied with theoratical part of the module.', 203422, 534, 224455, 203434)

INSERT Into Mod_Evaluation(ID, Mod_rate, Prof_rate, TA_rate, Comment, Stud_ID, Mod_ID, Prof_ID, TA_ID)
Values (7, 10, 9, 10,'I was very satisfied with TAs and professors guidance with the module', 203422, 534, 224455, 203434)

INSERT Into Mod_Evaluation(ID, Mod_rate, Prof_rate, TA_rate, Comment, Stud_ID, Mod_ID, Prof_ID, TA_ID)
Values (8, 10, 9, 10,'I was very satisfied with TAs and professors guidance with the module', 203422, 534, 224455, 234345)

INSERT Into Mod_Evaluation(ID, Mod_rate, Prof_rate, TA_rate, Comment, Stud_ID, Mod_ID, Prof_ID, TA_ID)
Values (9, 10, 9, 10,'I was very satisfied with TAs and professors guidance with the module', 203422, 534, 224455, 234345)

INSERT Into Mod_Evaluation(ID, Mod_rate, Prof_rate, TA_rate, Comment, Stud_ID, Mod_ID, Prof_ID, TA_ID)
Values (10, 10, 9, 10,'I was very satisfied with TAs and professors guidance with the module', 203422, 534, 224455, 234345)

-- ***************************************************************************************************************************

Create Table Summer_Prog (
ID INT,
Title varchar(70),
Days_NO INT,
Available_NO INT, 
Teacher INT,
Form_Link varchar(150)

Constraint Sum_pk primary key (ID),
Constraint Sum_teach foreign key (Teacher) References Stuff(Stuff_ID)
ON DELETE SET NULL
ON UPDATE CASCADE
);

iNSERT INTO Summer_Prog(ID, Title, Days_NO, Available_NO, Teacher, Form_Link)
Values(1, 'English course', 90, 30, 145, 'www.googlefom/enform/2312.com');


iNSERT INTO Summer_Prog(ID, Title, Days_NO, Available_NO, Teacher, Form_Link)
Values(2, 'Math course', 90, 30, 190, 'www.googlefom/enform/2442.com');

iNSERT INTO Summer_Prog(ID, Title, Days_NO, Available_NO, Teacher, Form_Link)
Values(3, 'Programming course', 30, 100, 190, 'www.googlefom/enform/2512.com');

iNSERT INTO Summer_Prog(ID, Title, Days_NO, Available_NO, Teacher, Form_Link)
Values(4, 'Cyber security course', 60, 100, 190, 'www.googlefom/enform/2612.com');

iNSERT INTO Summer_Prog(ID, Title, Days_NO, Available_NO, Teacher, Form_Link)
Values(5, 'Web Development course', 30, 50, 190, 'www.googlefom/enform/2712.com');

iNSERT INTO Summer_Prog(ID, Title, Days_NO, Available_NO, Teacher, Form_Link)
Values(6, 'Ethical Hacking course', 30, 100, 190, 'www.googlefom/enform/2812.com');

iNSERT INTO Summer_Prog(ID, Title, Days_NO, Available_NO, Teacher, Form_Link)
Values(7, 'Motion Graphics course', 30, 100, 190, 'www.googlefom/enform/2912.com');



-- ***************************************************************************************************************************

Create table Sum_Enroll (
Stud_ID INT,
Sum_ID INT, 
Progress INT Default 0,
Certificate_src varchar(50),
Enroll_date Date not null default getDate()

constraint sum_enrl_pk Primary key (Stud_ID, Sum_ID) 
);

Alter Table Sum_Enroll
Add Constraint Sum_Stud Foreign Key (Stud_ID)
References Student(Stud_ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

Alter Table Sum_Enroll
Add Constraint Sum_prog Foreign Key (Sum_ID)
References Summer_Prog(ID);


INSERT INTO Sum_Enroll(Stud_ID,Sum_ID, Progress,Certificate_src)
Values (203422,1, 25, 'mediaC/1.jpg')

INSERT INTO Sum_Enroll(Stud_ID,Sum_ID, Progress,Certificate_src)
Values (203434,2, 50, 'mediaC/2.jpg')

INSERT INTO Sum_Enroll(Stud_ID,Sum_ID, Progress,Certificate_src)
Values (213434,3, 70, 'mediaC/3.jpg')

INSERT INTO Sum_Enroll(Stud_ID,Sum_ID, Progress,Certificate_src)
Values (223432,4, 60, 'mediaC/4.jpg')

INSERT INTO Sum_Enroll(Stud_ID,Sum_ID, Progress,Certificate_src)
Values (225328,5, 55, 'mediaC/5.jpg')

INSERT INTO Sum_Enroll(Stud_ID,Sum_ID, Progress,Certificate_src)
Values (226444,6, 20, 'mediaC/6.jpg')

INSERT INTO Sum_Enroll(Stud_ID,Sum_ID, Progress,Certificate_src)
Values (227824,7, 30, 'mediaC/7.jpg')



-- ***************************************************************************************************************************

Create Table Student_Hub (
ID INT,
Title varchar(70) NOT NULL,
Prog_link varchar(150),
Img_src varchar(150),
Instructor_ID INT

Constraint StudHub_pk primary key (ID),
Constraint StudHub_fk foreign key (Instructor_ID) References Stuff(Stuff_ID)
ON DELETE SET NULL
ON UPDATE CASCADE
);


INSERT INTO Student_Hub(ID,Title,Prog_link,Img_src,Instructor_ID)
VALUES (1,'English Program','www.EnglishCourse.com','media/1.jpg',224455)

INSERT INTO Student_Hub(ID,Title,Prog_link,Img_src,Instructor_ID)
VALUES (2,'Math Course','www.MathCourse.com','media/2.jpg',234345)

INSERT INTO Student_Hub(ID,Title,Prog_link,Img_src,Instructor_ID)
VALUES (3,'Programming Course','www.MathCourse.com','media/2.jpg',234345)

iNSERT INTO Student_Hub(ID, Title, Prog_link, Img_src, Instructor_ID)
Values(4, 'Cyber security course','www.CyberSecurityCourse.com','media/2.jpg',234345);

iNSERT INTO Student_Hub(ID,Title,Prog_link,Img_src,Instructor_ID)
Values(5, 'Web Development course','www.WebDevelopmentCourse.com','media/2.jpg',224455);

iNSERT INTO Student_Hub(ID,Title,Prog_link,Img_src,Instructor_ID)
Values(6, 'Ethical Hacking course','www.EthicalHackingCourse.com','media/2.jpg',203434);

iNSERT INTO Student_Hub(ID,Title,Prog_link,Img_src,Instructor_ID)
Values(7, 'Motion Graphics course','www.MotionGraphicsCourse.com','media/2.jpg',190);

iNSERT INTO Student_Hub(ID,Title,Prog_link,Img_src,Instructor_ID)
Values(8, 'Maya 3D course','www.Maya3DCourse.com','media/2.jpg',178);
-- ***************************************************************************************************************************


Create Table StudHub_Enroll (
Stud_ID INT,
Hub_ID INT,
Enroll_date DATE NOT NULL DEFAULT GETDATE(),
Is_online BIT


Constraint SH_pk primary key (Stud_ID, Hub_ID)
);

Alter Table StudHub_Enroll
Add Constraint Hub_Stud foreign key (Stud_ID) References Student(Stud_ID)
On delete cascade
On update cascade;


Alter Table StudHub_Enroll
Add Constraint Hub_prog foreign key (Hub_ID) References Student_Hub(ID);


INSERT INTO StudHub_Enroll(Stud_ID,Hub_ID,Is_online)
VALUES (223432,4,0)

INSERT INTO StudHub_Enroll(Stud_ID,Hub_ID,Is_online)
VALUES (225328,5,0)

INSERT INTO StudHub_Enroll(Stud_ID,Hub_ID,Is_online)
VALUES (226444,6,1)

INSERT INTO StudHub_Enroll(Stud_ID,Hub_ID,Is_online)
VALUES (227824,7,0)

INSERT INTO StudHub_Enroll(Stud_ID,Hub_ID,Is_online)
VALUES (234284,8,0)

INSERT INTO StudHub_Enroll(Stud_ID,Hub_ID,Is_online)
VALUES (234284,4,0)

INSERT INTO StudHub_Enroll(Stud_ID,Hub_ID,Is_online)
VALUES (234284,5,0)




-- ***************************************************************************************************************************
-- ***************************************************************************************************************************
-- ***************************************************************************************************************************
-- ***************************************************************************************************************************
-- ***************************************************************************************************************************
-- ***************************************************************************************************************************
-- ***************************************************************************************************************************
-- ***************************************************************************************************************************
-- ***************************************************************************************************************************
-- ***************************************************************************************************************************
-- ***************************************************************************************************************************





 --     ((((((       Views       )))))))



 -- Abdelrhma's Module
 Create View Abdelrhaman_Modules As
 Select Mod_name, Progress
 From Module m join 
		(Select * From Study 
				Where Stud_ID = (Select Stud_ID From Student join Users 
										on User_ID = Stud_ID and Fname = 'Abdelrhman')) s
		On m.Mod_ID = s.Mod_ID;


-- Professors Info
Create View Stuff_Detaild_Info As
Select * From 
(Select us.User_ID, Fname, Lname, Fname + us.User_ID As 'Username' , Pass,  City, Region
From Users us left Join User_Address ad On us.User_ID = ad.User_ID) users
Join
Stuff s
On users.User_ID = s.Stuff_ID;


-- Student info
Create View Student_Info As
Select * From 
Student join Users
On Stud_ID = User_ID;


-- Stuff info
Create View Stuff_Info As
Select * From 
Stuff join Users
On Stuff_ID = User_ID;



-- Rolse of professions
Create View  Stuff_Roll AS
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


-- users who are Student
Create View Stud_Users As
Select * from Users 
Where User_ID in (Select Stud_ID From Student);


-- users who are Professors
Create View prof_Users As
Select * from Users 
Where User_ID in (Select Stuff_ID From Stuff where LOWER(profession) = 'professor');

-- users who are TAs
Create View TA_Users As
Select * from Users 
Where User_ID in (Select Stuff_ID From Stuff where LOWER(profession) = 'TA');

-- Users who are stuff and student
Create View TA_Stud_Users As
Select *
From Users Join 
		(Select * From Stuff s where profession = 'TA') s
		on User_ID = s.stuff_ID
		join Student
		on s.Stuff_ID = Stud_ID;


-- Stuff with full control (Admin)
Create View Admin_User As
Select s.Stuff_ID, s.profession, r.Role_name, r.Add_user, r.Edit_user, r.Delete_crs, r.Insert_crs, r.Update_crs  From Stuff s join User_Role r
On s.Role_ID = r.Role_ID;



Create table User_Audit (
User_ID INT,
Fname varchar(50) not null,
Lname varchar(50),
Pass varchar(50) not null,
Img_src varchar(300),
Mail varchar(100) not null,
Dept_name varchar(100)

);




-- Table of Dleteted student Archive

Create table User_Audit (
User_ID INT,
Fname varchar(50) not null,
Lname varchar(50),
Pass varchar(50) not null,
Img_src varchar(300),
Mail varchar(100) not null,
Dept_name varchar(100)

);


 --     ((((((       Triggers       )))))))

 CREATE TRIGGER User_Delete_Trigger On Users
 After DELETE
 AS
 
	declare  @User_ID INT
	declare  @Fname varchar(50)
	declare  @Lname varchar(50)
	declare  @Pass varchar(50)
	declare  @Img_src varchar(300)
	declare  @Mail varchar(100)
	declare  @Dept_name varchar(100)



	Select @User_ID = d.User_ID From deleted d
	Select @Fname = d.Fname From deleted d
	Select @Lname = d.Lname From deleted d
	Select @Pass = d.Pass From deleted d
	Select @Img_src = d.Img_src From deleted d
	Select @Mail = d.Mail From deleted d
	Select @Dept_name = d.Dept_name From deleted d


	Insert Into User_Audit
	Values(@User_ID, @Fname, @Lname, @Pass, @Img_src, @Mail, @Dept_name)
	Print 'User deleted trigger done successfully'
GO