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

CREATE TABLE comments(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

CREATE TABLE likes(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    UNIQUE (user_id, photo_id)
    -- OR PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows(
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	tag_name VARCHAR(255) UNIQUE,
	created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE photo_tags(
	photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL
);

-- DESC users;
-- INSERT INTO users(username) VALUES
-- ('liamblake252'), ('rosielunardo'), ('alexagostino'), ('saracampoli');

-- INSERT INTO photos(image_url, user_id) VALUES
-- ('https://instagram.com/image/j1ijsi12.png', 1), -- 1
-- ('https://instagram.com/image/j1ijsi13.png', 1), -- 2
-- ('https://instagram.com/image/j1ijsi14.png', 2), -- 3
-- ('https://instagram.com/image/j1ijsi15.png', 2), -- 4
-- ('https://instagram.com/image/j1ijsi16.png', 2), -- 5
-- ('https://instagram.com/image/j1ijsi17.png', 3), -- 6
-- ('https://instagram.com/image/j1ijsi18.png', 3), -- 7
-- ('https://instagram.com/image/j1ijsi19.png', 4); -- 8

-- INSERT INTO comments(comment_text, user_id, photo_id) VALUES
-- ('some comment 1', 4, 8),
-- ('some comment 2', 3, 8),
-- ('some comment 3', 2, 8),
-- ('some comment 1', 4, 8);

-- INSERT INTO likes(user_id, photo_id) VALUES
-- (1, 3),
-- (1, 4),
-- (2, 4),
-- (2, 5),
-- (3, 6);

-- INSERT INTO follows(follower_id, followee_id) VALUES
-- (3, 2),
-- (3, 1),
-- (2, 3);

-- INSERT INTO tags(tag_name) VALUES
-- ('#nice'), ('#hot');

-- INSERT INTO photo_tags(photo_id, tag_id) VALUES
-- (1, 1),
-- (2, 1),
-- (3, 1),
-- (4, 1),
-- (6, 2);

-- SELECT follower_id, followee_id, users.id, users.username
-- FROM follows
-- LEFT OUTER JOIN users
-- ON follows.follower_id = users.id;

-- Example Inner Join:


-- SELECT 
-- 	photos.id AS photo_id, 
-- 	image_url, 
-- 	username, 
-- 	photos.created_at AS photo_created_at 
-- FROM photos
-- INNER JOIN users 
-- 	ON photos.user_id = users.id;

-- SELECT comments.id, comments.comment_text, users.username, likes.id, likes.created_at
-- FROM users
-- LEFT OUTER JOIN comments
-- 	ON comments.user_id = users.id
-- LEFT OUTER JOIN likes
-- 	ON likes.user_id = users.id
-- WHERE comments.id IS NOT NULL;