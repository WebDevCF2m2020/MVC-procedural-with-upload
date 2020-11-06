<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Mettre à jour un article</title>
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
                <h2>Mettre à jour un article</h2>
                <p class="lead"><a href="./">Retournez à l'accueil de l'admin</a></p>
                <?php
                if (isset($erreur)):
                    ?>

                    <h2><?= $erreur ?></h2>


                <?php
                else:
                    // var_dump($recupArticle,$recupUsers);
                endif;
                ?>
                <hr>
                <p>

                    <?php
                    if(!empty($recupArticle["theimages_name"])):
                        echo "<h3>Supprimer une photo liée à l'article</h3><p class=\"lead\">En cliquant simplement dessus</p>";
                        $arrayImgName = explode("|||", $recupArticle["theimages_name"]);
                        $arrayImgTitle = explode("|||", $recupArticle["theimages_title"]);
                        $arrayImgID = explode(",", $recupArticle["idtheimages"]);
                        $i=0;
                        foreach($arrayImgName AS $img):
                            ?>
                            <a href="?p=update&id=<?= $recupArticle['idarticles'] ?>&delIMG=<?=$arrayImgID[$i]?>&name=<?=$img?>"  title="DELETE"><img src="<?=IMG_UPLOAD_SMALL.$img?>" alt="<?=$arrayImgTitle[$i]?>"/></a>
                            <?php
                            $i++;
                        endforeach;
                    endif;
                    ?>
                </p>
                <form action="" enctype="multipart/form-data" name="insertion" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Votre titre :</label>
                        <input name="articles_title" type="text" class="form-control" placeholder="Votre titre"
                               value="<?= $recupArticle['articles_title'] ?>" required>

                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Votre texte</label>
                        <textarea name="articles_text" class="form-control" placeholder="Votre texte"
                                  required><?= $recupArticle['articles_text'] ?></textarea>
                    </div>
                    <div class="form-group row">
                        <label for="example-date-input" class="col-2 col-form-label">Date</label>
                        <div class="col-10">
                            <input name="articles_date" class="form-control" type="text"
                                   value="<?= $recupArticle['articles_date'] ?>" id="example-date-input">
                        </div>
                    </div>
                    <!-- champs caché utile pour l'id -->
                    <input type="hidden" name="idarticles" value="<?= $recupArticle['idarticles'] ?>">
                    <div class="form-group">
                        <label for="exampleInputPassword1">Choix de l'auteur</label>
                        <?php
                        foreach ($recupUsers as $item):
                            // ternaire qui vérifie la récupération de l'idusers de 2 requêtes différentes: $recupArticles et comparaison avec celui de $recupUsers - permet de choisir l'auteur d'origine de l'article
                            $choice = ($item['idusers'] == $recupArticle['users_idusers']) ? "checked" : "";
                            ?>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="users_idusers" id="exampleRadios1"
                                       value="<?= $item['idusers'] ?>" required <?= $choice ?>>
                                <label class="form-check-label" for="exampleRadios1">
                                    <?= $item['users_name'] ?>
                                </label>
                            </div>

                        <?php
                        endforeach;
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword5">Choix des rubriques</label>
                        <?php
                        // var_dump($recupRubrique);
                        foreach ($recupCategs as $item):

                            ?>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" name="idrubriques[]" id="exampleRadios5"
                                       value="<?= $item['idrubriques'] ?>" <?php
                                // boucle pour la correspondance entre les rubriques liées à l'article
                                foreach ($recupRubrique as $rub):
                                    // ternaire pour cocher les rubriques par défaut de l'article
                                    echo ($item['idrubriques']==$rub['idrubriques'])? "checked":"";
                                endforeach;

                                ?>>
                                <label class="form-check-label" for="exampleRadios5">
                                    <?= $item['rubriques_titre'] ?>
                                </label>
                            </div>

                        <?php
                        endforeach;
                        ?>
                    </div>
                    <button type="submit" class="btn btn-primary">Mettre à jour</button>
                    <hr>
                    <h3>Ajouter une image</h3>
                    <div class="form-group">
                        <label=>Description de l'image</label>
                        <input name="theimages_title" class="form-control" placeholder="Votre texte" >
                    </div>
                    <div class="form-group">
                        <label=>Votre image :</label>
                        <input name="theimages_name" type="file" class="form-control" placeholder="Votre image" >
                    </div>
                </form>
            </div>

        </div>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/lightbox.js"></script>
</body>
</html>