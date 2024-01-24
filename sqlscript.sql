USE shirts_db;

CREATE TABLE shirts(
	shirt_id INT AUTO_INCREMENT KEY,
    article CHAR(30) NOT NULL,
    color CHAR(30) NOT NULL,
    shirt_size CHAR(1) DEFAULT 'M',
    last_worn CHAR(30)
);