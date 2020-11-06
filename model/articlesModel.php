<?php


// Count number of articles
function countAllArticles($c){
    // le count renvoie une ligne de résultat avec le nombre d'articles, utiliser la clef primaire permet d'éviter qu'il compte réellement le nombre d'articles: c'est un résultat se trouvant en début du code de la table (dans l'index)
    $req = "SELECT COUNT(idarticles) AS nb
FROM articles";
    $recup = mysqli_query($c,$req);
    $out = mysqli_fetch_assoc($recup);
    return $out["nb"];
}

// Load all articles with author and images (optionnal) but with 300 caracters from "texte" with pagination LIMIT
function articlesLoadResumePagination($cdb,$begin,$nbperpage=10){
    $begin = (int) $begin;
    $nbperpage = (int) $nbperpage;
    $req = "SELECT a.idarticles, a.articles_title, LEFT(a.articles_text,300) AS articles_text, a.articles_date, u.idusers, u.users_name , GROUP_CONCAT(t.theimages_title SEPARATOR '|||') AS theimages_title, GROUP_CONCAT(t.theimages_name SEPARATOR '|||') AS theimages_name
FROM articles a 
	INNER JOIN users u 
		ON a.users_idusers = u.idusers
    LEFT JOIN  articles_has_theimages hi 
        ON hi.articles_idarticles = a.idarticles
    LEFT JOIN theimages t 
        ON t.idtheimages = hi.theimages_idtheimages
GROUP BY a.idarticles
ORDER BY a.articles_date DESC 
LIMIT $begin, $nbperpage;";
    $recup = mysqli_query($cdb,$req);
    // si au moins 1 résultat
    if(@mysqli_num_rows($recup)){
        // on utilise le fetch all car il peut y avoir plus d'un résultat
        return mysqli_fetch_all($recup,MYSQLI_ASSOC);
    }
    // no result
    return false;
}

// LOAD full article, users and images (optionnal) with it's ID
function articleLoadFull($connect,$id){
    $id = (int) $id;
    $req = "SELECT a.idarticles, a.articles_title, a.articles_text, a.users_idusers, a.articles_date, u.idusers, u.users_name , GROUP_CONCAT(t.idtheimages) AS idtheimages, GROUP_CONCAT(t.theimages_title SEPARATOR '|||') AS theimages_title, GROUP_CONCAT(t.theimages_name SEPARATOR '|||') AS theimages_name 
    FROM articles a 
	INNER JOIN users u 
		ON a.users_idusers = u.idusers
    LEFT JOIN  articles_has_theimages hi 
        ON hi.articles_idarticles = a.idarticles
    LEFT JOIN theimages t 
        ON t.idtheimages = hi.theimages_idtheimages
WHERE a.idarticles=$id
GROUP BY a.idarticles
    ";
    $recup = mysqli_query($connect,$req);
    // si on a 1 résultat
    if(mysqli_num_rows($recup)){
        // on utilise le fetch all car il peut y avoir plus d'un résultat
        return mysqli_fetch_assoc($recup);
    }
    // no result
    return false;
}

// insertion d'un nouvel article
function insertArticle($c,$title,$text,$id){

    $sql="INSERT INTO articles (articles_title,articles_text,users_idusers) VALUES ('$title','$text',$id);";
    $request = mysqli_query($c,$sql) or die(mysqli_error($c));
    // si l'article est bien inséré, on renvoie son ID
    return ($request)? mysqli_insert_id($c) :false;
}

// insertion du lien avec les catégories dans articles_has_rubriques
function insertLinkArticlesWithRubriques($c,$idarticles,$tabIdRubriques){

    // préparation de notre requête SQL avant la boucle
    $sql = "INSERT INTO articles_has_rubriques (articles_idarticles,rubriques_idrubriques) VALUES ";
    // tant que l'on a des rubriques cochées
    foreach($tabIdRubriques AS $item){
        // on allonge notre requête SQL (évite des allez retour PHP/SQL)
        $sql .= "($idarticles,$item),";
    }
    // on retire la virgule de fin avec substr pour éviter une faute SQL (la virgule doit être suivie de valeurs)
    $sql = substr($sql,0,-1);
    $query = mysqli_query($c,$sql) or die(mysqli_error($c));
    return ($query)? true: false;
}

// suppression des liens avec les catégories dans articles_has_rubriques
function deleteLinkArticlesWithRubriques($c,$idarticles){
    $idarticles = (int) $idarticles;
    // préparation de notre requête SQL avant la boucle
    $sql = "DELETE FROM articles_has_rubriques WHERE articles_idarticles = $idarticles";

    $query = mysqli_query($c,$sql) or die(mysqli_error($c));
    return ($query)? true: false;
}

// suppression d'un article via son ID

function deleteArticle($connect,$id){
    $id = (int) $id;
    $sql="DELETE FROM articles WHERE idarticles=$id";
    return (@mysqli_query($connect,$sql))? true : false;
}

/*
 * mise à jour de l'article
 * $db -> connexion mysqli
 * $datas -> array de $_POST
 * $id -> variable GET idarticles
 */

function updateArticle($db,$datas,$id){
    // traîtement des variables
    // $_GET
    $id = (int) $id;
    // $_POST => on pourrait utiliser extract(), plus rapide mais dangereux et non sécurisé sans mettre les mêmes lignes que celles ci-dessous
    $idarticles = (int) $datas['idarticles'];
    $titre = htmlspecialchars(strip_tags(trim($datas['articles_title'])),ENT_QUOTES);
    // exception pour le strip_tags qui va accepter les balises html entre allowable_tags
    $texte= htmlspecialchars(strip_tags(trim($datas['articles_text']),'<p><br><a><img><h4><h5><b><strong><i><ul><li>'),ENT_QUOTES);
    $thedate = htmlspecialchars(strip_tags(trim($datas['articles_date'])),ENT_QUOTES);

    // on vérifie si la date valide existe dans la chaîne, si oui elle est mise dans $tab et séparée du reste
    $tab = preg_grep("/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/",[$thedate]);
    // si on ne la trouve pas, on met la date du jour
    if(empty($tab)) $thedate = date("Y-m-d H:i:s");


    $users_idusers = (int) $datas['users_idusers'];

    // quelqu'un essaie de modifier un autre article que celui affiché
    if($id!=$idarticles) return "Inutile d'essayer de supprimer un article de quelqu'un d'autre";

    if(empty($id)||empty($idarticles)||empty($titre)||
        empty($texte)||empty($thedate)||empty($users_idusers)) return "Vos champs ne sont pas correctement remplis";

    $sql ="UPDATE articles SET articles_title = '$titre', articles_text ='$texte',articles_date='$thedate', users_idusers= $users_idusers WHERE idarticles = $idarticles";

    $request = mysqli_query($db,$sql) or die(mysqli_error($c));
    return ($request)? $idarticles :false;


}
// mettre la date du format datetime vers un format français
// Argument, un datetime : 2020-09-27 19:26:30
// résultat de la fonction : Le dimanche 27 septembre 2020 à 19h26
function functionDateModel($ladate){
    $string = "le ";
    // convert to unix time
    $timeUnix = strtotime($ladate);

    // transtypage error
    if(!$timeUnix) return "unknow date error";

    // index array with day in french 0->6 US week
    $tab_jour = ["dimanche","lundi","mardi","mercredi","jeudi","vendredi","samedi"];

    // day's of the week (0=>sunday, 1=>monday) 0-6
    $string.= $tab_jour[date("w",$timeUnix)];

    // day of de month 1-31
    $string.= " ".date("d",$timeUnix);

    // index array with month in french (0->11)
    $tab_mois = ['janvier', 'février', 'mars', 'avril', 'mai', 'juin', 'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre'];

    // month of de year - 1 (1->12) => -1
    $string .= " ".$tab_mois[date("n",$timeUnix)-1];

    // year ****
    $string .= " ".date("Y",$timeUnix);
    $string .=" à ";
    // H : heure \h => (\ permet de ne pas interpréter le caractère qui suit: h (il va l'afficher sans interprétation), i => minutes
    $string .= date("H\hi",$timeUnix);

    return $string;
}

// fonction qui nous retourne un texte ou un mot aurait pu être coupé en supprimant le dernier espace trouvé
function cutTheTextModel($text){
    // longueur du texte reçu
    $textLength = strlen($text);
    // on trouve le dernier espace dans ce $text
    $positionLastSpace = strrpos($text, " ");
    // on coupe la chaine avec ce dernier caractère
    $final = substr($text, 0,$positionLastSpace);
    return $final;
}

/*
 * Utilisation :
 * @return String
 * @return error Empty'String
 * @params paginationModel(
 *      INT $nb_tot_item, // total's number of item
 *      INT $current_page, // current page (?pg=3)
 *      [INT]$nb_per_page=10, // numbers of item per page
 *      [STRING]$URL_VAR="", // other get's variables before pagination
 *      [STRING]$name_get_pagination="pg" // name of GET's variable for pagination
 * ): string
 */
function paginationModel($nb_tot_item,$current_page,$nb_per_page=10,$URL_VAR="",$name_get_pagination="pg"){

    // création de la variable de sortie
    $sortie="";

    // pour obtenir le nombre total de page, on divise le nombre total d'éléments affichables $nb_tot_item par le nombre d'éléments affichables par page, le tout arrondit à l'entier supérieur ceil()
    $nb_pages = ceil($nb_tot_item/$nb_per_page);

    // si on a qu'une seule page
    if($nb_pages<2){
        // on affiche une chaîne vide
        return $sortie;
    }

    $sortie.= "Page ";

    for($i=1;$i<=$nb_pages;$i++){
        // si on est sur la première page
        if($i==1){
            // si la première page est la page actuelle
            if($i==$current_page){
                $sortie .= "<< < ";
                // la première page n'est pas la page actuelle
            }else{
                // retour à la première ligne
                $sortie .= "<a href='?$URL_VAR&$name_get_pagination=$i'><<</a> ";
                // une page en arrière
                $sortie .= "<a href='?$URL_VAR&$name_get_pagination=".($current_page-1)."'><</a> ";
            }
        }
        // si on est sur la page actuelle, pas besoin de lien, sinon on en met un
        $sortie .= ($i==$current_page)
            ? "$i "
            : "<a href='?$URL_VAR&$name_get_pagination=$i'>$i</a> ";

        // si on est sur la dernière page
        if($nb_pages==$i){
            // si la page actuelle est la dernière page
            if($current_page==$i){
                $sortie.=" > >> ";
            }else{
                // page suivante
                $sortie.="<a href='?$URL_VAR&$name_get_pagination=".($current_page+1)."'>></a> ";
                // dernière page
                $sortie.="<a href='?$URL_VAR&$name_get_pagination=$i'>>></a> ";
            }
        }


    }
    return $sortie;
}