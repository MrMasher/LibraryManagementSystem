create database Library_Management


CREATE TABLE tbl_publisher (
		publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		publisher_PublisherAddress VARCHAR(200) NOT NULL,
		publisher_PublisherPhone VARCHAR(50) NOT NULL,
	);
	select * from tbl_publisher
CREATE TABLE tbl_book (
		book_BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_Title VARCHAR(100) NOT NULL,
		book_PublisherName VARCHAR(100) NOT NULL CONSTRAINT fk_publisher_name1 FOREIGN KEY REFERENCES tbl_publisher(publisher_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
	);
	select * from tbl_book
CREATE TABLE tbl_library_branch (
		library_branch_BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		library_branch_BranchName VARCHAR(100) NOT NULL,
		library_branch_BranchAddress VARCHAR(200) NOT NULL,
	);
SELECT * FROM tbl_library_branch

CREATE TABLE tbl_borrower (
		borrower_CardNo INT PRIMARY KEY NOT NULL IDENTITY (100,1),
		borrower_BorrowerName VARCHAR(100) NOT NULL,
		borrower_BorrowerAddress VARCHAR(200) NOT NULL,
		borrower_BorrowerPhone VARCHAR(50) NOT NULL,
	);

SELECT * FROM tbl_borrower

CREATE TABLE tbl_book_loans (
		book_loans_LoansID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_loans_BookID INT NOT NULL CONSTRAINT fk_book_id1 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_BranchID INT NOT NULL CONSTRAINT fk_branch_id1 FOREIGN KEY REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_CardNo INT NOT NULL CONSTRAINT fk_cardno FOREIGN KEY REFERENCES tbl_borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_DateOut VARCHAR(50) NOT NULL,
		book_loans_DueDate VARCHAR(50) NOT NULL,
	);
	SELECT * FROM tbl_book_loans
	CREATE TABLE tbl_book_copies (
		book_copies_CopiesID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_copies_BookID INT NOT NULL CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_BranchID INT NOT NULL CONSTRAINT fk_branch_id2 FOREIGN KEY REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_No_Of_Copies INT NOT NULL,);

	SELECT * FROM tbl_book_copies

CREATE TABLE tbl_book_authors (
		book_authors_AuthorID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_authors_BookID INT NOT NULL CONSTRAINT fk_book_id3 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_authors_AuthorName VARCHAR(50) NOT NULL,
	);
SELECT * FROM tbl_book_authors


	INSERT INTO tbl_publisher
		(publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
		VALUES
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Rupa','161,B-4, Ground Floor,Gulmohar House,Yusuf Sarai Community Centre,New Delhi ? 110049','+91-11-49226666'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Hachette Book Publishing India',' 23, MAYFAIR APARTMENTS MAYFAIR GARDENS NEW DELHI New Delhi DL 110016','+91-11-4825222'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Penguin Random House India Private LImited','C, 1, Infinity Tower, 7th Floor, DLF Cyber City, DLF Phase 2, Sector 24, Gurugram, Haryana 122002','+91-0124-478-5600')
		;
		SELECT * FROM tbl_publisher
		INSERT INTO tbl_book
		(book_Title, book_PublisherName)
		VALUES 
		('Wow India','Hachette Book Publishing India'),
		('Patang','Hachette Book Publishing India'),
		('Devlok with Devdutt Pattanaik','Penguin Random House India Private LImited'),
		('Poor Economis','Penguin Random House India Private LImited'),
		('Empress','Penguin Random House India Private LImited'),
		('Diamond in the dust','Penguin Random House India Private LImited'),
		('Anapurna Devi','Penguin Random House India Private LImited'),	
		('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		('The burning gates','Bloomsbury'),
		('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		('Fade-Out','Bloomsbury'),
		('Sisty days to live','Bloomsbury'),
		('A Game of Thrones', 'Bantam'),
		('3 Mistakes of my life','Rupa'),
		('HalfGirlfried','Rupa'),
		('5 points someone','Rupa'),
		('Rebuilding Democracy in 21st century','Rupa'),
		('Leaves of Fall','Rupa'),
		('It', 'Viking');
	
	SELECT * FROM tbl_book WHERE book_PublisherName ='Rupa'


INSERT INTO tbl_library_branch
		(library_branch_BranchName, library_branch_BranchAddress)
		VALUES
		('TMH Lib','32 Bistupur, JAMSHEDPUR,831001'),
		('Central','N.I.T JSR , ADITYAPUR,831013'),
		('lakshmi lib','buti road, Sonari,JAMSHEDPUR, 831004'),
		('Gyaankund','101 South University,Kasidi,831008');

	SELECT * FROM tbl_library_branch

	INSERT INTO tbl_borrower
		(borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
		VALUES
		('Rahul Singh','M.I.G-97,Adityapur 2 ,Jamshedpur 831013','9199363359'),
		('Puspam Priya','flat 4,Raju Palace,Jamshedpur 831010','7004231123'),
		('Riya Sen','43th flat, k6, Ramnagar,Jamshedpur 831015','7343902455'),
		('Subham Jain','90, Rekha Apartment,Ranikudar,Jamshedpur 831004','8004367829'),
		('Rukaiya Khan','121 park street,khadgiri,Jamshedpur 831001','7125125522'),
		('Ashish Agarwal','l.Road bistupur, ,Jamshedpur 831006','816313418'),
		('Anuraag Parashar','13,G road Sonari Jamshedpur 831004','9914199935'),
		('Sahil Singh','l.I.G 25,Aditaypur 1 Jamshedpur 831013','7349981513');

		SELECT * FROM tbl_borrower

	
	SELECT * FROM tbl_borrower

	INSERT INTO tbl_book_loans
		(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)
		VALUES
		('1','1','100','1/1/21','2/2/21'),
		('2','1','100','1/1/21','2/2/21'),
		('3','1','100','1/1/21','2/2/21'),
		('4','1','100','1/1/21','2/2/21'),
		('5','1','102','1/3/21','2/3/21'),
		('6','1','102','1/3/21','2/3/21'),
		('7','1','102','1/3/21','2/3/21'),
		('8','1','102','1/3/21','2/3/21'),
		('9','1','102','1/3/21','2/3/21'),
		('11','1','102','1/3/21','2/3/21'),
		('12','2','105','12/12/20','1/12/21'),
		('10','2','105','12/12/20','1/12/20'),
		('20','2','105','2/3/21','3/3/21'),
		('18','2','105','1/5/21','2/5/21'),
		('19','2','105','1/5/21','2/5/21'),
		('19','2','100','1/3/21','2/3/21'),
		('11','2','106','1/7/21','2/7/21'),
		('1','2','106','1/7/21','2/7/21'),
		('2','2','100','1/7/21','2/7/21'),
		('3','2','100','1/7/21','2/7/21'),
		('5','2','105','12/12/21','1/12/21'),
		('4','3','103','1/9/21','2/9/21'),
		('7','3','102','1/3/21','2/3/21'),
		('17','3','102','1/3/21','2/3/21'),
		('16','3','104','1/3/21','2/3/21'),
		('15','3','104','1/3/21','2/3/21'),
		('15','3','107','1/3/21','2/3/21'),
		('14','3','104','1/3/21','2/3/21'),
		('13','3','107','1/3/21','2/3/21'),
		('13','3','102','1/3/21','2/3/21'),
		('19','3','102','12/12/21','1/12/21'),
		('20','4','103','1/3/21','2/3/21'),
		('1','4','102','1/12/21','2/12/21'),
		('3','4','107','1/3/21','2/3/21'),
		('18','4','107','1/3/21','2/3/21'),
		('12','4','102','1/4/21','2/4/21'),
		('11','4','103','1/15/21','2/15/21'),
		('9','4','103','1/15/21','2/15/21'),
		('7','4','107','1/1/21','2/2/21'),
		('4','4','103','1/1/21','2/2/21'),
		('1','4','103','2/2/21','3/2/21'),
		('20','4','103','1/3/21','2/3/21'),
		('1','4','102','1/12/21','2/12/21'),
		('3','4','107','1/13/21','2/13/21'),
		('18','4','107','1/13/21','2/13/21'),
		('12','4','102','1/14/21','2/14/21'),
		('11','4','103','1/15/21','2/15/21'),
		('9','4','103','1/15/21','2/15/21'),
		('7','4','107','1/19/21','2/19/21'),
		('4','4','103','1/19/21','2/19/21'),
		('1','4','103','1/22/21','2/22/21');

	
		SELECT * FROM tbl_book_loans
		
	INSERT INTO tbl_book_copies
		(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
		VALUES
		('1','1','5'),
		('2','1','5'),
		('3','1','5'),
		('4','1','5'),
		('5','1','5'),
		('6','1','5'),
		('7','1','5'),
		('8','1','5'),
		('9','1','5'),
		('10','1','5'),
		('11','1','5'),
		('12','1','5'),
		('13','1','5'),
		('14','1','5'),
		('15','1','5'),
		('16','1','5'),
		('17','1','5'),
		('18','1','5'),
		('19','1','5'),
		('20','1','5'),
		('1','2','5'),
		('2','2','5'),
		('3','2','5'),
		('4','2','5'),
		('5','2','5'),
		('6','2','5'),
		('7','2','5'),
		('8','2','5'),
		('9','2','5'),
		('10','2','5'),
		('11','2','5'),
		('12','2','5'),
		('13','2','5'),
		('14','2','5'),
		('15','2','5'),
		('16','2','5'),
		('17','2','5'),
		('18','2','5'),
		('19','2','5'),
		('20','2','5'),
		('1','3','5'),
		('2','3','5'),
		('3','3','5'),
		('4','3','5'),
		('5','3','5'),
		('6','3','5'),
		('7','3','5'),
		('8','3','5'),
		('9','3','5'),
		('10','3','5'),
		('11','3','5'),
		('12','3','5'),
		('13','3','5'),
		('14','3','5'),
		('15','3','5'),
		('16','3','5'),
		('17','3','5'),
		('18','3','5'),
		('19','3','5'),
		('20','3','5'),
		('1','4','5'),
		('2','4','5'),
		('3','4','5'),
		('4','4','5'),
		('5','4','5'),
		('6','4','5'),
		('7','4','5'),
		('8','4','5'),
		('9','4','5'),
		('10','4','5'),
		('11','4','5'),
		('12','4','5'),
		('13','4','5'),
		('14','4','5'),
		('15','4','5'),
		('16','4','5'),
		('17','4','5'),
		('18','4','5'),
		('19','4','5'),
		('20','4','5');
		SELECT * FROM tbl_book_copies

		INSERT INTO tbl_book_authors
		(book_authors_BookID,book_authors_AuthorName)
		VALUES
		('1','Aditi Mittal'),
		('2','Bhaskar Chattopadhyay'),
		('3','Devdutt'),
		('4','Abhijit Banerjee'),
		('5','RUBY Lal'),
		('6','Sue Smethurst'),
		('7','Swapan Kumar'),
		('8','J.K. Rowling'),
		('9','Parker Bilal'),
		('10','J.K. Rowling'),
		('11','J.K. Rowling'),
		('12','Patrick Tilley'),
		('13','Dennis Weathley'),
		('14','R.R.Martin'),
		('15','Chetan Bhagat'),
		('16','Chetan Bhagat'),
		('17','Chetan Bhagat'),
		('18','Arun Maria'),
		('19','Amarjeet Saini'),
		('20','Stephen King');

SELECT * FROM tbl_book_authors
/* Some things we can find out using the following tables*/

/*1)lets find out for each library branch what is the branch name and total number of books loaned */

SELECT  Branch.library_branch_BranchName AS [Branch Name], COUNT (Loans.book_loans_BranchID) AS [Total Loans]
		FROM tbl_book_loans AS Loans
			INNER JOIN tbl_library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
			GROUP BY library_branch_BranchName

/* 2)let's consider if we need to know the number of copies of a particular title at a particular library
  for example:
   How many copies of the book titled "Wow India" are owned by the library branch whose name is "Gyaankund"? */
   SELECT copies.book_copies_BranchID AS [Branch ID], branch.library_branch_BranchName AS [Branch Name],
	   copies.book_copies_No_Of_Copies AS [Number of Copies],
	   book.book_Title AS [Book Title]
	   FROM tbl_book_copies AS copies
			INNER JOIN tbl_book AS book ON copies.book_copies_BookID = book.book_BookID
			INNER JOIN tbl_library_branch AS branch ON book_copies_BranchID = branch.library_branch_BranchID
	   WHERE book.book_Title ='Wow India'AND branch.library_branch_BranchName ='Gyaankund'


/* 3)Lets retrieve the names of all borrowers who do not have any books checked out. */
		
	SELECT borrower_BorrowerName FROM tbl_borrower
	WHERE NOT EXISTS
		(SELECT * FROM tbl_book_loans
		WHERE book_loans_CardNo = borrower_CardNo)
		
/*4)For each book that is loaned out from the "Central" branch and whose DueDate is today(2/7/21),
retrieve the book title, the borrower's name, and the borrower's address.  */



SELECT Branch.library_branch_BranchName AS [Branch Name],  Book.book_Title [Book Name],
	   Borrower.borrower_BorrowerName AS [Borrower Name], Borrower.borrower_BorrowerAddress AS [Borrower Address],
	   Loans.book_loans_DateOut AS [Date Out], Loans.book_loans_DueDate [Due Date]
	   FROM tbl_book_loans AS Loans
			INNER JOIN tbl_book AS Book ON Loans.book_loans_BookID = Book.book_BookID
			INNER JOIN tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
			INNER JOIN tbl_library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
		WHERE Loans.book_loans_DueDate ='2/7/21' AND Branch.library_branch_BranchName = 'Central'

/* 5)Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */

	SELECT Borrower.borrower_BorrowerName AS [Borrower Name], Borrower.borrower_BorrowerAddress AS [Borrower Address],
		   COUNT(Borrower.borrower_BorrowerName) AS [Books Checked Out]
		   FROM tbl_book_loans AS Loans
		   			INNER JOIN tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
					GROUP BY Borrower.borrower_BorrowerName, Borrower.borrower_BorrowerAddress
		   HAVING COUNT(Borrower.borrower_BorrowerName) >=5








