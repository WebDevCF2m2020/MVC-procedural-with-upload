<?php
// Dependencies
require_once "model/articlesModel.php";
require_once "model/usersModel.php";
require_once "model/cutTheTextModel.php";
require_once "model/paginationModel.php";
// disconnect
require_once "model/disconnectModel.php";

// on veut se déconnecter
if(isset($_GET['p'])&&$_GET['p']=="disconnect"){
    disconnectModel();
    header("Location: ./");
    exit;
}


// Default View
require_once "view/redacIndexView.php";;