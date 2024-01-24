USE book_db;


SELECT 
	author_fname, author_lname, 
    CASE 
		WHEN COUNT(title)<=1 THEN CONCAT(COUNT(title), ' book')
		WHEN COUNT(title)>1 THEN CONCAT(COUNT(title), ' books')
    END AS 'COUNT'     
FROM books 
GROUP BY author_fname, author_lname;