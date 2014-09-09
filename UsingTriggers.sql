
drop table my_employee;
drop table salary_history;
create table my_employee(
ssn int not null,
fname varchar2(20) not null,
lname varchar2(20) not null,
salary number(10) not null,
primary key(ssn)
);

create table salary_history(
ssn int not null,
salary number(10) not null,
assign_date date
);

create trigger salary_history_trigger1
before insert on my_employee
for each row
Begin 
insert into salary_history values(
:new.ssn,
:new.salary,
sysdate
);
End;
/

create trigger salary_history_trigger2
before update on my_employee
for each row
Begin
if(updating('salary'))
then
  insert into salary_history values(
    :old.ssn,
    :new.salary,
    sysdate
    );
end if;
End;
/

insert into my_employee(ssn,fname,lname,salary) values(1234567,'John','Smith',55000);
insert into my_employee(ssn,fname,lname,salary) values(3164757,'Jamieson','Price',72000);
insert into my_employee(ssn,fname,lname,salary) values(1346795,'Cary','Walgren',30000);
insert into my_employee(ssn,fname,lname,salary) values(4252349,'Steve','Smith',43000);
insert into my_employee(ssn,fname,lname,salary) values(7495027,'Roger','Blum',50000);

select * from my_employee;
update my_employee set salary = 45000 where fname = 'John' and lname = 'Smith';
update my_employee set salary = 29000 where fname = 'Cary' and lname = 'Walgren';
update my_employee set salary = 53000 where fname = 'Roger' and lname = 'Blum';
update my_employee set salary = 36000 where fname = 'Jamieson' and lname = 'Price';
update my_employee set salary = 45500 where fname = 'John' and lname = 'Smith';
update my_employee set salary = 51000 where fname = 'Steve' and lname = 'Smith';
select * from salary_history order by ssn;
