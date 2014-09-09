@C:\database\sailors.sql

--List name and age of sailors who have reserved boat 104.
select sname, age from sailors, boats, reserves
where sailors.sid = reserves.sid and reserves.bid = 104 and
boats.bid = 104;

--List sailor name, boat name, and reservation day for each reservation.
select sname, bname, day from sailors, boats, reserves
where sailors.sid = reserves.sid and reserves.bid = boats.bid;

--List name and age of the youngest (hint: Use a nested query).
select sname, age from sailors
where age in ( select min(age) from sailors);

--List name of sailors who have reserved a red boat but 
--not a green boat (Hint: Use the minus operator to combine two queries).
select sname from sailors, boats, reserves
where sailors.sid = reserves.sid and boats.bid = reserves.bid
and color = 'red'
minus
select sname from sailors, boats, reserves
where sailors.sid = reserves.sid and boats.bid = reserves.bid
and color = 'green';