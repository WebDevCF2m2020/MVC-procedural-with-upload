<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Nos articles</title>
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

                <?php
                else:
                    ?>
                    <h1>Tous nos articles</h1>
                    <p class="lead">Nombre d'articles: <?= $nbTotalArticles ?></p>
                    <?php
                    // affichage de la pagination
                    echo $pagination;
                    ?>
                    <hr>

<?=$sortie?>

                <?php
                endif;
                // affichage de la pagination
                echo $pagination;
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