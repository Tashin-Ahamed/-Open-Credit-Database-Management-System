crate table t(
 id int not null PRIMARY key,
 name varchar(100) not null
);
crate table t2(
 id int not null PRIMARY key,
 idf int not null,
 FOREIGN key (idf) REFERENCES t(id) 
);
crate table t3(
 id int not null;
 idf int not null;
 PRIMARY key(id,idf);
 FOREIGN key (idf) REFERENCES t2(id);
 FOREIGN key id REFERENCES t(id)

);
insert into(id,name) values(1,'tashin');
sysdate;
systimestamp;

create or REPLACE TRIGGER tr
BEFORE insert or update on t3
for each row
DECLARE
c number(8,2):=5.6;

d number(4,2):=6.9;
BEGIN
if:new.salary>d or :new.salary<c THEN

RAISE_APPLICATION_ERROR(-20000,'new is too samall'||c);
end if;
if:new.salary<15000 and :new.salary>10000 THEN
new.grade:=5;
RAISE_APPLICATION_ERROR(-20000,'new is too samall');
end if;

end;
/

BEGIN
dbms_output.put_line('new is too samall'||c);
end;
/
insert into t2(id,name) values(1,null);
set serveroutput on

declare
cursor b is  select id,name from t2;
c b%rowtype;
begin
open b;
loop
fatch b into c;
exit when b%rowcount>3;
EXIT WHEN b%NOTFOUND;
dbms_output.put_line(c.name);
end llop;
close b;
end;
/
--get specified info upto a certain range in students table
set SERVEROUTPUT on
declare 
	cursor stud is select s_id, s_name, s_dept from students;
	student stud%rowtype;

begin
open stud;
	loop 
		fetch stud into student;
		exit when stud%rowcount >5;
        
		dbms_output.put_line('Student with id: '|| student.s_id || ' whose name is: '|| student.s_name || ' is from department: '|| student.s_dept);
	end loop;
close stud;		
end;
/
--list of all students with details using procedure-- 
set SERVEROUTPUT on
create or replace procedure showStudentDetails is
	cursor stud is select s_id, s_name, s_dept from students;
	student stud%rowtype;
	totrow integer;

begin
select count(*) into totrow from students;
open stud;
	loop 
		fetch stud into student;
		dbms_output.put_line('Student with id: "'|| student.s_id || '" whose name is: "'|| student.s_name || '" is from department: "'|| student.s_dept||'"');
		exit when stud%rowcount>=totrow;
	end loop;
close stud;		
end;
/
show errors;

begin
	showStudentDetails;
end;
/
create or replace procedure p is
cursor c is select id,name from t2;
b c%rowtype;
begin 
open b;
loop
fatch b into c;
exit when b%NOTFOUND;
end loop;
close b;
end;
/


--Find the department of students who are joining meeting id by procedure
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE find_student_dept( meet_id meeting.meetingId%TYPE) IS

    CURSOR participant_cur IS SELECT studentRoll, meetingId FROM meetingParticipant;
    participant_record participant_cur%ROWTYPE;
    student_roll student.studentRoll%TYPE;
    dept_code student.deptCode%TYPE;
    rowcount integer;
BEGIN
    select count(*) INTO rowcount from meetingParticipant;
OPEN participant_cur;
    
    LOOP
        FETCH participant_cur INTO participant_record;
        IF participant_record.meetingId = meet_id THEN
            student_roll := participant_record.studentRoll;
            SELECT deptCode INTO dept_code FROM student WHERE studentRoll = student_roll;
            DBMS_OUTPUT.PUT_LINE('Students Department Code : ' || dept_code);
        END iF;
        EXIT WHEN participant_cur%ROWCOUNT >= rowcount;
    END LOOP;
CLOSE participant_cur;   
END find_student_dept;
/
SHOW ERRORS;

BEGIN
    find_student_dept('001');
END;
/



-- find number of teachers in meeting id by function
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION number_of_teacher( meet_id meeting.meetingId%TYPE) RETURN NUMBER IS
    ret NUMBER;
BEGIN
    SELECT count(teacherId) INTO ret FROM meetingHost WHERE meetingId = meet_id;
    RETURN RET;

END number_of_teacher;
/
SHOW ERRORS;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Number of teachers in meeting 001 is ' || number_of_teacher('001'));
END;
create or replace function f(a int,id in employees.salary%type ) return number is
begin
end;
/


create or replace function swassoa ( sid integer) return integer is 
begin 
	return sid+2;
end swassoa;
/
show errors;
declare 
x integer;
begin 

	x:=swassoa(1233);
	dbms_output.put_line(x);
end;
/

