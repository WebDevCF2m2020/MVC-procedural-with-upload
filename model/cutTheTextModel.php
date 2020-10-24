<?php
// fonction qui nous retourne un texte ou un mot aurait pu être coupé en supprimant le dernier espace trouvé
function cutTheTextModel($text){
    // longueur du texte reçu
    $textLength = strlen($text);
    // on trouve le dernier espace dans ce $text
    $positionLastSpace = strrpos($text, " ");
    // on coupe la chaine avec ce dernier caractère
    $final = substr($text, 0,$positionLastSpace);
    return $final;
}