DROP DATABASE ig_db;
CREATE DATABASE ig_db;
USE ig_db;

CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- DESC users;
INSERT INTO users(username) VALUES
('liamblake252'), ('rosielunardo'), ('alexagostino'), ('saracampoli');

INSERT INTO photos(image_url, user_id) VALUES
('https://instagram.com/image/j1ijsi12.png', 1),
('https://instagram.com/image/j1ijsi13.png', 1),
('https://instagram.com/image/j1ijsi14.png', 2),
('https://instagram.com/image/j1ijsi15.png', 2),
('https://instagram.com/image/j1ijsi16.png', 2),
('https://instagram.com/image/j1ijsi17.png', 3),
('https://instagram.com/image/j1ijsi18.png', 3),
('https://instagram.com/image/j1ijsi19.png', 4);

-- Example Inner Join:

SELECT 
	photos.id AS photo_id, 
	image_url, 
	username, 
	photos.created_at AS photo_created_at 
FROM photos
INNER JOIN users 
	ON photos.user_id = users.id;