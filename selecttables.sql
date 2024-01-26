USE tv_db;


-- CREATE VIEW full_reviews AS
-- SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
-- JOIN series ON series.id = reviews.series_id
-- JOIN reviewers ON reviewers.id = reviews.reviewer_id;

-- SELECT title, AVG(rating) AS rating FROM full_reviews 
-- GROUP BY title HAVING COUNT(title)>1;

-- SELECT released_year, genre, AVG(rating), COUNT(title) AS rating FROM full_reviews 
-- GROUP BY released_year, genre WITH ROLLUP HAVING COUNT(title)>1;

-- SELECT @@GLOBAL.sql_mode;
-- SELECT @@SESSION.sql_mode;

-- To View Modes:
-- SELECT @@GLOBAL.sql_mode;
-- SET @@SESSION.sql_mode = 'STRICT_TRANS_TABLES,ONLY_FULL_GROUP_BY';
-- INSERT INTO reviews(rating) VALUES('hi');
-- SELECT * FROM reviews;
-- SELECT title, AVG(rating) FROM series
-- LEFT OUTER JOIN reviews ON series.id=reviews.series_id GROUP BY title;
-- set global sql_mode=default;
-- set session sql_mode=default;