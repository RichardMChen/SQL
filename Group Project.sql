
DROP TABLE customer_history;
DROP TABLE book_history;
DROP TABLE shoppingCart;
DROP TABLE orders;
DROP TABLE customer;
DROP TABLE book;
DROP TABLE author;
DROP TABLE publisher;
DROP TABLE keyword;

/*Creates a table for searchable keywords*/
CREATE TABLE keyword(
    KID            int,
    Text        varchar2(100),
primary key(KID));

/*Creates a table for the publishing information*/
CREATE TABLE publisher(
    PName        varchar2(40),
    PID            int,
    Pdate        int,
primary key(PID));

/*Creates an authors table that references their publishers*/
CREATE TABLE author(
    Fname        varchar2(40),
    Lname        varchar2(40),
    AID            int,
    PID            int,
primary key(AID),
foreign key(PID) REFERENCES publisher(PID));

/*Creates a table for all the books information*/
CREATE TABLE book(
    ISBN           varchar2(40),
    BName          varchar2(60),
    Price          int,
    Genre          varchar(50),
    KID            int,
    AID            int,
    PID            int,
	Quantity	       int,
primary key(ISBN),
foreign key(KID) REFERENCES keyword(KID),
foreign key(AID) REFERENCES author(AID),
foreign key(PID) REFERENCES publisher(PID));

/*Creates a table for general customer information*/
CREATE TABLE customer(
    Fname         varchar2(40),
    Lname         varchar2(40),
    CID            int,
    Street        varchar2(40),
    City          varchar2(40),
    Zip            int,
    States        varchar2(2),
    CPassword     varchar2(30),
    Email		      varchar2(40),
primary key(CID));

/*Creates a table to store order information*/
CREATE TABLE orders(
    orderID        int    not null,
    CID            int    not null,
    ODate          int   not null,
    ISBN           varchar(40),
primary key(orderID),
foreign key(CID) REFERENCES customer(CID));

CREATE TABLE shoppingCart(
	SCID			    int,
	orderID				int,
  ISBN          varchar(40),
  subtotal      int,
primary key(SCID),
foreign key(orderID) REFERENCES orders(orderID),
foreign key(ISBN) REFERENCES book(ISBN));

/*Table used by trigger for pricing updates on books*/
CREATE TABLE book_history(
    ISBN        int,
    Price        int,
    ChangeDate    date,
primary key(ISBN,Price,ChangeDate));

/*Table used in triggers for updating customer info or add new customer*/
CREATE TABLE customer_history(
    Fname        varchar2(20),
    Lname        varchar2(20),
    CID            int,
    Street        varchar2(20),
    City        varchar2(20),
    Zip            int,
    States        varchar2(2),
    Change        date,
	CPassword	  varchar2(30),
	Email		  varchar2(40),
primary key(CID,change));

/*This fills the publisher table*/
INSERT INTO publisher(PName,PID,Pdate)
VALUES('Chatto and Windus',1,1932);
INSERT INTO publisher(PName,PID,Pdate)
VALUES('St. Martins Press',2,1982);
INSERT INTO publisher(PName,PID,Pdate)
VALUES('George Allen and Unwin',3,1954);
INSERT INTO publisher(PName,PID,Pdate)
VALUES('Naval Institute Press',4,1984);
INSERT INTO publisher(PName,PID,Pdate)
VALUES('Scribner',5,2009);
INSERT INTO publisher(PName,PID,Pdate)
VALUES('Pan Books',6,1979);
INSERT INTO publisher(PName,PID,Pdate)
VALUES('Scribner',7,2013);

/*This fills the keyword table*/
INSERT INTO keyword(KID,Text)
VALUES(1,'Brave New World, Science Fiction, Aldous Huxley, 0-06-080983-3');
INSERT INTO keyword(KID,Text)
VALUES(2,'Battlefield Earth, Science Fiction, L. Ron Hubbard, 1-59212-007-5');
INSERT INTO keyword(KID,Text)
VALUES(3,'Lord of The Rings:Fellowship of The Rings, High Fantasy Adventure, J.R.R. Tolkien, 0-261-10235-4');
INSERT INTO keyword(KID,Text)
VALUES(4,'The Hunt For Red October, Tom Clancy, Novel, Techno Thriller, 0-87021-285-0');
INSERT INTO keyword(KID,Text)
VALUES(5,'The Stand, Post Apocalyptic, Stephen King, 978-0-385-12168-2');
INSERT INTO keyword(KID,Text)
VALUES(6,'The Hitch Hikers Guide To The Galaxy, Comedy, Science Fiction, Douglas Adams, 0-330-25864-8');
INSERT INTO keyword(KID,Text)
VALUES(7,'Doctor Sleep, Horror, Stephen King, 978-1-4767-2765-3');

/*This fills the author table*/
INSERT INTO author(Fname,Lname,AID,PID)
VALUES('Aldous','Huxley',1,1);
INSERT INTO author(Fname,Lname,AID,PID)
VALUES('L. Ron','Hubbard',2,2);
INSERT INTO author(Fname,Lname,AID,PID)
VALUES('J.R.R.','Tolkien',3,3);
INSERT INTO author(Fname,Lname,AID,PID)
VALUES('Tom','Clancy',4,4);
INSERT INTO author(Fname,Lname,AID,PID)
VALUES('Stephen','King',5,5);
INSERT INTO author(Fname,Lname,AID,PID)
VALUES('Douglas','Adams',6,6);

/*This fills the book table*/
INSERT INTO book(ISBN,BName,Price,Genre,KID,AID,PID,Quantity)
VALUES(0060809833,'Brave New World', 20,'Science Fiction',1,1,1,20);
INSERT INTO book(ISBN,BName,Price,Genre,KID,AID,PID,Quantity)
VALUES(1592120075,'Battlefield Earth',25,'Science Fiction',2,2,2,5);
INSERT INTO book(ISBN,BName,Price,Genre,KID,AID,PID,Quantity)
VALUES(0261102354,'Lord of The Rings:Fellowship of The Rings',40,'High Fantasy Adventure',3,3,3,10);
INSERT INTO book(ISBN,BName,Price,Genre,KID,AID,PID,Quantity)
VALUES(0870212850,'The Hunt For Red October',30,'Novel, Techno Thriller',4,4,4,7);
INSERT INTO book(ISBN,BName,Price,Genre,KID,AID,PID,Quantity)
VALUES(9780385121682,'Under the Dome',35,'Science Fiction, Dystopian, Political novel',5,5,5,3);
INSERT INTO book(ISBN,BName,Price,Genre,KID,AID,PID,Quantity)
VALUES(0330258648,'The Hitch Hikers Guide To The Galaxy',30,'Comedy, Science Fiction',6,6,6,2);
INSERT INTO book(ISBN,BName,Price,Genre,KID,AID,PID,Quantity)
VALUES(9781476727653,'Doctor Sleep',50,'Horror',7,5,7,30);

/*This fills the customer table*/
INSERT INTO customer(Fname,Lname,CID,Street,City,Zip,States,CPassword,Email)
VALUES('Bill','Howard',1,'Woop','Charlotte',28942,'NC','bunnylover5656','poopoo@gmail.com');
INSERT INTO customer(Fname,Lname,CID,Street,City,Zip,States,CPassword,Email)
VALUES('Coon','Friends',2,'South Park','Potato',39082,'OH','treehugger799','derpderp@aol.com');
INSERT INTO customer(Fname,Lname,CID,Street,City,Zip,States,CPassword,Email)
VALUES('Captain','Hindsight',3,'Coonville','Cleaveland',34874,'OH','stupidDatabase>:(','heraderp@derp.com');

/*This fills the orders table*/
INSERT INTO orders(orderID,CID,ODate,ISBN)
VALUES(100,1,10092005,0060809833);
INSERT INTO orders(orderID,CID,ODate,ISBN)
VALUES(101,1,05052010,1592120075);
INSERT INTO orders(orderID,CID,ODate,ISBN)
VALUES(102,2,09302003,0330258648);
INSERT INTO orders(orderID,CID,ODate,ISBN)
VALUES(103,3,07252009,9780385121682);
INSERT INTO orders(orderID,CID,ODate,ISBN)
VALUES(104,2,09302008,0261102354);
INSERT INTO orders(orderID,CID,ODate,ISBN)
VALUES(105,3,11052005,0870212850);

/*This is a trigger for updating book prices*/
CREATE OR REPLACE TRIGGER price_update_trigger
BEFORE UPDATE OF Price
ON book
FOR EACH ROW
BEGIN
INSERT INTO book_history
VALUES(:new.ISBN,:new.Price, sysdate);
END;
/

/*Trigger for adding another book to the database*/
CREATE OR REPLACE TRIGGER add_book_trigger
BEFORE INSERT
ON book
FOR EACH ROW
BEGIN
INSERT INTO book_history
VALUES(:new.ISBN,:new.Price,sysdate);
END;
/

/*Trigger for updating a customers info*/
CREATE OR REPLACE TRIGGER update_customer_trigger
BEFORE UPDATE
ON customer
FOR EACH ROW
BEGIN
INSERT INTO customer_history
VALUES(:new.Fname,:new.Lname,:new.CID,:new.Street,:new.City,:new.Zip,:new.States,sysdate,:new.CPassword,:new.Email);
END;
/

/*Query to update the book information*/
UPDATE Book
SET Price = 60
WHERE ISBN = 9781476727653;

/*Query to update the customer information*/
UPDATE customer SET States = 'NC' WHERE CID = 2;
UPDATE customer SET States = 'NY' WHERE CID = 10; --There no customer with the CID of 10 in current customer table so it does not update

/*Query to update a user's password*/
UPDATE customer SET CPassword = '123456789' where Fname = 'Captain';

/*Adding a new book*/
INSERT INTO book(ISBN,BName,Price,Genre,KID,AID,PID,Quantity)
VALUES(9771477727655,'Poop Hoop',2,'novel',1,1,1,3);

/*Insertion of new order*/
INSERT INTO orders(orderID,CID,ODate,ISBN)
VALUES(106,3,12122011,9771477727655);

/*Query to search for a book using a keywords to look by title and genre and list book information*/
SELECT * FROM keyword
WHERE text like '%Galaxy%' and text like '%Science%';

/*Query to search for a book using a keywords by genre and list book information*/
SELECT * FROM keyword
WHERE text like '%Science%';

/*Query to search for books that have a quantity greater than a certain number*/
SELECT * FROM book
WHERE Quantity > 1;

/*Lists the orders of all customers*/
SELECT * FROM orders;

/*Deletion of orders from a specific customer*/
DELETE FROM orders
WHERE CID = 1;

