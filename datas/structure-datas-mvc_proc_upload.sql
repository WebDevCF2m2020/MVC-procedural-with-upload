-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  Dim 25 oct. 2020 à 17:08
-- Version du serveur :  5.7.28
-- Version de PHP :  7.3.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données :  `mvc_proc_upload`
--
CREATE DATABASE IF NOT EXISTS `mvc_proc_upload` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mvc_proc_upload`;

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
                                          `idarticles` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                          `articles_title` varchar(150) NOT NULL,
                                          `articles_text` text NOT NULL,
                                          `articles_date` datetime DEFAULT CURRENT_TIMESTAMP,
                                          `users_idusers` int(10) UNSIGNED DEFAULT NULL,
                                          PRIMARY KEY (`idarticles`),
                                          UNIQUE KEY `titre_UNIQUE` (`articles_title`),
                                          KEY `fk_articles_users_idx` (`users_idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`idarticles`, `articles_title`, `articles_text`, `articles_date`, `users_idusers`) VALUES
(1, 'La disparition de Saint-Exupéry : la découverte de la gourmette', 'Antoine de Saint-Exupéry s&#039;est éteint brutalement le 31 juillet 1944, mais le mystère entourant sa disparition aura perduré pendant plus de cinquante ans, jusqu&#039;à ce que Jean-Claude Bianco, un pêcheur marseillais, retrouve sa gourmette. Une découverte inouïe faite au large des calanques.\r\n\r\nNous ne ferons jamais assez l&#039;éloge d&#039;Antoine de Saint-Exupéry, ce monument de la littérature française disparu bien trop tôt. Écrivain, mais également aviateur, ses histoires chargées d&#039;humanisme, inspirées par son amour pour l&#039;aviation, ont nourri l&#039;imagination des petits et des grands. Ses œuvres, comme Vol de nuit (1931) et Le Petit Prince (1943), ne connaissent pas de frontières : elles ont conquis le cœur du monde entier.\r\n\r\nMais à peine un an après la naissance du Petit Prince, l&#039;histoire prend un tournant tragique. Saint-Exupéry, alors pilote dans l&#039;armée de l&#039;air, disparaît subitement au cours d&#039;un vol de reconnaissance effectué dans le sud de la France. Il semble n&#039;avoir laissé aucune trace...\r\n\r\nLa découverte de la gourmette relance l&#039;enquête\r\nPar un jour de tempête, le 7 septembre 1998, un heureux hasard conduit Jean-Claude Bianco, patron pêcheur, à remonter dans ses filets un petit bijou en argent perdu en mer au large de Marseille. Ternie et abîmée, la gourmette s&#039;avère bien plus précieuse qu&#039;elle n&#039;en a l&#039;air puisqu&#039;elle appartient à Saint-Exupéry !\r\n\r\nLa découverte semble littéralement incroyable, au point que Jean-Claude Bianco sera d&#039;abord accusé de tromperie avant de connaître la célébrité. Pourtant, les inscriptions gravées sur la gourmette -- les noms de Saint-Exupéry et de sa femme ainsi que l&#039;adresse de son éditeur -- ne mentent pas. Les recherches de l&#039;épave menées par la Comex de Henri-Germain Delauze (que Jean-Claude Bianco avait contacté tout de suite) restent d&#039;abord sans succès. Le bijou mènera finalement le plongeur Luc Vanrell jusqu&#039;aux débris de l&#039;avion de Saint-Exupéry, qui reposaient dans les profondeurs sous-marines, attendant d&#039;être retrouvés.\r\n\r\nUne exposition au Musée archéologique de Saint-Raphaël\r\nGrâce à la découverte de la gourmette, le mystère de la disparition de l&#039;aviateur semble avoir trouvé un dénouement, mais son histoire continue de nous captiver. L&#039;authentique gourmette était au cœur d&#039;une exposition consacrée à Antoine de Saint-Exupéry, « Des nuages aux profondeurs », au Musée archéologique de Saint-Raphaël, du 2 février au 13 avril 2018.', '2020-10-24 16:45:49', 2),
(2, 'Face au virus, l’est de l’Asie réussit là où l’Europe échoue', 'Alors qu’on compte près de 23 300 cas par million d’habitants en Belgique, ce ratio est de 12 au Vietnam et 62 en Chine.\r\n\r\nPendant que l’Europe et l’Amérique luttent désespérément contre le coronavirus, l’est de l’Asie reste peu touché ; les nouveaux cas apparus cet été n’ont certainement pas atteint l’ampleur de la seconde vague qui déferle actuellement sur l’Europe. \r\n\r\nAlors qu’on compte, depuis le début de la pandémie, près de 23 300 cas par million d’habitants en Belgique, ce ratio est de 3 au Laos, 12 au Vietnam, 53 en Thaïlande, 62 en Chine, 498 en Corée du Sud, 748 au Japon, 1 350 en Indonésie - pour ne citer qu’eux -, selon les chiffres de l’Organisation mondiale de la santé (OMS). &quot;Dans l’ensemble, 1 % de tous les nouveaux cas et décès hebdomadaires ont été signalés dans la région du Pacifique occidental&quot; , relève l’OMS dans sa lettre épidémiologique hebdomadaire. \r\n\r\nUn pour cent seulement, dont la majorité a été enregistrée aux Philippines, en Malaisie et au Japon. La Chine, où le nouveau coronavirus avait fait son apparition à la fin de l’an dernier, se targue aujourd’hui d’avoir quasi éradiqué le virus sur son sol.', '2020-10-25 10:20:45', 1),
(3, 'Figuiers, kakis, nashi, aronia : ces espèces fruitières hors du commun et bien capables de s&#039;épanouir en Belgique', 'Le jardinier est de nature curieuse. Trouvailles et nouveautés sont des tentations auxquelles il résiste rarement. La pépinière Bois De Rode Bos avec sa sélection de fruits peu courants a tout pour le séduire.\r\nLe chemin parcouru par Pierre Barbieux pour aboutir à cette nouvelle pépinière à nulle autre pareille illustre les étonnants tours et détours de la vie. Son diplôme en relations publiques dans la poche, il parcourt d’abord la planète en tant que Web Designer. \r\n\r\nPuis revenu au pays, il crée, tandis qu’internet en est encore à ses balbutiements, un site de réservations d’hôtels. Une expérience formidable qui lui permet d’acquérir autonomie et liberté. Quand des soucis de santé l’obligent à rebattre les cartes, il prend conscience du lien essentiel qui existe entre bien-être et qualité de l’alimentation. \r\n\r\nIl se penche sur tout ce qui touche à la nutrition. Ce qui l’amène aux modes de cultures en général et plus précisément au travail d’Agricovert à Gembloux. Une coopérative engagée dans la défense d’une agriculture plus respectueuse des hommes et de l’environnement/', '2020-10-25 10:50:41', 3);

-- --------------------------------------------------------

--
-- Structure de la table `articles_has_rubriques`
--

DROP TABLE IF EXISTS `articles_has_rubriques`;
CREATE TABLE IF NOT EXISTS `articles_has_rubriques` (
                                                        `articles_idarticles` int(10) UNSIGNED NOT NULL,
                                                        `rubriques_idrubriques` int(10) UNSIGNED NOT NULL,
                                                        PRIMARY KEY (`articles_idarticles`,`rubriques_idrubriques`),
                                                        KEY `fk_articles_has_rubriques_rubriques1_idx` (`rubriques_idrubriques`),
                                                        KEY `fk_articles_has_rubriques_articles1_idx` (`articles_idarticles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `articles_has_theimages`
--

DROP TABLE IF EXISTS `articles_has_theimages`;
CREATE TABLE IF NOT EXISTS `articles_has_theimages` (
                                                        `articles_idarticles` int(10) UNSIGNED NOT NULL,
                                                        `theimages_idtheimages` int(10) UNSIGNED NOT NULL,
                                                        PRIMARY KEY (`articles_idarticles`,`theimages_idtheimages`),
                                                        KEY `fk_articles_has_theimages_theimages1_idx` (`theimages_idtheimages`),
                                                        KEY `fk_articles_has_theimages_articles1_idx` (`articles_idarticles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles_has_theimages`
--

INSERT INTO `articles_has_theimages` (`articles_idarticles`, `theimages_idtheimages`) VALUES
(3, 18),
(2, 19),
(2, 20);

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
                                             `idpermissions` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                             `permissions_name` varchar(100) NOT NULL,
                                             PRIMARY KEY (`idpermissions`),
                                             UNIQUE KEY `droit_name_UNIQUE` (`permissions_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`idpermissions`, `permissions_name`) VALUES
(1, 'Administrat.eur.trice'),
(3, 'Modérat.eur.rice'),
(2, 'Rédact.eur.rice');

-- --------------------------------------------------------

--
-- Structure de la table `rubriques`
--

DROP TABLE IF EXISTS `rubriques`;
CREATE TABLE IF NOT EXISTS `rubriques` (
                                           `idrubriques` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                           `rubriques_titre` varchar(120) NOT NULL,
                                           `rubriques_text` varchar(500) DEFAULT NULL,
                                           `rubriques_idrubriques` int(10) UNSIGNED DEFAULT '0',
                                           PRIMARY KEY (`idrubriques`),
                                           KEY `fk_rubriques_rubriques1_idx` (`rubriques_idrubriques`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `theimages`
--

DROP TABLE IF EXISTS `theimages`;
CREATE TABLE IF NOT EXISTS `theimages` (
                                           `idtheimages` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                           `theimages_title` varchar(150) DEFAULT NULL,
                                           `theimages_name` varchar(60) NOT NULL,
                                           PRIMARY KEY (`idtheimages`),
                                           UNIQUE KEY `theimages_name_UNIQUE` (`theimages_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `theimages`
--

INSERT INTO `theimages` (`idtheimages`, `theimages_title`, `theimages_name`) VALUES
(18, 'Le jardinier est de nature curieuse', '20201025160251-98998.png'),
(19, 'L&#039;Europe en difficult&eacute;', '20201025160453-43530.png'),
(20, 'L&#039;Asie s&#039;en sort bien', '20201025160511-74194.png');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
                                       `idusers` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                       `users_name` varchar(45) DEFAULT NULL,
                                       `users_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Le binaire permet au mot de passe d''être sensible à la casse (minuscule, majuscule)',
                                       `permissions_idpermissions` int(10) UNSIGNED DEFAULT NULL,
                                       PRIMARY KEY (`idusers`),
                                       UNIQUE KEY `users_name_UNIQUE` (`users_name`),
                                       KEY `fk_users_permissions_id` (`permissions_idpermissions`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idusers`, `users_name`, `users_pwd`, `permissions_idpermissions`) VALUES
(1, 'myNameIsAdmin', 'myNameIsAdmin', 1),
(2, 'myNameIsEditor', 'myNameIsEditor', 2),
(3, 'myNameIsModerator', 'myNameIsModerator', 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
    ADD CONSTRAINT `fk_articles_users` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `articles_has_rubriques`
--
ALTER TABLE `articles_has_rubriques`
    ADD CONSTRAINT `fk_articles_has_rubriques_articles1` FOREIGN KEY (`articles_idarticles`) REFERENCES `articles` (`idarticles`) ON DELETE CASCADE ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_articles_has_rubriques_rubriques1` FOREIGN KEY (`rubriques_idrubriques`) REFERENCES `rubriques` (`idrubriques`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `articles_has_theimages`
--
ALTER TABLE `articles_has_theimages`
    ADD CONSTRAINT `fk_articles_has_theimages_articles1` FOREIGN KEY (`articles_idarticles`) REFERENCES `articles` (`idarticles`) ON DELETE CASCADE ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_articles_has_theimages_theimages1` FOREIGN KEY (`theimages_idtheimages`) REFERENCES `theimages` (`idtheimages`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `rubriques`
--
ALTER TABLE `rubriques`
    ADD CONSTRAINT `fk_rubriques_rubriques1` FOREIGN KEY (`rubriques_idrubriques`) REFERENCES `rubriques` (`idrubriques`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
    ADD CONSTRAINT `fk_users_permission` FOREIGN KEY (`permissions_idpermissions`) REFERENCES `permissions` (`idpermissions`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
