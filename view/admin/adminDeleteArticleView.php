<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Supprimer un article</title>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="css/custom.min.css" media="screen">
    <link rel="stylesheet" href="css/lightbox.min.css" media="screen">
    <link rel="shortcut icon" href="/img/favicon.ico">
</head>
<body id="page-top">
<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
    <div class="container">
        <a href=".." class="navbar-brand">Accueil</a>
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
                <h2>Supprimer un article</h2>
                <p class="lead"><a href="./">Retournez à l'accueil de l'admin</a></p>
                <?php
                if (isset($erreur)):
                    ?>

                    <h2><?= $erreur ?></h2>


                <?php
                else:
                    ?>
                    <h3>Voulez-vous vraiment supprimer: <br><br><?= $title ?><br><br> écrit par <br><br><?= $author ?>
                    </h3>
                    <a href="?p=delete&id=<?= $id ?>&ok">
                        <button type="button">Oui</button>
                    </a> |
                    <button type="button" onclick="history.go(-1);">Non</button>
                <?php
                endif;
                ?>
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