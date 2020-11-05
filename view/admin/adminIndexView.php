<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Accueil de l'administration</title>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="css/custom.min.css" media="screen">
    <link rel="stylesheet" href="css/lightbox.min.css" media="screen">
    <link rel="shortcut icon" href="/img/favicon.ico">
</head>
<body id="page-top">
<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
    <div class="container">
        <a href="./" class="navbar-brand">Accueil de l'administration</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="?p=create" title="Ajouter un article">Création d'un nouvel article</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="?p=disconnect">Déconnexion</a>
                </li>

            </ul>

        </div>
    </div>
</div>

<div class="container">

    <div class="page-header" id="banner">
        <div class="row">
            <div class="col-lg-12 mx-auto">
                <h1>Administration</h1>
                <p class="lead">Bienvenue <?= $_SESSION['users_name'] ?>, vous êtes <?= $_SESSION['permissions_name'] ?></p>
                <?php
                if (isset($erreur)):
                    ?>

                    <h1><?= $erreur ?></h1>

                <?php
                else:
                    ?>
                    <h2>Tous les articles</h2>
                    <p>Actions : <a href="?p=create" title="Ajouter un article"><img src="img/add.png" alt="add"/></a>
                    </p>
                    <p class="lead">Nombre d'articles: <?= $nbTotalArticles ?></p><hr>
                    <?php
                    // affichage de la pagination
                    echo $pagination."<hr>";
                    // tant que nous avons des articles
                    foreach ($recupPagination as $item):
                        ?>
                        <h3><a
                                    href="?detailArticle=<?= $item["idarticles"] ?>"><?= $item["articles_title"] ?></a></h3><p>
                        <?php
                        if(!empty($item["theimages_name"])):
                            $arrayImgName = explode("|||", $item["theimages_name"]);
                            $arrayImgTitle = explode("|||", $item["theimages_title"]);
                            $i=0;
                            foreach($arrayImgName AS $img):
                                ?>
                                <a href='<?=IMG_UPLOAD_MEDIUM . $img?>' data-lightbox="example-set-<?=$item["idarticles"]?>"><img src="<?=IMG_UPLOAD_SMALL.$img?>" alt="<?=$arrayImgTitle[$i]?>"/></a>
                                <?php
                                $i++;
                            endforeach;
                        endif;
                        ?>
                    </p>
                    <h5>
                        <?php
                        foreach (recupRubriquesByIdFromArticle($db,$item["idarticles"]) AS $rub):
                            //var_dump($rub);
                            ?>

                            <?=$rub['rubriques_titre']?> |
                        <?php
                        endforeach;
                        ?>
                    </h5>
                        <p>Actions : <a href="?p=update&id=<?= $item["idarticles"] ?>"
                                        title="Mettre à jour l'article"><img src="img/update.png" alt="update"/></a>
                            <a href="?p=delete&id=<?= $item["idarticles"] ?>" title="Supprimer l'article"><img
                                        src="img/delete.png" alt="delete"/></a></p>
                        <p><?= cutTheTextModel($item["articles_text"]) ?> ... <a
                                    href="?detailArticle=<?= $item["idarticles"] ?>">Lire la suite</a></p>
                        <h5>Par <?= $item["users_name"] ?> <?= functionDateModel($item["articles_date"]) ?></h5>
                        <hr>
                    <?php
                    endforeach;
                    echo $pagination;
                endif;

                ?>
                <hr>
                <a href="#page-top">Retour en haut</a>
                <hr>
            </div>

        </div>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/lightbox.js"></script>
</body>
</html>
