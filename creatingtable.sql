CREATE DATABASE tv_db;
USE tv_db;
CREATE TABLE reviewers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE series(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150),
    released_year YEAR,
    genre VARCHAR(150)
);

CREATE TABLE reviews(
	id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY (series_id) REFERENCES series(id),
    FOREIGN KEY (reviewer_id) REFERENCES reviewers(id)
);