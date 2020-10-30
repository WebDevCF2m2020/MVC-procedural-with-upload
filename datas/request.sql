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

# Sélectionne le nombre d'articles se trouvant dans une rubrique dont l'id est ... 
SELECT COUNT(a.idarticles) AS nb
	FROM articles a 
    INNER JOIN articles_has_rubriques hr
		ON hr.articles_idarticles = a.idarticles
	INNER JOIN rubriques r
		ON hr.rubriques_idrubriques = r.idrubriques
    WHERE r.idrubriques= 6
    ;

# Sélectionne tous les articles se trouvant dans une rubrique dont l'id est ....
SELECT a.idarticles, a.articles_title, LEFT(a.articles_text,300) AS articles_text, a.articles_date, u.idusers, u.users_name , GROUP_CONCAT(t.theimages_title SEPARATOR '|||') AS theimages_title, GROUP_CONCAT(t.theimages_name SEPARATOR '|||') AS theimages_name
FROM articles a 
	INNER JOIN users u 
		ON a.users_idusers = u.idusers
    LEFT JOIN  articles_has_theimages hi 
        ON hi.articles_idarticles = a.idarticles
    LEFT JOIN theimages t 
        ON t.idtheimages = hi.theimages_idtheimages  
    INNER JOIN articles_has_rubriques hr
		ON hr.articles_idarticles = a.idarticles
	INNER JOIN rubriques r
		ON hr.rubriques_idrubriques = r.idrubriques
    WHERE r.idrubriques= 10    
GROUP BY a.idarticles
ORDER BY a.articles_date DESC;     

# Sélectionne tous les articles se trouvant dans une rubrique dont l'id est ...., en affichant les rubriques (non obligatoire) si présentes - problème de WHERE r.idrubriques= 7 ,  donc les autres rubriques ne sont pas sélectionnées 
SELECT a.idarticles, a.articles_title, LEFT(a.articles_text,300) AS articles_text, a.articles_date, u.idusers, u.users_name , 
GROUP_CONCAT(t.theimages_title SEPARATOR '|||') AS theimages_title, GROUP_CONCAT(t.theimages_name SEPARATOR '|||') AS theimages_name,
	r.rubriques_titre	
FROM articles a 
	INNER JOIN users u 
		ON a.users_idusers = u.idusers
    LEFT JOIN  articles_has_theimages hi 
        ON hi.articles_idarticles = a.idarticles
    LEFT JOIN theimages t 
        ON t.idtheimages = hi.theimages_idtheimages  
    INNER JOIN articles_has_rubriques hr
		ON hr.articles_idarticles = a.idarticles
	INNER JOIN rubriques r
		ON hr.rubriques_idrubriques = r.idrubriques
    WHERE r.idrubriques= 7    
GROUP BY a.idarticles
ORDER BY a.articles_date DESC;  

# Sélectionne tous les articles se trouvant dans une rubrique dont l'id est ...., en affichant les rubriques (non obligatoire) si présentes - Requête imbriquée permettant de sélectionner toutes les rubriques dans lesquelles se trouvent chaque article ! grande complexité, est souvant remplacé dans de multiples SELECT articles par articles au niveau de la boucle, Symfony est incapable de faire ça! pour différencier les id, utilisation des alias internes : ar.idarticles  = a.idarticles (2 variables différentes)
SELECT a.idarticles, a.articles_title, LEFT(a.articles_text,300) AS articles_text, a.articles_date, u.idusers, u.users_name , 
GROUP_CONCAT(t.theimages_title SEPARATOR '|||') AS theimages_title, GROUP_CONCAT(t.theimages_name SEPARATOR '|||') AS theimages_name,

	(SELECT GROUP_CONCAT(ru.idrubriques,'---',  ru.rubriques_titre SEPARATOR '|||')  FROM rubriques ru
		INNER JOIN articles_has_rubriques hru
			ON hru.rubriques_idrubriques = ru.idrubriques 
        INNER JOIN articles ar
			ON hru.articles_idarticles = ar.idarticles 
        WHERE ar.idarticles  = a.idarticles    
	) AS categ	
		
FROM articles a 
	INNER JOIN users u 
		ON a.users_idusers = u.idusers
    LEFT JOIN  articles_has_theimages hi 
        ON hi.articles_idarticles = a.idarticles
    LEFT JOIN theimages t 
        ON t.idtheimages = hi.theimages_idtheimages  
    INNER JOIN articles_has_rubriques hr
		ON hr.articles_idarticles = a.idarticles
	INNER JOIN rubriques r
		ON hr.rubriques_idrubriques = r.idrubriques
    WHERE r.idrubriques= 7    
GROUP BY a.idarticles
ORDER BY a.articles_date DESC
LIMIT 0,5;  

# On sélèctionne les détails d'un article par son ID    
 SELECT a.idarticles, a.articles_title, a.articles_text, a.users_idusers, a.articles_date, 
	u.idusers, u.users_name , 
    GROUP_CONCAT(t.idtheimages) AS idtheimages, GROUP_CONCAT(t.theimages_title SEPARATOR '|||') AS theimages_title, GROUP_CONCAT(t.theimages_name SEPARATOR '|||') 
    AS theimages_name 
    FROM articles a 
	INNER JOIN users u 
		ON a.users_idusers = u.idusers
    LEFT JOIN  articles_has_theimages hi 
        ON hi.articles_idarticles = a.idarticles
    LEFT JOIN theimages t 
        ON t.idtheimages = hi.theimages_idtheimages
WHERE a.idarticles=39
GROUP BY a.idarticles ;  

# On sélection les rubriques pour recupRubriquesByIdFromArticle() un article, inutile de joindre articles car la clef primaire de celle-ci se trouve en tant que clef étrangère dans la table articles_has_rubriques
SELECT  r.idrubriques, r.rubriques_titre
FROM rubriques r
INNER JOIN articles_has_rubriques ha
	ON ha.rubriques_idrubriques = r.idrubriques
WHERE ha.articles_idarticles = 39;