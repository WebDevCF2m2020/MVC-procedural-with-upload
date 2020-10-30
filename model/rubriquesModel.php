<?php
// Sélection de tous les sections pour le menu (et pour d'autres cas)
function recupAllRubriques($connect){
    $sql="SELECT * FROM rubriques;";
    $request = mysqli_query($connect,$sql) or die(mysqli_error($connect));
    // si on a au moins un résultat
    if(mysqli_num_rows($request)){
        // retourne un tableau indexé contenant des tableaux associatifs
        return mysqli_fetch_all($request,MYSQLI_ASSOC);
    }else{
        // tableau vide
        return [];
    }
}
// Sélection d'une section par son ID
function recupRubriquesById($connect,$id){
    $id = (int) $id;
    $sql="SELECT * FROM rubriques WHERE idrubriques=$id;";
    $request = mysqli_query($connect,$sql) or die(mysqli_error($connect));
    // si on a au moins un résultat
    if(mysqli_num_rows($request)){
        // retourne un tableau associatif si on a 1 résultat
        return mysqli_fetch_assoc($request);
    }else{
        // tableau vide
        return [];
    }
}
// Compte le nombre d'articles dans la rubrique/section par son ID
function recupArticlesByIdFromRubriques($connect,$id){
    $id = (int) $id;
    $sql="SELECT COUNT(a.idarticles) AS nb
	FROM articles a 
    INNER JOIN articles_has_rubriques hr
		ON hr.articles_idarticles = a.idarticles
	INNER JOIN rubriques r
		ON hr.rubriques_idrubriques = r.idrubriques
    WHERE r.idrubriques=$id;";
    $request = mysqli_query($connect,$sql) or die(mysqli_error($connect));
    // si on a au moins un résultat
    if(mysqli_num_rows($request)){
        // retourne un numérique avec le nombre d'articles dans une rubrique
        return mysqli_fetch_assoc($request)['nb'];
    }else{
        // envoie 0
        return 0;
    }
}

// Load all articles with author and images (optionnal) but with 300 caracters from "texte" with pagination LIMIT Into the rubriques selected by ID
function articlesLoadResumePaginationByIdRubriques($cdb,$idcateg,$begin,$nbperpage=10){
    $idcateg = (int) $idcateg;
    $begin = (int) $begin;
    $nbperpage = (int) $nbperpage;
    $req = "SELECT a.idarticles, a.articles_title, LEFT(a.articles_text,300) AS articles_text, a.articles_date, u.idusers, u.users_name , 
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
    WHERE r.idrubriques= $idcateg    
GROUP BY a.idarticles
ORDER BY a.articles_date DESC
LIMIT $begin, $nbperpage;";
    $recup = mysqli_query($cdb,$req) or die(mysqli_error($cdb));
    // si au moins 1 résultat
    if(@mysqli_num_rows($recup)){
        // on utilise le fetch all car il peut y avoir plus d'un résultat
        return mysqli_fetch_all($recup,MYSQLI_ASSOC);
    }
    // no result
    return false;
}

// Charge les rubriques pour un article via l'id de l'article (la table many to many suffit pour cette requête)
function recupRubriquesByIdFromArticle($c,$idarticle){
    $idarticle = (int) $idarticle;
    $sql="SELECT r.idrubriques, r.rubriques_titre
FROM rubriques r
INNER JOIN articles_has_rubriques ha
	ON ha.rubriques_idrubriques = r.idrubriques
WHERE ha.articles_idarticles = $idarticle;";
    $request = mysqli_query($c,$sql) or die(mysqli_error($c));
    // si on a au moins une rubrique, on l'envoie (les) en tableau indexé contenant des tableaux associatifs
    return (mysqli_num_rows($request))? mysqli_fetch_all($request,MYSQLI_ASSOC):[];
}