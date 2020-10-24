<?php
require_once "../config.php";

/*
 * pagination
 */

// variables de test, ici les pays pour item
$countries = array("Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe");

// nombre de pays
$nb_item = count($countries);

// existence de la variable get "pg" - Nous ne vérifions pas les paginations avec une autre variable GET ("page")
if(isset($_GET['pg'])){
    $pgactu = (int) $_GET['pg'];
}else{
    $pgactu = 1;
}

?>
<h3>Pays dans le tableau: <?=$nb_item?></h3> <hr>
<p>Exemple avec valeurs par défauts (10 items par page)</p>
<code>echo paginationModel($nb_item,$pgactu);</code><hr>
<p>
    <?php
    $debut_tab = ($pgactu-1)*10; // page 1 =>0, 2 =>10, 3 =>20
    $fin_tab = 10; // 10
    for($i=$debut_tab;$i<($debut_tab+$fin_tab);$i++){
        // si $i est plus grand ou égal au nombre de pays dans le tableau, on arrête la boucle
        if($i>=$nb_item) break;
        echo $countries[$i]." | ";
    }
    ?>
</p>
<?php
echo paginationModel($nb_item,$pgactu);
echo "<hr>";
echo paginationModel($nb_item,1,10,"","page");
echo "<hr>";
?>
    <h3>Pays dans le tableau: <?=$nb_item?></h3> <hr>
    <p>Exemple avec valeurs du fichier config.php (5 items par page)</p>
    <code>echo paginationModel($nb_item,$pgactu,NUMBER_ARTICLE_PER_PAGE,"section=jouets");</code><hr>
    <p>
        <?php
        $debut_tab = ($pgactu-1)*NUMBER_ARTICLE_PER_PAGE; // page 1 =>0, 2 =>5, 3 =>10
        $fin_tab = NUMBER_ARTICLE_PER_PAGE;// 5
        for($i=$debut_tab;$i<($debut_tab+$fin_tab);$i++){
            // si $i est plus grand ou égal au nombre de pays dans le tableau, on arrête la boucle
            if($i>=$nb_item) break;
            echo $countries[$i]." | ";
        }
        ?>
    </p>
<?php
echo paginationModel($nb_item,$pgactu,NUMBER_ARTICLE_PER_PAGE,"section=jouets");
echo "<hr>";

?>
    <h3>Pays dans le tableau: <?=$nb_item?></h3> <hr>
    <p>Exemple avec valeurs 100 par pages</p>
    <code>echo paginationModel($nb_item,$pgactu,100);</code><hr>
    <p>
        <?php
        $debut_tab = ($pgactu-1)*100; // page 1 =>0, 2 =>100, 3 =>200
        $fin_tab = 100;// 100
        for($i=$debut_tab;$i<($debut_tab+$fin_tab);$i++){
            // si $i est plus grand ou égal au nombre de pays dans le tableau, on arrête la boucle
            if($i>=$nb_item) break;
            echo $countries[$i]." | ";
        }
        ?>
    </p>
<?php
echo paginationModel($nb_item,$pgactu,100);
echo "<hr>";
echo paginationModel($nb_item,$pgactu,300);


function paginationModel($nb_tot_item,$current_page,$nb_per_page=10,$URL_VAR="",$name_get_pagination="pg"){

    // création de la variable de sortie
    $sortie="";

    // pour obtenir le nombre total de page, on divise le nombre total d'éléments affichables $nb_tot_item par le nombre d'éléments affichables par page, le tout arrondit à l'entier supérieur ceil()
    $nb_pages = ceil($nb_tot_item/$nb_per_page);

    // si on a qu'une seule page
    if($nb_pages<2){
        // on affiche une chaîne vide
        return $sortie;
    }

    $sortie.= "Page ";

    for($i=1;$i<=$nb_pages;$i++){
        // si on est sur la première page
        if($i==1){
            // si la première page est la page actuelle
            if($i==$current_page){
                $sortie .= "<< < ";
            // la première page n'est pas la page actuelle
            }else{
                // retour à la première ligne
                $sortie .= "<a href='?$URL_VAR&$name_get_pagination=$i'><<</a> ";
                // une page en arrière
                $sortie .= "<a href='?$URL_VAR&$name_get_pagination=".($current_page-1)."'><</a> ";
            }
        }
        // si on est sur la page actuelle, pas besoin de lien, sinon on en met un
        $sortie .= ($i==$current_page)
            ? "$i "
            : "<a href='?$URL_VAR&$name_get_pagination=$i'>$i</a> ";

        // si on est sur la dernière page
        if($nb_pages==$i){
            // si la page actuelle est la dernière page
            if($current_page==$i){
                $sortie.=" > >> ";
            }else{
                // page suivante
                $sortie.="<a href='?$URL_VAR&$name_get_pagination=".($current_page+1)."'>></a> ";
                // dernière page
                $sortie.="<a href='?$URL_VAR&$name_get_pagination=$i'>>></a> ";
            }
        }


    }
    return $sortie;
}