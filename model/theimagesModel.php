<?php
/*
 * CRUD theimages
 */

// INSERT INTO theimages
function theimagesInsert($c,$title,$name,$idarticles){
    $title = htmlentities(strip_tags(trim($title)),ENT_QUOTES);
    $name = htmlentities(strip_tags(trim($name)),ENT_QUOTES);
    $idarticles = (int) $idarticles;
    if(!empty($name)&&!empty($idarticles)){
        $sql = "INSERT INTO theimages (theimages_title,theimages_name) VALUES ('$title','$name');";
        $req = mysqli_query($c,$sql) or die(mysqli_error($c));
        if($req) {
            articles_has_theimagesInsert($c, $idarticles,mysqli_insert_id($c));
        }else {
            return false;
        }

    }
}

// INSERT INTO articles_has_theimages
function articles_has_theimagesInsert($c,$idarticles,$idtheimages){
    $idarticles = (int) $idarticles;
    $idtheimages = (int) $idtheimages;
    if(!empty($idtheimages)&&!empty($idarticles)){
        $sql = "INSERT INTO articles_has_theimages VALUES ($idarticles,$idtheimages);";
        $req = mysqli_query($c,$sql) or die(mysqli_error($c));
        return ($req)? true : false;
    }else{
        return false;
    }
}

// DELETE INTO theimages (the action off FK on DELETE articles_has_theimages is CASCADE) (and required deleteRealImages)
function theimagesDelete($c,$idtheimages,$theimages_name){
    $idtheimages = (int) $idtheimages;
    $theimages_name = htmlentities(strip_tags(trim($theimages_name)),ENT_QUOTES);
    if(!empty($idtheimages)&&!empty($theimages_name)){
        // suppression de la DB (FK )
        $sql = "DELETE FROM theimages WHERE idtheimages=$idtheimages AND theimages_name='$theimages_name';";
        $req = mysqli_query($c,$sql) or die(mysqli_error($c));

        return ($req)? true : false;
    }
}

/*
 * Upload Images functions
 *
 * @arg
 *
 * $fichier => array $_FILES -> form enctype="multipart/form-data"
 * $extension => array [".jpg",".png",...]
 * $sizeMax => int 50000 (bytes) max
 * $foldersOri => string path to original folder
 * $foldersMedium => string path to resize images
 * $foldersSmall => string path to crop images
 *
 * @optional
 *
 * $widthMedium => int max width in pixel for resize images
 * $heightMedium => int max height in pixel for resize images
 * $whidthSmall => int max width in pixel for crop images
 * $heightSmall => int max height in pixel for crop images
 * $qualityMedium => int compress jpg only (for resized images)
 * $qualitySmall => int compress jpg only (for cropped images)
 *
 * @return array | string
 *
 * require for use:
 * theimagesVerifExtend()
 * theimagesVerifSize()
 * theimagesNewName()
 * theimagesMakeResize()
 * theimagesMakeThumbs()
 *
 */
function theimagesUpload(Array $fichier,$extension,$sizeMax,$foldersOri, $foldersMedium,$foldersSmall,$widthMedium=600,$heightMedium=400,$whidthSmall=100,$heightSmall=100,$qualityMedium=90,$qualitySmall=80) {

    // si pas d'erreurs lors de l'upload
    if ($fichier['error'] == 0) {
        // on prend l'extension
        $extend = theimagesVerifExtend($fichier['name'],$extension);
        // si extension valide
        if ($extend) {
            // on prend la taille
            $taille = theimagesVerifSize($fichier['size'],$sizeMax);
            // si le fichier n'est pas trop grand
            if ($taille) {
                // on récupère largeur et hauteur
                $imgInfo = getimagesize($fichier['tmp_name']);
                // largeur en pixel de l'image d'origine
                $imgWidth = $imgInfo[0];
                // hauteur en pixel de l'image d'origine
                $imgHeight = $imgInfo[1];
                // création du nouveau nom de fichier
                $nouveauNomFichier = theimagesNewName($extend);
                // on essaye d'envoyer physiquement le fichier
                if (move_uploaded_file($fichier['tmp_name'], $foldersOri . $nouveauNomFichier)) {
                    // transformation vers medium en gardant les proportions
                    theimagesMakeResize($nouveauNomFichier,$imgWidth,$imgHeight,$extend,$foldersOri,$foldersMedium,$widthMedium,$heightMedium,$qualityMedium);
                    // transformation vers thumb
                    theimagesMakeThumbs($nouveauNomFichier,$imgWidth,$imgHeight,$extend,$foldersOri,$foldersSmall,$whidthSmall,$heightSmall,$qualitySmall);
                    // envoi le tableau avec le nom sous forme de tableau
                    return [$nouveauNomFichier,];
                } else {
                    return "Erreur inconnue lors du transfert";
                }
            } else {
                return "Fichier trop lourd! $taille sur " . $sizeMax . " autorisée!";
            }
        } else {
            return "Extension non valide";
        }
    } else {
        return "Erreur inconnue lors du transfert";
    }
}

function theimagesVerifExtend($nomOrigine,$format) {
    $string = strrchr($nomOrigine, "."); // on récupère l'extension avec le dernier .
    $ext = strtolower($string); // on met la chaine en minuscule
    // si l'extension est dans le tableau
    if (in_array($ext, $format)) {
        return $ext;
    } else {
        return false;
    }
}

function theimagesVerifSize($taille,$sizeMax) {;
    if ($taille > $sizeMax) {
        return false;
    } else {
        return $taille;
    }
}

function theimagesNewName($extend) {
    $sortie = date("YmdHis"); // format datetime sans séparateur
    $hasard = mt_rand(10000, 99999);
    return $sortie . "-" . $hasard . $extend;
}


// redimensionne l'image en gardant les proportions
function theimagesMakeResize($name, $largeurOri, $hauteurOri, $extension, $origin, $medium,  $largeurMax=800, $hauteurMax=600, $qualityJpg=90) {

    // si la largeur d'origine est plus petite que la largeur maximum et idem hauteur origine/hauteur maximum
    if ($largeurOri < $largeurMax && $hauteurOri < $hauteurMax) {
        $largeurFinal = $largeurOri;
        $hauteurFinal = $hauteurOri;
    } else {
        // si l'image est en paysage
        if ($largeurOri > $hauteurOri) {
            // pour obtenir le ratio (proportion)
            $proportion = $largeurMax / $largeurOri;
            // l'image est en mode portrait ou un carré
        } else {
            // pour obtenir le ratio (proportion)
            $proportion = $hauteurMax / $hauteurOri;
        }
        // mise en proportion de la largeur et hauteur finales
        $largeurFinal = round($largeurOri * $proportion);
        $hauteurFinal = round($hauteurOri * $proportion);
    }
    //var_dump($largeurFinal,$hauteurFinal);
    // création du fichier vierge aux tailles finales
    $newImg = imagecreatetruecolor($largeurFinal, $hauteurFinal);

    // on va copier l'image originale suivant son extension
    if ($extension == ".jpg" || $extension == ".jpeg") {
        // en jpg
        $copie = imagecreatefromjpeg($origin . $name);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0, 0, 0, 0, $largeurFinal, $hauteurFinal, $largeurOri, $hauteurOri);
        // on finalise le fichier jpg
        imagejpeg($newImg, $medium . $name, $qualityJpg);
    } elseif ($extension == ".png") {
        // en png
        $copie = imagecreatefrompng($origin . $name);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0, 0, 0, 0, $largeurFinal, $hauteurFinal, $largeurOri, $hauteurOri);
        // on finalise le fichier png
        imagepng($newImg, $medium . $name);
    } else {
        // en gif
        $copie = imagecreatefromgif($origin . $name);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0, 0, 0, 0, $largeurFinal, $hauteurFinal, $largeurOri, $hauteurOri);
        // on finalise le fichier png
        imagegif($newImg, $medium . $name);
    }
}

// redimensionne l'image en coupant pour obtenir une miniature centrée
function theimagesMakeThumbs($name, $largeurOri, $hauteurOri, $extension, $origin, $thumb,  $largeurMax=80, $hauteurMax=80, $qualityJpg=80) {
    // création du fichier vierge aux tailles finales
    $newImg = imagecreatetruecolor($largeurMax, $hauteurMax);

    // calcul pour garder les proportions
    $thumb_width = $largeurMax;
    $thumb_height = $hauteurMax;

    $width = $largeurOri;
    $height = $hauteurOri;

    $original_aspect = $width / $height;
    $thumb_aspect = $thumb_width / $thumb_height;

    // divisions pour trouver le point de départ en X ou en Y pour couper l'image au milieu, que ça soit en hauteur (paysage) ou en largeur (portrait)
    if ($original_aspect >= $thumb_aspect) {

        $new_height = $thumb_height;
        $new_width = $width / ($height / $thumb_height);
    } else {

        $new_width = $thumb_width;
        $new_height = $height / ($width / $thumb_width);
    }


    // on va copier l'image originale suivant son extension
    if ($extension == ".jpg" || $extension == ".jpeg") {
        // en jpg
        $copie = imagecreatefromjpeg($origin . $name);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0 - ($new_width - $thumb_width) / 2, 0 - ($new_height - $thumb_height) / 2, 0, 0, $new_width, $new_height, $width, $height);
        // on finalise le fichier jpg
        imagejpeg($newImg, $thumb . $name, $qualityJpg);
    } elseif ($extension == ".png") {
        // en png
        $copie = imagecreatefrompng($origin . $name);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0 - ($new_width - $thumb_width) / 2, 0 - ($new_height - $thumb_height) / 2, 0, 0, $new_width, $new_height, $width, $height);
        // on finalise le fichier png
        imagepng($newImg, $thumb . $name);
    } else {
        // en gif
        $copie = imagecreatefromgif($origin . $name);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0 - ($new_width - $thumb_width) / 2, 0 - ($new_height - $thumb_height) / 2, 0, 0, $new_width, $new_height, $width, $height);
        // on finalise le fichier png
        imagegif($newImg, $thumb . $name);
    }
}

// fonction pour supprimer physiquement des images
function theimagesUnlink(array $folder, string $imagesName){
    foreach ($folder as $dossier){
        unlink($dossier.$imagesName);
    }
    return true;
}

/*
 * END
 * Upload Images functions
 */