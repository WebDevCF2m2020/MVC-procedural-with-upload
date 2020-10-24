<?php
// Dependencies
require_once "../model/articlesModel.php";
require_once "../model/usersModel.php";
require_once "../model/functionDateModel.php";
require_once "../model/cutTheTextModel.php";
// Pagination
require_once "../model/paginationModel.php";

// si on essaye de se connecter
if(isset($_GET['p'])&&$_GET['p']=="connect"){

    // si le formulaire est envoyé
    if(isset($_POST['thename'],$_POST['thepwd'])){
        // traitement des données
        $thename = htmlspecialchars(strip_tags(trim($_POST['thename'])),ENT_QUOTES);
        $thepwd = htmlspecialchars(strip_tags(trim($_POST['thepwd'])),ENT_QUOTES);

        $connect = connectUser($db,$thename,$thepwd);

        // connexion réussie
        if($connect){

            // création de la session
            //var_dump($connect);
            $_SESSION = $connect; // on mets les variables récupérées via SQL de type tableau associatif dans le tableau de session
            $_SESSION['identifiant']=session_id();
            //var_dump($_SESSION);

            // redirection
            header("Location: ./");
            exit();

        }else{
            $erreur = "Login ou mot de passe incorrecte";
        }


    }

    //var_dump($_POST);
    // view
    require_once "../view/connectView.php";
    exit();
}

// si on est sur le détail d'un article
if(isset($_GET["detailArticle"])){
    // conversion en int, vaut 0 si la conversion échoue
    $idArticles = (int) $_GET["detailArticle"];
    // si la convertion échoue redirection sur l'accueil
    if(!$idArticles) {
        header("Location: ./");
        exit();
    }
    // appel de la fonction du modèle articlesModel.php
    $recup = articleLoadFull($db,$idArticles);

    // pas d'article, la page n'existe pas
    if(!$recup){
        $erreur = "Cet article n'existe plus";
    }

    // view
    require_once "../view/detailArticleView.php";
    exit();

}

// Page d'accueil

// Mise en place de la pagination

// existence de la variable get "pg" | toujours 1 par défaut
if(isset($_GET['pg'])){
    $pgactu = (int) $_GET['pg'];
    // si la conversion échoue ($pgactu===0)
    if(!$pgactu) $pgactu=1;
}else{
    $pgactu = 1;
}
// calcul pour la requête - nombre d'articles totaux, sans erreurs SQL ce sera toujours un int, de 0 à ...
$nbTotalArticles = countAllArticles($db);

// Calcul pour avoir la première partie du LIMIT *, 5 dans la requête stockée dans articlesModel.php nommée articlesLoadResumePagination()
$debut_tab = ($pgactu-1)*NUMBER_ARTICLE_PER_PAGE;

// requête avec le LIMIT appliqué
$recupPagination = articlesLoadResumePagination($db,$debut_tab,NUMBER_ARTICLE_PER_PAGE);

// pas d'articles
if(!$recupPagination){
    $erreur = "Pas encore d'article";
}else {
    // nous avons des articles, création de la pagination si nécessaire
    $pagination = paginationModel($nbTotalArticles, $pgactu, NUMBER_ARTICLE_PER_PAGE);
}

// view
require_once "../view/indexView.php";