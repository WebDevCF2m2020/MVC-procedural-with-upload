<?php
// Dependencies
require_once "../model/articlesModel.php";
require_once "../model/usersModel.php";
require_once "../model/theimagesModel.php";
require_once "../model/rubriquesModel.php";

// récupération des catégories utiles pour les 3 vues
$recAllRubriques = recupAllRubriques($db);

// si on essaye de se connecter
if (isset($_GET['p']) && $_GET['p'] == "connect") {

    // si le formulaire est envoyé
    if (isset($_POST['users_name'], $_POST['users_pwd'])) {
        // traitement des données
        $thename = htmlspecialchars(strip_tags(trim($_POST['users_name'])), ENT_QUOTES);
        $thepwd = htmlspecialchars(strip_tags(trim($_POST['users_pwd'])), ENT_QUOTES);

        $connect = connectUser($db, $thename, $thepwd);

        // connexion réussie
        if ($connect) {

            // création de la session
            //var_dump($connect);
            $_SESSION = $connect; // on mets les variables récupérées via SQL de type tableau associatif dans le tableau de session
            $_SESSION['identifiant'] = session_id();
            //var_dump($_SESSION);

            // redirection
            header("Location: ./");
            exit();

        } else {
            $erreur = "Login ou mot de passe incorrecte";
        }


    }

    //var_dump($_POST);
    // view
    require_once "../view/public/connectView.php";
    exit();
}

// si on est sur le détail d'un article
if (isset($_GET["detailArticle"])) {
    // conversion en int, vaut 0 si la conversion échoue
    $idArticles = (int)$_GET["detailArticle"];
    // si la convertion échoue redirection sur l'accueil
    if (!$idArticles) {
        header("Location: ./");
        exit();
    }
    // appel de la fonction du modèle articlesModel.php
    $recup = articleLoadFull($db, $idArticles);

    // pas d'article, la page n'existe pas
    if (!$recup) {
        $erreur = "Cet article n'existe plus";
    }

    // view
    require_once "../view/public/detailArticleView.php";
    exit();

}

// Page d'accueil d'une rubrique

if (isset($_GET['rubrique']) && ctype_digit($_GET['rubrique'])) {
    // de string contenant un entier vers integer
    $idrubriques = (int)$_GET['rubrique'];

    // appel des détails de la rubrique
    $recupRubriques = recupRubriquesById($db, $idrubriques);
    //var_dump($recupRubriques);

    if (empty($recupRubriques)) $erreur = "Cette rubrique n'existe plus";

    $nbTotalArticles = recupArticlesByIdFromRubriques($db, $idrubriques);

    // existence de la variable get "pg" | toujours 1 par défaut
    if (isset($_GET['pg'])) {
        $pgactu = (int)$_GET['pg'];
        // si la conversion échoue ($pgactu===0)
        if (!$pgactu) $pgactu = 1;
    } else {
        $pgactu = 1;
    }
    $debut_tab = ($pgactu - 1) * NUMBER_ARTICLE_PER_PAGE;
    // requête avec le LIMIT appliqué
    $recupPagination = articlesLoadResumePaginationByIdRubriques($db, $idrubriques, $debut_tab, NUMBER_ARTICLE_PER_PAGE);

// pas d'articles
    if (!$recupPagination) {
        $erreur = "Pas encore d'article";
    } else {
        // nous avons des articles, création de la pagination si nécessaire
        $pagination = paginationModel($nbTotalArticles, $pgactu, NUMBER_ARTICLE_PER_PAGE, "rubrique=$idrubriques");
    }
    // view
    require_once "../view/public/rubriquesView.php";
    exit();
}

// Page d'accueil

// Mise en place de la pagination

// existence de la variable get "pg" | toujours 1 par défaut
if (isset($_GET['pg'])) {
    $pgactu = (int)$_GET['pg'];
    // si la conversion échoue ($pgactu===0)
    if (!$pgactu) $pgactu = 1;
} else {
    $pgactu = 1;
}
// calcul pour la requête - nombre d'articles totaux, sans erreurs SQL ce sera toujours un int, de 0 à ...
$nbTotalArticles = countAllArticles($db);

// Calcul pour avoir la première partie du LIMIT *, 5 dans la requête stockée dans articlesModel.php nommée articlesLoadResumePagination()
$debut_tab = ($pgactu - 1) * NUMBER_ARTICLE_PER_PAGE;

// requête avec le LIMIT appliqué
$recupPagination = articlesLoadResumePagination($db, $debut_tab, NUMBER_ARTICLE_PER_PAGE);

/* On décide de ne pas traiter les articles dans la vue, mais ici dans le contrôleur -
J'éviterais cette méthode pour 2 raisons: la lisibilité du code, et surtout l'impossibilité au designer de traiter l'html dans la vue
Sinon cette méthode est aussi rapide que celle de detailArticles
*/

$sortie = "";
// tant que nous avons des articles
foreach ($recupPagination as $item):

    $sortie .="<h4><a href=\"?detailArticle={$item["idarticles"]}\">{$item["articles_title"]}</h4></a><p>";
        if (!empty($item["theimages_name"])):
            $arrayImgName = explode("|||", $item["theimages_name"]);
            $arrayImgTitle = explode("|||", $item["theimages_title"]);
            $i = 0;
            foreach ($arrayImgName as $img):
                $sortie .="<a href='" .IMG_UPLOAD_MEDIUM . $img ."' data-lightbox=\"example-set-{$item["idarticles"]}\"><img src='" .IMG_UPLOAD_SMALL.$img ."' alt=\"$arrayImgTitle[$i]\" /></a>";
                $i++;
            endforeach;
        endif;

    $sortie .="</p><h5>";
    foreach (recupRubriquesByIdFromArticle($db,$item["idarticles"]) AS $rub):
        $sortie .= "<a href='?rubrique={$rub['idrubriques']}'>{$rub['rubriques_titre']}</a> | ";
    endforeach;
    $sortie .="</h5>
    <p>".cutTheTextModel($item["articles_text"])." ... <a
                href='?detailArticle={$item["idarticles"]}'>Lire la suite</a></p>
    <h5>Par ". $item["users_name"] ." ". functionDateModel($item["articles_date"])."</h5>
    <hr>";


endforeach;



// pas d'articles
if (!$recupPagination) {
    $erreur = "Pas encore d'article";
} else {
    // nous avons des articles, création de la pagination si nécessaire
    $pagination = paginationModel($nbTotalArticles, $pgactu, NUMBER_ARTICLE_PER_PAGE);
}

// view
require_once "../view/public/indexView.php";