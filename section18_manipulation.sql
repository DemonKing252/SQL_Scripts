USE ig_clone;

-- SELECT 
-- 	DAYNAME(created_at) AS day_nm, 
-- 	COUNT(*) AS appearances 
-- FROM users 
-- 	GROUP BY day_nm ORDER BY appearances 
-- DESC LIMIT 1;

-- SELECT * FROM likes;

-- SELECT
-- 	likes.photo_id,
--     COUNT(*) AS like_count
-- FROM likes
-- GROUP BY photo_id
-- ORDER BY like_count DESC LIMIT 1;

-- AVG photos per user
-- CREATE OR REPLACE VIEW all_photos AS
-- SELECT
-- 	photos.user_id,
--     COUNT(*) AS photo_count
-- FROM photos
-- GROUP BY photos.user_id;
-- SELECT * FROM all_photos;
-- SELECT AVG(photo_count) FROM all_photos;

-- SELECT 
-- 	(SELECT COUNT(*) FROM photos) /
--     (SELECT COUNT(*) FROM users) AS avg;

-- SELECT
-- 	AVG(user_id)
-- FROM photos;

-- SELECT 
-- 	tag_id,
--     tag_name
-- FROM photo_tags
-- INNER JOIN
-- 	tags ON photo_tags.tag_id = tags.id
-- GROUP BY photo_tags.tag_id
-- ORDER BY COUNT(*) DESC LIMIT 5;

-- SELECT
--     likes.user_id,
--     users.id
-- FROM likes
-- LEFT OUTER JOIN
-- 	users ON users.id = likes.user_id
-- ORDER BY likes.user_id;

-- CREATE OR REPLACE VIEW photo_count AS
-- SELECT COUNT(*) FROM photos;
-- SELECT * FROM photo_count;

-- SELECT likes.user_id, COUNT(*) FROM likes
-- INNER JOIN photos
-- ON likes.user_id = photos.user_id
-- GROUP BY likes.user_id;

SELECT users.username, likes.user_id, COUNT(likes.user_id) AS total FROM likes
INNER JOIN users
ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING total = (SELECT COUNT(*) FROM photos);