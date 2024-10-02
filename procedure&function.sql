--EEI5466 – Advanced Database Systems - MiniProject--
 - MIF Hasna---
-- Library Management System ---

--Creating a procedure to insert new borrowers to the system---

CREATE PROCEDURE NewBorrower
	@b_id int,
    @b_name varchar(50),
    @email varchar(50),
    @phoneNo int,
    @address varchar(60)
AS
BEGIN
    INSERT INTO borrower (b_id,b_name, email, phoneNo, addres)
    VALUES (@b_id,@b_name, @email, @phoneNo, @address);
END;
 --- Executing the procedure ----
 EXEC NewBorrower '2150','Hermione Granger', 'Hermione@gmail.com', '0779639636', '582, Galle Road, Colombo 05';

 SELECT*FROM borrower; ----To View the output----

/* DELETE FROM borrower WHERE b_id = '2150';*/

--Creating a Function to get the total fine amount of a borrower---

CREATE FUNCTION CalculateTotalFine
(
    @b_id int							--- declairing b_id
)
RETURNS TABLE
AS
RETURN
(
    SELECT b.b_name, 
	ISNULL(SUM(f.amount), 0) AS totalFineAmount  ---calculating the sum of fine amount as the totalFineAmount
    FROM borrower b
    LEFT JOIN fine f ON b.b_id = f.b_id		---joining the borrowers table and the fine table to get the relevent data
    WHERE b.b_id = @b_id
    GROUP BY b.b_name
);

------Executing the function------
DECLARE @b_id int = 0222;			----declairing the variables
DECLARE @totalFine int;
DECLARE @b_name varchar(100);

SELECT @b_name = b_name, @totalFine = totalFineAmount
FROM dbo.CalculateTotalFine(@b_id); --calling the function CalculateTotalFine from the dbo schema and passing the parameter @b_id to it.

PRINT 'Total fine amount for borrower ' + CAST(@b_id AS varchar(10)) + ', '+ @b_name + ' is: ' + CAST(@totalFine AS varchar(10));
										--CAST is used here to change the data type 
