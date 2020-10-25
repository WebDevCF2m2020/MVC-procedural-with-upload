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
    }
}

/*
 * Upload Images functions
 */
function theimagesUpload(Array $fichier) {
    // si pas d'erreurs
    if ($fichier['error'] == 0) {
        // on prend l'extension
        $extend = theimagesVerifExtend($fichier['name']);
        // si extension valide
        if ($extend) {
            // on prend la taille
            $taille = theimagesVerifSize($fichier['size']);
            // si le fichier n'est pas trop grand
            if ($taille) {
                // création du nouveau nom de fichier
                $nouveauNomFichier = theimagesNewName($extend);
                // on essaye d'envoyer physiquement le fichier
                if (move_uploaded_file($fichier['tmp_name'], IMG_UPLOAD_ORIGINAL . $nouveauNomFichier)) {
                    return [$nouveauNomFichier];
                } else {
                    return "Erreur inconnue lors du transfert";
                }
            } else {
                return "Fichier trop lourd! $taille sur " . IMG_MAX_SIZE . " autorisée!";
            }
        } else {
            return "Extension non valide";
        }
    } else {
        return "Erreur inconnue lors du transfert";
    }
}

function theimagesVerifExtend($nomOrigine) {
    $string = strrchr($nomOrigine, "."); // on récupère l'extension avec le dernier .
    $ext = strtolower($string); // on met la chaine en minuscule
    // si l'extension est dans le tableau
    if (in_array($ext, IMG_FORMAT)) {
        return $ext;
    } else {
        return false;
    }
}

function theimagesVerifSize($taille) {;
    if ($taille > IMG_MAX_SIZE) {
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
/*
function theimagesMakeResize($largeurOri, $hauteurOri, $largeurMax, $hauteurMax, $qualityJpg) {

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
    if ($this->extFichier == ".jpg" || $this->extFichier == ".jpeg") {
        // en jpg
        $copie = imagecreatefromjpeg($this->chemin . "original/" . $this->nouveauNomFichier);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0, 0, 0, 0, $largeurFinal, $hauteurFinal, $largeurOri, $hauteurOri);
        // on finalise le fichier jpg
        imagejpeg($newImg, $this->chemin . "resize/" . $this->nouveauNomFichier, $qualityJpg);
    } elseif ($this->extFichier == ".png") {
        // en png
        $copie = imagecreatefrompng($this->chemin . "original/" . $this->nouveauNomFichier);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0, 0, 0, 0, $largeurFinal, $hauteurFinal, $largeurOri, $hauteurOri);
        // on finalise le fichier png
        imagepng($newImg, $this->chemin . "resize/" . $this->nouveauNomFichier);
    } else {
        // en gif
        $copie = imagecreatefromgif($this->chemin . "original/" . $this->nouveauNomFichier);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0, 0, 0, 0, $largeurFinal, $hauteurFinal, $largeurOri, $hauteurOri);
        // on finalise le fichier png
        imagegif($newImg, $this->chemin . "resize/" . $this->nouveauNomFichier);
    }
}

function theimagesMakeThumbs($LO, $HO, $finalpx, $qjpg) {
    // création du fichier vierge aux tailles finales
    $newImg = imagecreatetruecolor($finalpx, $finalpx);



    // calcul pour garder les proportions
    $thumb_width = $finalpx;
    $thumb_height = $finalpx;

    $width = $LO;
    $height = $HO;

    $original_aspect = $width / $height;
    $thumb_aspect = $thumb_width / $thumb_height;

    if ($original_aspect >= $thumb_aspect) {

        $new_height = $thumb_height;
        $new_width = $width / ($height / $thumb_height);
    } else {

        $new_width = $thumb_width;
        $new_height = $height / ($width / $thumb_width);
    }


    // on va copier l'image originale suivant son extension
    if ($this->extFichier == ".jpg" || $this->extFichier == ".jpeg") {
        // en jpg
        $copie = imagecreatefromjpeg($this->chemin . "original/" . $this->nouveauNomFichier);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0 - ($new_width - $thumb_width) / 2, 0 - ($new_height - $thumb_height) / 2, 0, 0, $new_width, $new_height, $width, $height);
        // on finalise le fichier jpg
        imagejpeg($newImg, $this->chemin . "thumbs/" . $this->nouveauNomFichier, $qjpg);
    } elseif ($this->extFichier == ".png") {
        // en png
        $copie = imagecreatefrompng($this->chemin . "original/" . $this->nouveauNomFichier);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0 - ($new_width - $thumb_width) / 2, 0 - ($new_height - $thumb_height) / 2, 0, 0, $new_width, $new_height, $width, $height);
        // on finalise le fichier png
        imagepng($newImg, $this->chemin . "thumbs/" . $this->nouveauNomFichier);
    } else {
        // en gif
        $copie = imagecreatefromgif($this->chemin . "original/" . $this->nouveauNomFichier);
        // on adapte l'image au bon format, puis on colle
        imagecopyresampled($newImg, $copie, 0 - ($new_width - $thumb_width) / 2, 0 - ($new_height - $thumb_height) / 2, 0, 0, $new_width, $new_height, $width, $height);
        // on finalise le fichier png
        imagegif($newImg, $this->chemin . "thumbs/" . $this->nouveauNomFichier);
    }
}
*/