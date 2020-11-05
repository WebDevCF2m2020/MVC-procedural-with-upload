<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Notre article : <?= (isset($erreur)) ? $erreur : $recup['articles_title'] ?></title>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="css/custom.min.css" media="screen">
    <link rel="stylesheet" href="css/lightbox.min.css" media="screen">
    <link rel="shortcut icon" href="/img/favicon.ico">
</head>
<body id="page-top">
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
                foreach ($recAllRubriques as $itemMenu):
                    ?>
                    <li class="nav-item">
                        <a class="nav-link"
                           href="?rubrique=<?= $itemMenu['idrubriques'] ?>"><?= $itemMenu['rubriques_titre'] ?></a>
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
            <div class="col-lg-12 mx-auto">
                <?php
                if (isset($erreur)):
                    ?>

                    <h1><?= $erreur ?></h1>
                    <p class="lead"><a href="./">Retournez à l'accueil</a></p>

                <?php
                else:
                    ?>
                    <h2>Notre article : <?= $recup['articles_title'] ?></h2>
                    <p class="lead"><a href="./">Retournez à l'accueil</a></p>
                    <p>
                        <?php
                        if (!empty($recup["theimages_name"])):
                            $arrayImgName = explode("|||", $recup["theimages_name"]);
                            $arrayImgTitle = explode("|||", $recup["theimages_title"]);
                            $i = 0;
                            foreach ($arrayImgName as $img):
                                ?>
                                <a href='<?=IMG_UPLOAD_MEDIUM . $img?>' data-lightbox="example-set-<?=$recup["idarticles"]?>" title="<?= $arrayImgTitle[$i] ?>"><img src="<?= IMG_UPLOAD_SMALL . $img ?>" alt="<?= $arrayImgTitle[$i] ?>"/></a>
                                <?php
                                $i++;
                            endforeach;
                        endif;
                        ?>
                        <h5>
                        <?php
                        foreach (recupRubriquesByIdFromArticle($db,$idArticles) AS $rub):
                            //var_dump($rub);
                        ?>

                        <a href="?rubrique=<?=$rub['idrubriques']?>"><?=$rub['rubriques_titre']?></a> |
                        <?php
                        endforeach;
                        ?>
                        </h5>
                    </p>
                    <p><?= nl2br($recup["articles_text"]) ?></p>
                    <h5>Par <?= $recup["users_name"] ?> <?= functionDateModel($recup["articles_date"]) ?></h5>


                <?php

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