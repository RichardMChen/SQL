@C:\database\employee_db.sql
set wrap off

--Display the Fname and Lname of all employees along with the name of the department they belongs to
select fname, lname, dname from employee, department
where employee.dno = department.dnumber;

--Display the Fname and Lname of all employees of the Research department
select fname, lname from employee
where employee.dno = 5;

--Display the Fname and Lname of the manager of the Research department
select fname, lname from employee
where ssn in ( select mgrssn from department
where department.dname = 'Research' );

--What is the Fname and Lname of the supervisor of John Smith?
select fname, lname from employee
where ssn in (select superssn from employee
where employee.fname = 'John' and employee.lname = 'Smith');