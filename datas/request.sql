# count all articles
SELECT COUNT(idarticles) AS nb
FROM articles;

# SELECT ALL FROM articles with their users (not optional)
SELECT a.idarticles, a.articles_title, 
LEFT(a.articles_text,300) AS articles_text, 
a.articles_date, u.idusers, u.users_name
FROM articles a 
	INNER JOIN users u 
		ON a.users_idusers = u.idusers
ORDER BY a.articles_date DESC;

# SELECT ALL FROM articles with their users (optional)
SELECT a.idarticles, a.articles_title, 
LEFT(a.articles_text,300) AS articles_text, 
a.articles_date, u.idusers, u.users_name
FROM articles a 
	LEFT JOIN users u 
		ON a.users_idusers = u.idusers
ORDER BY a.articles_date DESC;

# SELECT ALL FROM articles with their users (not optional) WITH images (not optional)
SELECT a.idarticles, a.articles_title, 
LEFT(a.articles_text,300) AS articles_text, 
a.articles_date, u.idusers, u.users_name, t.*
FROM articles a 
	INNER JOIN users u 
		ON a.users_idusers = u.idusers
    INNER JOIN articles_has_theimages ht
		ON ht.articles_idarticles = a.idarticles
    INNER JOIN theimages t 
		ON t.idtheimages = ht.theimages_idtheimages
ORDER BY a.articles_date DESC;

# SELECT ALL FROM articles with their users (not optional) WITH images (optional)
SELECT a.idarticles, a.articles_title, 
LEFT(a.articles_text,300) AS articles_text, 
a.articles_date, u.idusers, u.users_name, 
GROUP_CONCAT(t.idtheimages) AS idtheimages, 
GROUP_CONCAT(t.theimages_title SEPARATOR '|||') AS theimages_title, 
GROUP_CONCAT(t.theimages_name SEPARATOR '|||') AS theimages_name
FROM articles a 
	INNER JOIN users u 
		ON a.users_idusers = u.idusers
    LEFT JOIN articles_has_theimages ht
		ON ht.articles_idarticles = a.idarticles
    LEFT JOIN theimages t 
		ON t.idtheimages = ht.theimages_idtheimages
GROUP BY a.idarticles        
ORDER BY a.articles_date DESC;

# SELECT ALL FROM rubriques;
SELECT * FROM rubriques;