--EEI5466 – Advanced Database Systems - MiniProject--
- MIF Hasna---
-- Library Management System ---

---SELECT function----
/*--- To view the author details and their books detail----*/
SELECT 
    a.author_id,
    author_name,
    b.ISBN,
    b.book_name,
	b.genren
FROM 
    author a
JOIN 
    book b ON a.author_id = b.author_id
ORDER BY author_name;

------INSERT Function-----
/*---- Inserting a new record to borrowing_history (without address)-----*/
INSERT INTO borrower (b_id,b_name,email,phoneNo) 
	VALUES('0198', 'Fathima','fathima@gmail.com','0772582588');

SELECT * FROM borrower; --Output the view--

------DELETE Function----
DELETE FROM borrower WHERE b_id = '0198';

SELECT * FROM borrower; --Output the view--


-------UPDATE Function-----
-- Updating the paid status for the paid_borrowers
UPDATE fine								
SET paid_status = 'paid'
WHERE fine_id = '1147';

SELECT * FROM fine;		--Output the view--
