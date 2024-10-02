--EEI5466 – Advanced Database Systems - MiniProject--
- MIF Hasna---
-- Library Management System ---

-- Creating a database --
CREATE DATABASE LibrarySystem;

-- Creating relevent tables -- 
----Table 01-----
 CREATE TABLE borrower(
	b_id int NOT NULL,
	b_name varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	phoneNo int,
	addres varchar(60),
	PRIMARY KEY(b_id)
 );

 ----Table 02-----
 CREATE TABLE book(
	ISBN int NOT NULL,
	book_name varchar(100) NOT NULL,
	author_id int NOT NULL,
	published_year int,
	genren varchar(50),
	PRIMARY KEY(ISBN)
 );

 --- Table 03--
 CREATE TABLE borrowing_history(
	b_id int NOT NULL,
	ISBN int NOT NULL,
	borrowing_date date NOT NULL,
	return_date date NOT NULL,
	no_overdue int,
	FOREIGN KEY(b_id) REFERENCES borrower(b_id)
	);

---Table 04 ---
CREATE TABLE author(
	author_id int NOT NULL,
	author_name varchar(50) NOT NULL,
	nationality varchar(50),
	PRIMARY KEY(author_id),
);

---Table 05------
CREATE TABLE fine(
	fine_id int IDENTITY(1101,2),     --IDENTITY key word is used to autogenerate the fine_id
	b_id int NOT NULL,
	ISBN int NOT NULL,
	no_overdue int,
	amount int,
	paid_status varchar(25),
	PRIMARY KEY(fine_id),
	FOREIGN KEY(b_id) REFERENCES borrower(b_id)
);


--to view all the created tables---
SELECT name AS Tables_View
FROM sys.tables;
