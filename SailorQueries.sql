@C:\database\sailors.sql

/* List the age and name of sailors whose ages are larger than 30. */
select sname,age from sailors where age > 30;

/* List the age, rating, and name of sailors whose ages are larger than 30 and 
ratings are higher than 3. */
select age,rating,sname from sailors where age > 30 and rating > 3;

/* What is the average and standard deviations of rating of all sailors?
(Hint: Use avg(rating) and stddev(rating))) */
select avg(rating) from sailors;
select stddev(rating) from sailors;

/* What is the average and standard deviations of rating of sailors whose ages are above 30? */
select avg(rating) from sailors where age > 30;
select stddev(rating) from sailors where age > 30;

/* What is the age of the sailor named ‘Dustin’? */
select age from sailors where sname like 'Dustin';

/* List the names of all sailors whose names started by "H". */
select sname from sailors where sname like 'H%';

/* How many sailors are there for each rating */
select count(*), rating from sailors group by rating;