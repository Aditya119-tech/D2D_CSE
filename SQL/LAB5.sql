-- ============================================================================
-- LAB 5: DDL & DELETE OPERATIONS
-- Execute this script as a whole (F5) or block-by-block.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- PART-A
-- ----------------------------------------------------------------------------

-- 1. Add column state varchar(20)
ALTER TABLE DEPOSIT1
ADD STATE VARCHAR(20);
GO
EXEC sp_help DEPOSIT1;
GO
SELECT * FROM DEPOSIT1
-- 2. Add two more columns city varchar(20) and pincode int
ALTER TABLE DEPOSIT1
ADD CITY VARCHAR(20), PINCODE INT;
GO
EXEC sp_help DEPOSIT1;
GO

-- 3. Change the size of cname column from varchar(50) to varchar(35)
ALTER TABLE DEPOSIT1
ALTER COLUMN CNAME VARCHAR(35);
GO
EXEC sp_help DEPOSIT1;
GO

-- 4. Change the data type of amount from decimal to int
ALTER TABLE DEPOSIT1
ALTER COLUMN AMOUNT INT;
GO
EXEC sp_help DEPOSIT1;
GO

-- 5. Delete column city from the DEPOSIT table
ALTER TABLE DEPOSIT1
DROP COLUMN CITY;
GO
EXEC sp_help DEPOSIT1;
GO

-- 6. Rename column actno to ano
EXEC sp_rename 'DEPOSIT1.ACTNO', 'ANO';
GO
EXEC sp_help DEPOSIT1;
GO

-- 7. Rename column bname to branch_name
EXEC sp_rename 'DEPOSIT1.BNAME', 'BRANCH_NAME';
GO
EXEC sp_help DEPOSIT1;
GO

-- 8. Rename table DEPOSIT to DEPOSIT_DETAIL
EXEC sp_rename 'DEPOSIT1', 'DEPOSIT_DETAIL';
GO
EXEC sp_help DEPOSIT_DETAIL;
GO

-- 9. Add column ifsc_code varchar(15)
ALTER TABLE DEPOSIT_DETAIL
ADD IFSC_CODE VARCHAR(15);
GO
EXEC sp_help DEPOSIT_DETAIL;
GO

-- 10. Change the size of branch_name column from varchar(50) to varchar(30)
ALTER TABLE DEPOSIT_DETAIL
ALTER COLUMN BRANCH_NAME VARCHAR(30);
GO
EXEC sp_help DEPOSIT_DETAIL;
GO


-- ----------------------------------------------------------------------------
-- PART-B
-- ----------------------------------------------------------------------------

-- 11. Rename column adate to aopendate
EXEC sp_rename 'DEPOSIT_DETAIL.ADATE', 'AOPENDATE';
GO
EXEC sp_help DEPOSIT_DETAIL;
GO

-- 12. Delete column aopendate from DEPOSIT_DETAIL table
-- NOTE: If your Exception Part Q5 requires filtering by AOPENDATE, keep this statement commented out.
ALTER TABLE DEPOSIT_DETAIL
DROP COLUMN AOPENDATE;
GO
EXEC sp_help DEPOSIT_DETAIL;
GO

-- 13. Rename column cname to customer_name
EXEC sp_rename 'DEPOSIT_DETAIL.CNAME', 'CUSTOMER_NAME';
GO
EXEC sp_help DEPOSIT_DETAIL;
GO

-- 14. Add column country varchar(20)
ALTER TABLE DEPOSIT_DETAIL
ADD COUNTRY VARCHAR(20);
GO
EXEC sp_help DEPOSIT_DETAIL;
GO

-- 15. Add column account_type varchar(15)
ALTER TABLE DEPOSIT_DETAIL
ADD ACCOUNT_TYPE VARCHAR(15);
GO
EXEC sp_help DEPOSIT_DETAIL;
GO


-- ----------------------------------------------------------------------------
-- PART-C
-- ----------------------------------------------------------------------------

-- 16. Change data type of pincode from int to bigint
ALTER TABLE DEPOSIT_DETAIL
ALTER COLUMN PINCODE BIGINT;
GO
EXEC sp_help DEPOSIT_DETAIL;
GO

-- 17. Delete column account_type
ALTER TABLE DEPOSIT_DETAIL
DROP COLUMN ACCOUNT_TYPE;
GO
EXEC sp_help DEPOSIT_DETAIL;
GO

-- 18. Rename column amount to balance
EXEC sp_rename 'DEPOSIT_DETAIL.AMOUNT', 'BALANCE';
GO
EXEC sp_help DEPOSIT_DETAIL;
GO

-- 19. Add column status varchar(10)
ALTER TABLE DEPOSIT_DETAIL
ADD STATUS VARCHAR(10);
GO
EXEC sp_help DEPOSIT_DETAIL;
GO

-- 20. Change table name deposit_detail to bank_deposit
EXEC sp_rename 'DEPOSIT_DETAIL', 'BANK_DEPOSIT';
GO
EXEC sp_help BANK_DEPOSIT;
GO


-- ----------------------------------------------------------------------------
-- EXCEPTION PART (DELETE & DDL CLEANUP)
-- ----------------------------------------------------------------------------

-- 1. Delete all the records having amount less than or equal to 3000
DELETE FROM BANK_DEPOSIT
WHERE BALANCE <= 3000;
GO

-- 2. Delete all the accounts of 'BEDI' branch customer
DELETE FROM BANK_DEPOSIT
WHERE BRANCH_NAME = 'BEDI';
GO

-- 3. Delete all the accounts having account number greater than 102 and less than 109
DELETE FROM BANK_DEPOSIT
WHERE ANO > 102 AND ANO < 109;
GO

-- 4. Delete all the accounts whose branch is 'BEDI' or 'MADHAPAR'
DELETE FROM BANK_DEPOSIT
WHERE BRANCH_NAME IN ('BEDI', 'MADHAPAR');
GO

-- 5. Delete all the accounts details where amount is 8000 and account open after 1-1-2025
-- (Requires AOPENDATE column to exist; omit if column was dropped in step 12)
ALTER TABLE BANK_DEPOSIT ADD AOPENDATE DATE; -- Safeguard in case Q12 dropped it
GO
DELETE FROM BANK_DEPOSIT
WHERE BALANCE = 8000 AND AOPENDATE > '2025-01-01';
GO

-- 6. Delete all the accounts whose account branch is NULL
DELETE FROM BANK_DEPOSIT
WHERE BRANCH_NAME IS NULL;
GO

-- 7. Delete all the accounts details where amount is 7000, name is CHARMI, and branch is SHITAL PARK
DELETE FROM BANK_DEPOSIT
WHERE BALANCE = 7000 AND CUSTOMER_NAME = 'CHARMI' AND BRANCH_NAME = 'SHITAL PARK';
GO

-- 8. Delete all the remaining records using DELETE command
DELETE FROM BANK_DEPOSIT;
GO

-- 9. Delete all the records of DEPOSIT table (Use TRUNCATE)
TRUNCATE TABLE BANK_DEPOSIT;
GO

-- 10. Remove DEPOSIT table (Use DROP)
DROP TABLE BANK_DEPOSIT;
GO


-- ----------------------------------------------------------------------------
-- PART-B (STUDENT TABLE OPERATIONS)
-- ----------------------------------------------------------------------------

-- 11. Delete all the students whose stdid is greater than 105
DELETE FROM STUDENT1
WHERE STDID > 105;
GO

-- 12. Delete the records whose branch is NULL and sname is not NULL
DELETE FROM STUDENT1
WHERE BRANCH IS NULL AND SNAME IS NOT NULL;
GO

-- 13. Delete the records whose SPI is less than 9 and city is RAJKOT
DELETE FROM STUDENT1
WHERE SPI < 9.00 AND CITY = 'RAJKOT';
GO

-- 14. Delete the records whose branch name is not empty
DELETE FROM STUDENT1
WHERE BRANCH IS NOT NULL;
GO

-- 15. Delete all the records of STUDENT table (Use TRUNCATE)
TRUNCATE TABLE STUDENT1;
GO