set serveroutput on;

drop TABLE Lecturer_Works_For_Department;
drop TABLE Lecturer_Contact_number;
drop TABLE Student_Contact_number;
drop TABLE Lecturer_Teaches_Subject;
drop TABLE Program_Has_Subject;
drop TABLE Student;
drop TABLE Program;
drop TABLE Department;
drop TABLE Lecturer;
drop TABLE Subject;







CREATE TABLE Department
 (
    Department_Id   int NOT NULL PRIMARY KEY,
    Department_name VARCHAR(100) NOT NULL,
    HOD             VARCHAR(100) NOT NULL
 );
 CREATE TABLE Program
 (
    Program_Id          int NOT NULL PRIMARY KEY,
    Program_name        VARCHAR(100) NOT NULL,
    No_of_years         int NOT NULL,
    Total_fees          DECIMAL(10, 2) NOT NULL,
    Program_coordinator VARCHAR(100) NOT NULL,
    Department_Id       int NOT NULL,
    FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id)
 );
CREATE TABLE Lecturer
 (
    Lecturer_Id   int NOT NULL PRIMARY KEY,
    First_name    VARCHAR(100) NOT NULL,
    Last_name     VARCHAR(100) NOT NULL,
    Gender        VARCHAR(15) NOT NULL,
    Email_address VARCHAR(320) NOT NULL,
    DOB           DATE NOT NULL,
    Designation   VARCHAR(100) NOT NULL,
    Country       VARCHAR(100) NOT NULL,
    City          VARCHAR(100) NOT NULL,
    Street        VARCHAR(100) NOT NULL,
    Ward_no       int NOT NULL
 );
CREATE TABLE Lecturer_Works_For_Department
 (
    Lecturer_Id   int NOT NULL,
    Department_Id int NOT NULL,
    PRIMARY KEY (Lecturer_Id, Department_Id),
    FOREIGN KEY (Lecturer_Id) REFERENCES Lecturer(Lecturer_Id),
    FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id)
 );
  
CREATE TABLE Lecturer_Contact_number
 (
    Lecturer_Id    int NOT NULL,
    Contact_number VARCHAR(15) NOT NULL,
    PRIMARY KEY (Lecturer_Id, Contact_number),
    FOREIGN KEY (Lecturer_Id) REFERENCES Lecturer(Lecturer_Id)
 );
CREATE TABLE Student
 (
    Student_Id    int NOT NULL PRIMARY KEY,
    Roll_no       int NOT NULL,
    First_name    VARCHAR(100) NOT NULL,
    Last_name     VARCHAR(100) NOT NULL,
    Gender        VARCHAR(15) NOT NULL,
    Email_address VARCHAR(320) NOT NULL,
    Country       VARCHAR(100) NOT NULL,
    Program_Id    int NOT NULL,
    FOREIGN KEY (Program_Id) REFERENCES Program(Program_Id)
 );

 CREATE TABLE Student_Contact_number
 (
    Student_Id     int NOT NULL,
    Contact_number VARCHAR(15) NOT NULL,
    PRIMARY KEY (Student_Id, Contact_number),
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_Id)
 );
 CREATE TABLE Subject
 (
    Subject_Id    int NOT NULL PRIMARY KEY,
    Subject_Code  VARCHAR(100) NOT NULL,
    Credit_hours  int NOT NULL,
    Total_Preiods int NOT NULL
 );
CREATE TABLE Lecturer_Teaches_Subject
  (
     Lecturer_Id int NOT NULL,Subject_Id int NOT NULL,
     PRIMARY KEY (Lecturer_Id, Subject_Id),
     FOREIGN KEY (Lecturer_Id) REFERENCES Lecturer(Lecturer_Id),
     FOREIGN KEY (Subject_Id) REFERENCES Subject(Subject_Id)
  );
CREATE TABLE Program_Has_Subject
  (
     Program_Id int NOT NULL,Subject_Id int NOT NULL,
     PRIMARY KEY (Program_Id, Subject_Id),
     FOREIGN KEY (Program_Id) REFERENCES Program(Program_Id),
     FOREIGN KEY (Subject_Id) REFERENCES Subject(Subject_Id)
); 
INSERT INTO Department (Department_Id,Department_name,HOD) VALUES (1,'Science','Alexandra');
INSERT INTO Department (Department_Id,Department_name,HOD) VALUES (2,'Commerce','Elizabeth');
INSERT INTO Department (Department_Id,Department_name,HOD) VALUES (3,'Arts','Isaac');
SELECT * FROM Department;

INSERT INTO Program(Program_Id ,Program_name,No_of_years,Total_fees,Program_coordinator,Department_Id) VALUES (1,'BBM',4,400000,'Kimberly',2);
INSERT INTO Program(Program_Id ,Program_name,No_of_years,Total_fees,Program_coordinator,Department_Id) VALUES (2,'BBA',4,500000,'David',2); 
INSERT INTO Program(Program_Id ,Program_name,No_of_years,Total_fees,Program_coordinator,Department_Id) VALUES (3,'BSc General',4,250000,'Edward',1); 
INSERT INTO Program(Program_Id ,Program_name,No_of_years,Total_fees,Program_coordinator,Department_Id) VALUES (4,'BSc CSIT',4,450000,'Jack',1); 
INSERT INTO Program(Program_Id ,Program_name,No_of_years,Total_fees,Program_coordinator,Department_Id) VALUES (5,'MSc CSIT',2,200000,'Rachel',1);
INSERT INTO Program(Program_Id ,Program_name,No_of_years,Total_fees,Program_coordinator,Department_Id) VALUES (6,'BA English',3,100000,'Leonard',3); 
INSERT INTO Program(Program_Id ,Program_name,No_of_years,Total_fees,Program_coordinator,Department_Id) VALUES (7,'BA Fne Arts',4,400000,'Victoria',3);
   
SELECT * FROM Program;

INSERT INTO Lecturer(Lecturer_Id,First_name,Last_name,Gender,Email_address,DOB,Designation,Country,City,Street,Ward_no) VALUES (1,'John','Baker','Male','johnbaker@jmccol.com',TO_DATE('1984-01-24','YYYY/MM/DD'),'Assist. Lecturer','Bangladesh','Dhaka','KMC Road',8); 
INSERT INTO Lecturer(Lecturer_Id,First_name,Last_name,Gender,Email_address,DOB,Designation,Country,City,Street,Ward_no) VALUES (2,'William','Bond','Male','williambond@jmccol.com',TO_DATE('1980-02-14','YYYY/MM/DD'),'Professor','Bangladesh','Khulna','Main Road',5);  
INSERT INTO Lecturer(Lecturer_Id,First_name,Last_name,Gender,Email_address,DOB,Designation,Country,City,Street,Ward_no) VALUES (3,'Vanessa','Anderson','Female','vanessaanderson@jmccol.com',TO_DATE('1982-04-04','YYYY/MM/DD'),'Professor','Bangladesh','Kushtia','Ns road',2);
SELECT * FROM Lecturer;

INSERT INTO Lecturer_Works_For_Department(Lecturer_Id,Department_Id) VALUES (1,1);
INSERT INTO Lecturer_Works_For_Department(Lecturer_Id,Department_Id) VALUES(2,1);
INSERT INTO Lecturer_Works_For_Department(Lecturer_Id,Department_Id) VALUES(2,3);
INSERT INTO Lecturer_Works_For_Department(Lecturer_Id,Department_Id) VALUES (1,3);
INSERT INTO Lecturer_Works_For_Department(Lecturer_Id,Department_Id) VALUES (3,1);



SELECT * FROM Lecturer_Works_For_Department;



INSERT INTO Lecturer_Contact_number(Lecturer_Id,Contact_number)VALUES(1,'12345678');

INSERT INTO Lecturer_Contact_number(Lecturer_Id,Contact_number)VALUES(1,'42345678');

INSERT INTO Lecturer_Contact_number(Lecturer_Id,Contact_number)VALUES(2,'52345678');

INSERT INTO Lecturer_Contact_number(Lecturer_Id,Contact_number)VALUES(3,'14445678');

INSERT INTO Lecturer_Contact_number(Lecturer_Id,Contact_number)VALUES(3,'34567812');
select * FROM Lecturer_Contact_number;


INSERT INTO Student(Student_Id,Roll_no,First_name,Last_name,Gender,Email_address,Country,Program_Id)values(1,83,'tashin','ahamed','male','tashin@gmail.com','Bangladesh',1);
INSERT INTO Student(Student_Id,Roll_no,First_name,Last_name,Gender,Email_address,Country,Program_Id)values(2,84,'tom','shadow','male','tom@gmail.com','Usa',2);
INSERT INTO Student(Student_Id,Roll_no,First_name,Last_name,Gender,Email_address,Country,Program_Id)values(3,85,'hank','hh','male','hank@gmail.com','Uk',3);
INSERT INTO Student(Student_Id,Roll_no,First_name,Last_name,Gender,Email_address,Country,Program_Id)values(4,86,'abid','hossIN','male','abid@gmail.com','Bangladesh',4);
INSERT INTO Student(Student_Id,Roll_no,First_name,Last_name,Gender,Email_address,Country,Program_Id)values(5,87,'ashi','tanchangya','female','ashi@gmail.com','Bangladesh',5);
select * FROM Student;


 INSERT INTO Student_Contact_number(Student_Id, Contact_number)VALUES(1,'12345679');
 INSERT INTO Student_Contact_number(Student_Id, Contact_number)VALUES(2,'42345679');
 INSERT INTO Student_Contact_number(Student_Id, Contact_number)VALUES(3,'52345679');
 INSERT INTO Student_Contact_number(Student_Id, Contact_number)VALUES(4,'14445679');
 INSERT INTO Student_Contact_number(Student_Id, Contact_number)VALUES(5,'34567819');
select * FROM Student_Contact_number;

INSERT INTO Subject(Subject_Id,Subject_Code,Credit_hours,Total_Preiods) values(1,'cse 3100',3,12);
INSERT INTO Subject(Subject_Id,Subject_Code,Credit_hours,Total_Preiods) values(2,'eee 2100',3,12);
INSERT INTO Subject(Subject_Id,Subject_Code,Credit_hours,Total_Preiods) values(3,'me 4200',3,12);
INSERT INTO Subject(Subject_Id,Subject_Code,Credit_hours,Total_Preiods) values(4,'ece 4100',3,12);
INSERT INTO Subject(Subject_Id,Subject_Code,Credit_hours,Total_Preiods) values(5,'cse 1200',3,12);
select * FROM Subject;

INSERT INTO Lecturer_Teaches_Subject(Lecturer_Id, Subject_Id) VALUES (1,1);
INSERT INTO Lecturer_Teaches_Subject(Lecturer_Id, Subject_Id) VALUES (2,2);
INSERT INTO Lecturer_Teaches_Subject(Lecturer_Id, Subject_Id) VALUES (3,3);
INSERT INTO Lecturer_Teaches_Subject(Lecturer_Id, Subject_Id) VALUES (1,4);
INSERT INTO Lecturer_Teaches_Subject(Lecturer_Id, Subject_Id) VALUES (2,5);
select * from Lecturer_Teaches_Subject;



INSERT INTO Program_Has_Subject(Program_Id, Subject_Id) VALUES (1,1);
INSERT INTO Program_Has_Subject(Program_Id, Subject_Id) VALUES (2,2);
INSERT INTO Program_Has_Subject(Program_Id, Subject_Id) VALUES (3,3);
INSERT INTO Program_Has_Subject(Program_Id, Subject_Id) VALUES (4,4);
INSERT INTO Program_Has_Subject(Program_Id, Subject_Id) VALUES (5,5);
select * from Program_Has_Subject;


BEGIN
dbms_output.put_line('Search a keyword inside a string using like');
end;
/

select Subject_Code from Subject where Subject_Code like '%cse%';


BEGIN
dbms_output.put_line('Sorting a table using Order By');
end;
/

select Total_fees,No_of_years from Program order by Total_fees ,No_of_years desc;



BEGIN
dbms_output.put_line('Use of aggregate function');
end;
/

select max(Total_fees) from Program;
select min(Total_fees) from Program;
select avg(nvl(Total_fees,0)) from Program;
select sum(Total_fees) from Program;
select count(No_of_years) from Program where No_of_years=4;

BEGIN
dbms_output.put_line('Use of Group By and Having');
end;
/
select Lecturer_Id, count(Lecturer_Id) from Lecturer_Teaches_Subject group by Lecturer_Id having Lecturer_Id>1;





SET SERVEROUTPUT ON
DECLARE
   lid  Lecturer.Lecturer_Id%type;
   f  Lecturer.First_name%type;
   l  Lecturer.Last_name%type;
   sid Subject.Subject_Id%type;

   

BEGIN
   SELECT  Subject_Id INTO sid  
   FROM Subject 
   where Subject_Code='cse 3100';

   SELECT  Lecturer_Id INTO lid  
   FROM Lecturer_Teaches_Subject 
   where Subject_Id=sid;

   SELECT  First_name,Last_name INTO f,l  
   FROM Lecturer 
   where Lecturer_Id=lid;

   ;
   DBMS_OUTPUT.PUT_LINE( f||' '||l||'teaches cse 3100');
 END;



 SET SERVEROUTPUT ON 
 DECLARE

CURSOR s IS SELECT First_name,Last_name FROM Student where Gender='male';
st s%ROWTYPE;

BEGIN 
OPEN book_cur;
LOOP 
    FETCH s INTO st;
    DBMS_OUTPUT.PUT_LINE ('Student Name :' ||st.First_name||' '||st.Last_name);
END LOOP;
 CLOSE book_cur;

 
 
 
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE getemp IS
fee Program.Total_fees%type;
BEGIN 
SELECT max(Total_fees) INTO fee FROM Program;
DBMS_OUTPUT.PUT_LINE('Max Cost of a Program is : '||fee);
END;
/


BEGIN
getemp;
END;
/


CREATE OR REPLACE FUNCTION cost return number IS
fee Program.Total_fees%type;
BEGIN 
SELECT max(Total_fees) INTO fee FROM Program;
return fee;
END;
/


BEGIN
dbms_output.put_line('Minimum Cost of a Program is  ' || cost);
END;
/
CREATE OR REPLACE FUNCTION get_annual_comp(
     sal IN employees.salary%TYPE, comm IN employees.commission_pct%TYPE)
     RETURN NUMBER IS BEGIN

RETURN (NVL(sal,0) * 12 + (NVL(comm,0) * nvl(sal,0) * 12)); END get_annual_comp;





BEGIN
dbms_output.put_line('Use of nested query');
end;
/

select First_name,Last_name from  Lecturer where Lecturer_Id in (
    select Lecturer_Id from Lecturer_Teaches_Subject) order by First_name;



BEGIN
dbms_output.put_line('Finding third max transportationCost using nested query');
end;
/

select max(transportationCost) as thirdMaxTransportationCost from Expenditure where transportationCost < (
    select max(transportationCost) from Expenditure where transportationCost not in(
        select max(transportationCost) from Expenditure
        )
);


