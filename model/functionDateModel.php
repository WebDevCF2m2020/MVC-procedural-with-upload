<?php
// mettre la date du format datetime vers un format français
// Argument, un datetime : 2020-09-27 19:26:30
// résultat de la fonction : Le dimanche 27 septembre 2020 à 19h26
function functionDateModel($ladate){
    $string = "le ";
    // convert to unix time
    $timeUnix = strtotime($ladate);

    // transtypage error
    if(!$timeUnix) return "unknow date error";

    // index array with day in french 0->6 US week
    $tab_jour = ["dimanche","lundi","mardi","mercredi","jeudi","vendredi","samedi"];

    // day's of the week (0=>sunday, 1=>monday) 0-6
    $string.= $tab_jour[date("w",$timeUnix)];

    // day of de month 1-31
    $string.= " ".date("d",$timeUnix);

    // index array with month in french (0->11)
    $tab_mois = ['janvier', 'février', 'mars', 'avril', 'mai', 'juin', 'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre'];

    // month of de year - 1 (1->12) => -1
    $string .= " ".$tab_mois[date("n",$timeUnix)-1];

    // year ****
    $string .= " ".date("Y",$timeUnix);
    $string .=" à ";
    // H : heure \h => (\ permet de ne pas interpréter le caractère qui suit: h (il va l'afficher sans interprétation), i => minutes
    $string .= date("H\hi",$timeUnix);

    return $string;
}