<?php
// Dependencies
require_once "../model/articlesModel.php";
require_once "../model/usersModel.php";
require_once "../model/theimagesModel.php";
require_once "../model/rubriquesModel.php";



// on veut se déconnecter
if(isset($_GET['p'])&&$_GET['p']=="disconnect"){
    disconnectModel();
    header("Location: ./");
    exit;
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
    require_once "../view/admin/adminDetailArticleView.php";
    exit();

}

// on a cliqué sur créer un article

if(isset($_GET['p'])&&$_GET['p']=="create"){

    // si on a envoyé le formulaire (toutes les variables POST attendues existent)
    if(isset($_POST['articles_title'],$_POST['articles_text'],$_POST['idusers'])){

        //var_dump($_POST);
        //exit();

        // traitement des variables
        $titre= htmlspecialchars(strip_tags(trim($_POST['articles_title'])),ENT_QUOTES);
        // exception pour le strip_tags qui va accepter
        $texte= htmlspecialchars(strip_tags(trim($_POST['articles_text']),'<p><br><a><img><h4><h5><b><strong><i><ul><li>'),ENT_QUOTES);
        $idusers = (int) $_POST['idusers'];

        // si un des champs est vide (n'a pas réussi la validation des variables POST)
        if(empty($titre)||empty($texte)||empty($idusers)){
            $erreur = "Format des champs non valides";
        }else{
            // insertion d'article avec récupération de son id
            $insert = insertArticle($db,$titre,$texte,$idusers);

            // insertion réussie (un id et pas false)
            if($insert){

                // si on a coché au moins une rubrique (existence de idrubriques)
                if(isset($_POST['idrubriques'])){

                    insertLinkArticlesWithRubriques($db,$insert,$_POST['idrubriques']);

                }


                // si on veut y ajouter une image
                if(!empty($_FILES['theimages_name'])){
                    $upload = theimagesUpload($_FILES['theimages_name'],IMG_FORMAT,IMG_MAX_SIZE,IMG_UPLOAD_ORIGINAL,IMG_UPLOAD_MEDIUM,IMG_UPLOAD_SMALL,IMG_MEDIUM_WIDTH,IMG_MEDIUM_HEIGHT,IMG_SMALL_WIDTH,IMG_SMALL_HEIGHT,IMG_JPG_MEDIUM,IMG_JPG_SMALL);

                    // l'image a bien été envoyée, donc on obtient un tableau
                    if(is_array($upload)){
                        // on insert l'image (et on récupère l'id de l'image)
                        $idtheimages = theimagesInsert($db,$_POST['theimages_title'],$upload[0],$insert);

                    // en cas d'erreur (string)
                    }else{
                        $error = $upload;
                    }
                }
                header("Location: ./");
                exit;
            }else{

                $erreur ="Problème lors de l'insertion";
            }

        }
    }

    // on récupère tous les auteurs potentiels
    $recup_autors = AllUser($db);
    // on récupère toutes les rubriques potentielles
    $recup_categs = recupAllRubriques($db);

    require_once "../view/admin/adminInsertArticleView.php";
    //var_dump($_POST);
    exit();
}


// on a cliqué sur supprimer un article

if(isset($_GET['p'])&&$_GET['p']=="delete"){

    // si la variable d'id existe et est une chaîne de caractère ne contenant qu'un entier positif non signé
    if(isset($_GET['id'])&&ctype_digit($_GET['id'])){
        // conversion en numérique entier
        $id = (int) $_GET['id'];

        // on récupère l'article en question
        $recup =articleLoadFull($db,$id);

        // pas de récupération
        if(!$recup){
            $erreur = "Article introuvable";
        }else{
            $title = $recup["articles_title"];
            $author = $recup['users_name'];
            // on clique sur confirmation de suppression
            if(isset($_GET['ok'])){
                // on tente de supprimer l'article
                if(deleteArticle($db,$id)){
                    $erreur="Suppression effectuée, vous allez être rédirigé dans 5 secondes <script>setTimeout(function(){ document.location.href = './' }, 5000);</script>";
                }else{
                    $erreur="Echec de la suppression, erreur inconnue, Veuillez recommencer!";
                }
            }

        }


    }else{
        $erreur = "Format de l'id non valable";
    }


    require_once "../view/admin/adminDeleteArticleView.php";
    //var_dump($_POST);
    exit();
}

// on a cliqué sur mettre à jour un article

if(isset($_GET['p'])&&$_GET['p']=="update"){


    // si la variable d'id existe et est une chaîne de caractère ne contenant qu'un entier positif non signé
    if(isset($_GET['id'])&&ctype_digit($_GET['id'])){
        // conversion en numérique entier
        $id = (int) $_GET['id'];

        // si on clique pour supprimer une image
        if(isset($_GET['delIMG'])&&ctype_digit($_GET['delIMG'])){
            // on supprime l'image de la DB
            $deleteIMG = theimagesDelete($db,$_GET['delIMG'],$_GET['name']);

            // si la suppression de la DB a fonctionnée
            if($deleteIMG){
                // on supprime physiquement les images
                theimagesUnlink([IMG_UPLOAD_ORIGINAL,IMG_UPLOAD_MEDIUM,IMG_UPLOAD_SMALL],$_GET['name']);
            }
            header("Location: ?p=update&id=$id");
            exit();
        }


        // si le formualaire est envoyé
        if(isset($_POST['users_idusers'])){

            //var_dump($_POST);
            $update = updateArticle($db,$_POST,$id);

            // si l'update a eu lieue
            if($update){
                // Pour les rubriques, lors d'un update, on supprime toujours les rubriques pour l'article, elles seront remplacées ci-dessous par les nouvelles rubriques
                deleteLinkArticlesWithRubriques($db,$id);

                    // Si il existe au moins une rubrique cochée
                    if(isset($_POST['idrubriques'])) {
                        // ajout de toutes les rubriques
                        insertLinkArticlesWithRubriques($db, $id,$_POST['idrubriques']);
                    }
                // si on veut y ajouter une image
                if(!empty($_FILES['theimages_name'])){
                    $upload = theimagesUpload($_FILES['theimages_name'],IMG_FORMAT,IMG_MAX_SIZE,IMG_UPLOAD_ORIGINAL,IMG_UPLOAD_MEDIUM,IMG_UPLOAD_SMALL,IMG_MEDIUM_WIDTH,IMG_MEDIUM_HEIGHT,IMG_SMALL_WIDTH,IMG_SMALL_HEIGHT,IMG_JPG_MEDIUM,IMG_JPG_SMALL);

                    // l'image a bien été envoyée
                    if(is_array($upload)){
                        // on insert l'image (et on récupère l'id de l'image)
                        $idtheimages = theimagesInsert($db,$_POST['theimages_title'],$upload[0],$update);

                    }else{
                        $error = $upload;
                    }
                }
                header("Location: ./?detailArticle=$id");
                exit();
            }
            $erreur = $update;

        }


        // chargement pour la vue

        // on récupère l'article en question avec ses images
        $recupArticle = articleLoadFull($db,$id);
        // on récupères les rubriques dont l'article fait partie
        $recupRubrique = recupRubriquesByIdFromArticle($db,$id);
        // on récupère tous les auteurs
        $recupUsers = AllUser($db);
        // on récupère toutes les rubriques potentielles
        $recupCategs = recupAllRubriques($db);


    }else{
        $erreur = "Format de l'id non valable";
    }


    require_once "../view/admin/adminUpdateArticleView.php";
    //var_dump($_POST);
    exit();
}


// accueil de l'admin

// Mise en place de la pagination


if(isset($_GET['pg'])){
    $pgactu = (int) $_GET['pg'];
    if(!$pgactu) $pgactu=1;
}else{
    $pgactu = 1;
}
// calcul pour la requête - nombre d'articles totaux, sans erreurs SQL ce sera toujours un int, de 0 à ...
$nbTotalArticles = countAllArticles($db);


// Calcul pour avoir la première partie du LIMIT *, 10 dans la requête stockée dans articlesModel.php nommée articlesLoadResumePagination()
$debut_tab = ($pgactu-1)*NUMBER_ARTICLE_PER_PAGE_ADMIN;

// requête avec le LIMIT appliqué pour récupérer tous les articles
$recupPagination = articlesLoadResumePagination($db,$debut_tab,NUMBER_ARTICLE_PER_PAGE_ADMIN);

// pas d'articles
if(!$recupPagination){
    $erreur = "Pas encore d'article";
}else {
    // nous avons des articles, création de la pagination si nécessaire
    $pagination = paginationModel($nbTotalArticles, $pgactu, NUMBER_ARTICLE_PER_PAGE_ADMIN);
}

// Default View
require_once "../view/admin/adminIndexView.php";