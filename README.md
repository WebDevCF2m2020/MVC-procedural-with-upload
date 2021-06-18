# MVC-procedural-with-upload

Ce site est un exemple de **MVC en PHP/MySQL procédural** d'une **administration** avec **Upload d'images redimensionnées** , en partant du dossier vu au cours se trouvant à cette adresse:


https://github.com/WebDevCF2m2020/revision-php-post-confinement/tree/master/07-crud-articles3

Il peut servir d'exemple pour les web developers 2020 du CF2m pour leur projet "Catalogue". Il sera ensuite converti en OO (orienté objet) sur une autre adresse de Github, comme exemple d'un site MVC/OO.

## Principe MVC
Le MVC choisi pour cet exemple est structuré tel que sur cette image:

![MVC](https://github.com/mikhawa/MVC-procedural-with-upload/raw/main/datas/MVC.png "MVC")

Les fonctions non liées à la base de données sont également créées dans les modèles.



## Pour commencer
- Installez la DB : datas/structure-donnees-mvc_proc_upload.sql (désactivez les clefs étrangères à l'importation)
- Renommez en local le fichier config.php.local en config.php

## Contrôleur frontal
Pour lancer le projet, vous devez impérativement partir du dossier public et utiliser le contrôleur frontal "index.php" :
    
    /public/index.php
    
## Connexion en tant qu'administrateur:
#### En construction - V1.0 fonctionnelle !
    Login : myNameIsAdmin
    PWD : myNameIsAdmin

### A tester à cette adresse:

https://mvc-procedural-with-upload.webdev-cf2m.be/
    
## Connexion en tant que rédacteur/éditeur:
#### A construire !
    Login : myNameIsEditor
    PWD : myNameIsEditor
    
## Connexion en tant que modérateur:
#### A construire !
    Login : myNameIsModerator
    PWD : myNameIsModerator    