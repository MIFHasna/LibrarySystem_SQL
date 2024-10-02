--EEI5466 – Advanced Database Systems - MiniProject--
- MIF Hasna---
-- Library Management System ---

--Inserting Values to the table--
---Borrower Table---
INSERT INTO borrower VALUES
	('0111', 'Stormi Noble','stormi@gmail.com','0111212121','01,Galle Road, Colombo-01'),
	('0222', 'Idris Archer','idris@gmail.com','0111313131','02,Galle Road, Colombo-02'),
	('0333', 'Dorian Mendez','dorian@gmail.com','0111414141','03,Galle Road, Colombo-03'),
	('0444', 'Marie Beck','Marie@gmail.com','0111515151','04,Galle Road, Colombo-04'),
	('0555', 'Jessica Davis','Jessica@gmail.com','0111616161','05,Galle Road, Colombo-05'),
	('0666', 'Joy Woodard','Joy@gmail.com','0111717171','06,Galle Road, Colombo-06'),
	('0777', 'Angelo Reid','Angelo@gmail.com','0111818181','07,Galle Road, Colombo-07'),
	('0888', 'Andres Dunlap','Andres@gmail.com','0111919191','08,Galle Road, Colombo-08'),
	('0999', 'Leo Harrison','Leo@gmail.com','0112212211','09,Galle Road, Colombo-09'),
	('0101', 'Karson Bush','Karson@gmail.com','0112232233','10,Galle Road, Colombo-10');

SELECT * FROM borrower;

--Book Table ----
INSERT INTO book VALUES
	('0111111','The Chronicles of Narnia','0001','2007','Adventure'),
	('0222222','Mistborn','0002','2006','Adventure'),
	('0333333','The Colour of Magic','0003','1989','Adventure'),
	('0444444','Narnia','0001','2009','Adventure'),
	('0555555','Life of Pi','0004','2002','Adventure'),
	('0666666','Harry Potter','0005','1991','Adventure'),
	('0777777','Sherlock Holms','0006','1865','Crime'),
	('0888888','The Dancing Partner: Clocks','0007', '1889', 'Comedy'),
	('0999999','Death on the Air','0008','1990', 'Crime'),
	('0101010','Irish Revel','0009','1968','Romance');

SELECT * FROM book;

--Author Table ----
INSERT INTO author VALUES
	('0001','C. S. Lewis','British'),
	('0002','Brandon Sanderson','American'),
	('0003','Terry Pratchett','British'),
	('0004','Yann Martel','Canadian'),
	('0005','J. K. Rowling','British'),
	('0006','Arthur Conan Doyle','British'),
	('0007','Jerome K. Jerome','British'),
	('0008','Ngaio Marsh','New Zealand'),
	('0009','Edna O Brien','Irish');

--Borrowing History Table--
INSERT INTO borrowing_history (b_id,ISBN,borrowing_date,return_date) 
VALUES	('0111','0101010','2024-01-04','2024-02-04'),
		('0111','0111111','2024-02-04','2024-03-04'),
		('0222','0222222','2022-01-04','2022-05-04'),
		('0222','0333333','2023-12-04','2024-02-04'),
		('0444','0444444','2024-03-04','2024-04-04'),
		('0555','0555555','2024-03-04','2024-05-04'),
		('0666','0666666','2023-01-04','2023-05-04'),
		('0777','0777777','2023-06-04','2024-07-04'),
		('0888','0888888','2023-08-04','2024-09-04'),
		('0999','0999999','2024-01-04','2024-03-04');

--Setting the values for no_overdue column to check the difference between borrowed and return date---
UPDATE borrowing_history																/*UPDATE FUNCTION*/
SET no_overdue = DATEDIFF(month, borrowing_date, return_date);

SELECT * FROM borrowing_history;


------Fine Table-------
INSERT INTO fine(b_id, ISBN,no_overdue,amount,paid_status) 
SELECT 
    bh.b_id,
    bh.ISBN,
    bh.no_overdue,
    CASE								-- case is used to create different output based on conditions.
        WHEN bh.no_overdue >= 2			-- condition to check the no of overdue months
		THEN (bh.no_overdue) * 20	    --calculating the due amount
        ELSE 0							--No fine if overdue is less than 2 months
    END AS amount,						-- ending the CASE statement 
    'Unpaid' AS paid_status				--updating the paid status as unpaid  
										--and once the payment is done it will change to paid manually
FROM 
    borrowing_history bh				--bh is mentioned for borrowing_history table
WHERE 
    bh.no_overdue >= 2;					--fine table is assign only for the more than 2 months due borrowers
										--this condition will check the records of overdue is more than 2 months

UPDATE fine								-- Updating the paid status for the paid borrowers
SET paid_status = 'paid'
WHERE fine_id = '1147';

SELECT * FROM fine;
