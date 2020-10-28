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
// Sélection d'une section par son ID
function recupRubriquesById($connect,$id){
    $id = (int) $id;
    $sql="SELECT * FROM rubriques WHERE idrubriques=$id;";
    $request = mysqli_query($connect,$sql) or die(mysqli_error($connect));
    // si on a au moins un résultat
    if(mysqli_num_rows($request)){
        // retourne un tableau associatif si on a 1 résultat
        return mysqli_fetch_assoc($request);
    }else{
        // tableau vide
        return [];
    }
}
// Compte le nombre d'articles dans la rubrique/section par son ID
function recupArticlesByIdFromRubriques($connect,$id){
    $id = (int) $id;
    $sql="SELECT COUNT(a.idarticles) 
	FROM articles a 
    INNER JOIN articles_has_rubriques hr
		ON hr.articles_idarticles = a.idarticles
	INNER JOIN rubriques r
		ON hr.rubriques_idrubriques = r.idrubriques
    WHERE r.idrubriques=$id;";
    $request = mysqli_query($connect,$sql) or die(mysqli_error($connect));
    // si on a au moins un résultat
    if(mysqli_num_rows($request)){
        // retourne un tableau associatif si on a 1 résultat
        return mysqli_fetch_assoc($request);
    }else{
        // tableau vide
        return [];
    }
}