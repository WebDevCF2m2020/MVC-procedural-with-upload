<?php
// Sélection de tous les sections pour le menu (et pour d'autres cas)
function recupAllRubriques($connect){
    $sql="SELECT * FROM rubriques;";
    $request = mysqli_query($connect,$sql) or die(mysqli_error($connect));
    // si on a au moins un résultat
    if(mysqli_num_rows($request)){
        // retourne un tableau indexé contenant des tableaux associatifs
        return mysqli_fetch_all($request,MYSQLI_ASSOC);
    }else{
        // tableau vide
        return [];
    }
}