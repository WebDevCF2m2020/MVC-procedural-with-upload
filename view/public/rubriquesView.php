<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Rubrique <?=(!empty($recupRubriques))? $recupRubriques['rubriques_titre'] : "inexistante" ?></title>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="css/custom.min.css" media="screen">
</head>
<body>
<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
    <div class="container">
        <a href="./" class="navbar-brand">Accueil</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav">

                <?php
                foreach($recAllRubriques AS $itemMenu):
                ?>
                <li class="nav-item">
                    <a class="nav-link" href="?rubrique=<?=$itemMenu['idrubriques']?>"><?=$itemMenu['rubriques_titre']?></a>
                </li>
                <?php
                endforeach;
                ?>

                <li class="nav-item">
                    <a class="nav-link" href="?p=connect">Connexion</a>
                </li>
            </ul>

        </div>
    </div>
</div>

<div class="container">

    <div class="page-header" id="banner">
        <div class="row">
            <div class="col-lg-8 col-md-7 col-sm-6">
                <?php
                if (isset($erreur)):
                    ?>

                    <h1><?= $erreur ?></h1>
                    <p class="lead"><a href="./">Retournez à l'accueil</a></p>

                <?php
                else:
                    ?>
                    <h1>Rubrique : <?=$recupRubriques['rubriques_titre']?></h1>
                    <p class="lead"><a href="./">Retournez à l'accueil</a></p>
                    <p class="lead">Nombre d'articles de cette rubrique : <?= $nbTotalArticles ?></p>
                    <?php
                    // affichage de la pagination
                    echo $pagination;
                    // tant que nous avons des articles
                    foreach ($recupPagination as $item):
                        ?>
                        <h4><?= $item["articles_title"] ?></h4><p>
                        <?php
                        if(!empty($item["theimages_name"])):
                            $arrayImgName = explode("|||", $item["theimages_name"]);
                            $arrayImgTitle = explode("|||", $item["theimages_title"]);
                            $i=0;
                            foreach($arrayImgName AS $img):
                        ?>
                        <img src="<?=IMG_UPLOAD_SMALL.$img?>" alt="<?=$arrayImgTitle[$i]?>"/>
                        <?php
                            $i++;
                            endforeach;
                        endif;
                        ?>
                        </p><p><?= cutTheTextModel($item["articles_text"]) ?> ... <a
                                    href="?detailArticle=<?= $item["idarticles"] ?>">Lire la suite</a></p>
                        <h5>Par <?= $item["users_name"] ?> <?= functionDateModel($item["articles_date"]) ?></h5>
                        <hr>
                    <?php
                    endforeach;
                    echo $pagination;
                endif;

                ?>
            </div>

        </div>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>