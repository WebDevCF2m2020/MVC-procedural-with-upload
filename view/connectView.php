<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
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

                    <h1>Connexion</h1>
                    <h2> <?= $erreur ?></h2>
                    <p class="lead"><a href="./">Retournez à l'accueil</a></p>

                <?php
                endif;
                ?>

                <hr>

                <form action="" name="connection" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Votre login :</label>
                        <input name="thename" type="text" class="form-control" id="exampleInputEmail1"
                               aria-describedby="emailHelp" placeholder="Entrez votre login" required>

                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Mot de passe</label>
                        <input name="thepwd" type="password" class="form-control" id="exampleInputPassword1"
                               placeholder="Entrez votre mot de passe" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Envoyer</button>
                </form>

            </div>

        </div>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>