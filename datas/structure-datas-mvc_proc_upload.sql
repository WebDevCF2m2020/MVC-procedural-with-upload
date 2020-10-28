-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  mer. 28 oct. 2020 à 09:34
-- Version du serveur :  8.0.18
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`idarticles`, `articles_title`, `articles_text`, `articles_date`, `users_idusers`) VALUES
(1, 'La disparition de Saint-Exupéry : la découverte de la gourmette', 'Antoine de Saint-Exupéry s&#039;est éteint brutalement le 31 juillet 1944, mais le mystère entourant sa disparition aura perduré pendant plus de cinquante ans, jusqu&#039;à ce que Jean-Claude Bianco, un pêcheur marseillais, retrouve sa gourmette. Une découverte inouïe faite au large des calanques.\r\n\r\nNous ne ferons jamais assez l&#039;éloge d&#039;Antoine de Saint-Exupéry, ce monument de la littérature française disparu bien trop tôt. Écrivain, mais également aviateur, ses histoires chargées d&#039;humanisme, inspirées par son amour pour l&#039;aviation, ont nourri l&#039;imagination des petits et des grands. Ses œuvres, comme Vol de nuit (1931) et Le Petit Prince (1943), ne connaissent pas de frontières : elles ont conquis le cœur du monde entier.\r\n\r\nMais à peine un an après la naissance du Petit Prince, l&#039;histoire prend un tournant tragique. Saint-Exupéry, alors pilote dans l&#039;armée de l&#039;air, disparaît subitement au cours d&#039;un vol de reconnaissance effectué dans le sud de la France. Il semble n&#039;avoir laissé aucune trace...\r\n\r\nLa découverte de la gourmette relance l&#039;enquête\r\nPar un jour de tempête, le 7 septembre 1998, un heureux hasard conduit Jean-Claude Bianco, patron pêcheur, à remonter dans ses filets un petit bijou en argent perdu en mer au large de Marseille. Ternie et abîmée, la gourmette s&#039;avère bien plus précieuse qu&#039;elle n&#039;en a l&#039;air puisqu&#039;elle appartient à Saint-Exupéry !\r\n\r\nLa découverte semble littéralement incroyable, au point que Jean-Claude Bianco sera d&#039;abord accusé de tromperie avant de connaître la célébrité. Pourtant, les inscriptions gravées sur la gourmette -- les noms de Saint-Exupéry et de sa femme ainsi que l&#039;adresse de son éditeur -- ne mentent pas. Les recherches de l&#039;épave menées par la Comex de Henri-Germain Delauze (que Jean-Claude Bianco avait contacté tout de suite) restent d&#039;abord sans succès. Le bijou mènera finalement le plongeur Luc Vanrell jusqu&#039;aux débris de l&#039;avion de Saint-Exupéry, qui reposaient dans les profondeurs sous-marines, attendant d&#039;être retrouvés.\r\n\r\nUne exposition au Musée archéologique de Saint-Raphaël\r\nGrâce à la découverte de la gourmette, le mystère de la disparition de l&#039;aviateur semble avoir trouvé un dénouement, mais son histoire continue de nous captiver. L&#039;authentique gourmette était au cœur d&#039;une exposition consacrée à Antoine de Saint-Exupéry, « Des nuages aux profondeurs », au Musée archéologique de Saint-Raphaël, du 2 février au 13 avril 2018.', '2020-10-24 16:45:49', 2),
(2, 'Face au virus, l’est de l’Asie réussit là où l’Europe échoue', 'Alors qu’on compte près de 23 300 cas par million d’habitants en Belgique, ce ratio est de 12 au Vietnam et 62 en Chine.\r\n\r\nPendant que l’Europe et l’Amérique luttent désespérément contre le coronavirus, l’est de l’Asie reste peu touché ; les nouveaux cas apparus cet été n’ont certainement pas atteint l’ampleur de la seconde vague qui déferle actuellement sur l’Europe. \r\n\r\nAlors qu’on compte, depuis le début de la pandémie, près de 23 300 cas par million d’habitants en Belgique, ce ratio est de 3 au Laos, 12 au Vietnam, 53 en Thaïlande, 62 en Chine, 498 en Corée du Sud, 748 au Japon, 1 350 en Indonésie - pour ne citer qu’eux -, selon les chiffres de l’Organisation mondiale de la santé (OMS). &quot;Dans l’ensemble, 1 % de tous les nouveaux cas et décès hebdomadaires ont été signalés dans la région du Pacifique occidental&quot; , relève l’OMS dans sa lettre épidémiologique hebdomadaire. \r\n\r\nUn pour cent seulement, dont la majorité a été enregistrée aux Philippines, en Malaisie et au Japon. La Chine, où le nouveau coronavirus avait fait son apparition à la fin de l’an dernier, se targue aujourd’hui d’avoir quasi éradiqué le virus sur son sol.', '2020-10-25 10:20:45', 1),
(3, 'Figuiers, kakis, nashi, aronia : ces espèces fruitières hors du commun et bien capables de s&#039;épanouir en Belgique', 'Le jardinier est de nature curieuse. Trouvailles et nouveautés sont des tentations auxquelles il résiste rarement. La pépinière Bois De Rode Bos avec sa sélection de fruits peu courants a tout pour le séduire.\r\nLe chemin parcouru par Pierre Barbieux pour aboutir à cette nouvelle pépinière à nulle autre pareille illustre les étonnants tours et détours de la vie. Son diplôme en relations publiques dans la poche, il parcourt d’abord la planète en tant que Web Designer. \r\n\r\nPuis revenu au pays, il crée, tandis qu’internet en est encore à ses balbutiements, un site de réservations d’hôtels. Une expérience formidable qui lui permet d’acquérir autonomie et liberté. Quand des soucis de santé l’obligent à rebattre les cartes, il prend conscience du lien essentiel qui existe entre bien-être et qualité de l’alimentation. \r\n\r\nIl se penche sur tout ce qui touche à la nutrition. Ce qui l’amène aux modes de cultures en général et plus précisément au travail d’Agricovert à Gembloux. Une coopérative engagée dans la défense d’une agriculture plus respectueuse des hommes et de l’environnement/', '2020-10-25 10:50:41', 3),
(37, 'Google verserait 12 milliards de dollars par an à Apple pour être le moteur de recherche par défaut', 'Le gouvernement américain a déposé une plainte antitrust contre Google qui verserait entre 8 et 12 milliards de dollars par an à Apple afin d’être le moteur de recherche par défaut sur iOS. Ce versement représenterait 14 à 21 % des bénéfices annuels d’Apple.\r\n\r\nLes GAFA (Google, Apple, Facebook et Amazon) sont dans le viseur de la justice américaine depuis déjà quelque temps. En 2019, le gouvernement américain s’apprêtait à demander aux institutions garantes de la loi antitrust d’enquêter sur les agissements de ces fameuses GAFA. Il vient de déposer une plainte antitrust contre Google le 20 octobre dernier. En effet, le gouvernement américain l’accuse d’avoir recours à des pratiques anticoncurrentielles et d’exclusion sur les marchés de la recherche web et de la publicité dans le but de préserver son monopole.\r\n\r\nThe New York Times a rapporté l’existence d’un contrat très lucratif entre Google et Apple. Chaque année, la firme de Mountain View verserait une somme comprise entre 8 et 12 milliards de dollars à Apple. Ce paiement lui permettrait de conserver sa position de moteur de recherche par défaut sur iOS. D’ailleurs, l’arrivée d’iOS 14 permet enfin aux utilisateurs de changer leur navigateur par défaut.\r\n\r\nSelon les plaignants, ce contrat est représentatif des tactiques illégales utilisées par le géant américain. Celui-ci semble effectivement prêt à tout pour protéger son monopole et écraser toute forme de concurrence. Le Département de la Justice des États-Unis a précisé que près de 50 % du trafic total du moteur de recherche provient des appareils signés de la marque à la pomme. De plus, Apple est lui aussi montré du doigt par le gouvernement américain puisqu’il a accepté ce contrat. Il participe donc indirectement aux pratiques anticoncurrentielles de Google. Leur contrat est d’ailleurs considéré comme étant une « union improbable de rivaux ». Pour la firme de Cupertino, ce versement annuel représenterait entre 14 à 21 % de ses bénéfices, ce qui est loin d’être négligeable. Si vous vous souvenez, Apple a récemment été condamné en France à une amende de 1,1 milliard d’euros pour pratiques anticoncurrentielles.\r\n\r\nEnfin, ces poursuites judiciaires pourraient avoir des conséquences bien plus dévastatrices pour Google que pour Apple. Il risque de perdre une moitié de son trafic sans pouvoir le remplacer. De son côté, Apple subirait une perte financière conséquente, mais il pourrait aussi profiter de l’opportunité pour acquérir ou développer son propre moteur de recherche. Google serait alors dans une très mauvaise passe.', '2020-10-26 08:09:55', 2),
(38, 'Formation des collaborateurs: comment éviter «l’obsolescence programmée de la connaissance»?', '85% des métiers de 2030 n’existent pas aujourd’hui. Dans cette optique, le besoin en formation des collaborateurs n’a jamais été aussi fort pour acquérir des compétences leur permettant de s’adapter à l’ère numérique.\r\n\r\nPourtant, l’essentiel des compétences gagnées en formation sont perdues dès la première année par les salariés des entreprises. Parmi les acteurs qui forment ces collaborateurs, Rise Up mise sur le «lended learning», un mode de formation combinant participation présentielle et virtuelle. Arnaud Blachon, co-fondateur et CEO de Rise Up, nous livre son regard sur l’évolution du marché de la formation des collaborateurs et ses perspectives de développement à l’heure de la crise du coronavirus.\r\n\r\nNous retrouvons ensuite la startup Hollo. Il s’agit d’un jeune challengeur dans le secteur des solutions RH. Officiellement lancée cet été, l’entreprise mise sur l’intelligence artificielle et conversationnelle pour préqualifier automatiquement les candidats et automatiser la communication tout au long du cycle de vie des potentiels futurs collaborateurs. Pour en parler, nous avons échangé avec Thomas Moussafer, le CEO.', '2020-10-26 08:20:39', 3),
(39, 'Cette fonctionnalité rend le Nest Hub Max de Google plus pratique, mais aussi plus inquiétant', 'Google serait en train de tester une nouvelle fonctionnalité qui permet d’utiliser Google Assistant sans avoir à prononcer le mot-clé « Ok Google », grâce à un système de détection de la présence. Cela rendrait le produit plus pratique, mais pourrait également inquiéter certains utilisateurs.\r\n\r\nRécemment, lors de l’événement en ligne pour présenter le Pixel 5, Google a présenté une nouvelle enceinte connectée, le Nest Audio, qui succède au Google Home. Cette année, la firme a également apporté une série d’améliorations pour ses écrans Nest Hub, comme l’ajout de Netflix parmi les applications compatibles, ou encore le dark mode.\r\n\r\nOk Google, adieu\r\nVisiblement, Google prévoit également de lancer une fonctionnalité, pour ces écrans, qui permettra d’utiliser Google Assisant sans prononcer les mots « Ok Google ». En tout cas, c’est ce qui est suggéré par un article d’Android Central, qui relaie la chaîne YouTube de Jan Boromeusz. Récemment, celle-ci a dévoilé des fonctionnalités des écrans connectés de Google avant que ces fonctionnalités ne soient officielles.\r\n\r\nDe ce fait, les médias accordent une certaine crédibilité à ces fuites. Dans la vidéo, Jan Boromeusz utilise un écran Nest Hub Max et est en mesure de faire des requêtes pour Google Assistant, sans avoir à activer l’assistant numérique avec le mot-clé « Ok Google ».\r\n\r\nL’appareil fonctionnerait avec un firmware qui est actuellement utilisé par Google pour tester ses nouvelles fonctionnalités. Bien entendu, pour le moment, en attendant la présentation de cette nouveauté par la firme de Mountain View, la prudence reste de mise.\r\n\r\nPour le moment, nous ignorons également comment le Nest Hub Max détecte la présence de l’utilisateur pour activer l’écoute des requêtes. Il est possible que l’appareil utilise un capteur à ultrasons pour savoir si un utilisateur est à proximité. Mais il est également possible que le Nest Hub Max puisse utiliser son système de reconnaissance faciale.\r\n\r\nUn écran qui vous écouterait dès que vous êtes à proximité ?\r\nCela rend, en tout cas, les écrans connectés plus pratiques. Mais en même temps, cette nouveauté pourrait inquiéter certains utilisateurs.\r\n\r\nEn effet, actuellement, Google Assistant ne s’active que lorsqu’il est sollicité grâce au mot-clé « Ok Google ». Avec ce système de détection de présence, le Nest Hub Max écouterait donc l’utilisateur et traiterait les requêtes dès qu’il est à proximité (que celui-ci ait l’intention de demander quelque chose à l’assistant ou pas).\r\n\r\nPour le moment, nous ignorons quand Google pourrait lancer cette nouvelle fonctionnalité. Mais s’il le fait, on peut déjà supposer que la firme de Mountain View devrait donner le choix aux utilisateurs, en permettant à ceux-ci d’utiliser la détection de présence ou non.', '2020-10-26 08:25:13', 1),
(40, 'Chili : le changement de Constitution plébiscité dans les urnes', 'Les électeurs chiliens se sont largement prononcés en faveur d&#039;une réécriture de la Constitution, selon des résultats quasi définitifs communiqués dimanche par la Commission électorale.\r\n\r\nLes Chiliens ont voté à une très forte majorité, dimanche 25 octobre, en faveur d&#039;une nouvelle Constitution pour remplacer celle héritée de l&#039;ère Pinochet, lors d&#039;un référendum organisé un an après un soulèvement populaire massif contre les inégalités sociales.\r\n\r\nSelon des résultats quasi définitifs portant sur plus de 99 % des bureaux de vote, les suffrages favorables à une nouvelle Constitution l&#039;emportaient largement avec 78,28 % des voix, contre 21,72 % pour le vote rejetant cette option. La participation s&#039;élève à environ 50 %, selon l&#039;autorité électorale. Le futur projet de Constitution sera soumis à référendum en 2022.\r\n\r\nRéagissant à ces résultats, le président conservateur Sebastian Piñera a appelé dans une allocution télévisée à &quot;l&#039;unité&quot; du pays pour rédiger la &quot;nouvelle Constitution&quot;. &quot;Jusqu&#039;à présent, la Constitution nous a divisés. À partir d&#039;aujourd&#039;hui, nous devons tous collaborer pour que la nouvelle Constitution soit un espace d&#039;unité, de stabilité et d&#039;avenir&quot;, a déclaré le chef de l&#039;État.\r\n\r\nDes dizaines de milliers de manifestants euphoriques se sont rassemblés sur plusieurs places de la capitale Santiago, dont la Plaza Italia, épicentre de la contestation, pour fêter la victoire, ont constaté des journalistes de l&#039;AFP.\r\n\r\n&quot;Nous célébrons une victoire remportée sur cette place plus digne que jamais !&quot;, s&#039;enthousiasmait Graciela Gonzalez, une vendeuse de 35 ans, au milieu des chants, des pétards et des coups de klaxon.\r\n\r\nIl y a un an jour pour jour, la contestation contre les inégalités avait connu un tournant lorsque 1,2 million de personnes s&#039;étaient rassemblées sur cette place emblématique, rebaptisée &quot;Place de la dignité&quot;.\r\n\r\n&quot;Je n&#039;ai jamais imaginé que nous, Chiliens, serions capables de nous unir pour un tel changement !&quot;, s&#039;enflammait Maria Isabel Nuñez, 46 ans, venue sur la place main dans la main avec sa fille de 20 ans.\r\n\r\n&quot;Le Chili mérite une catharsis nationale et je pense que c&#039;est le début&quot;\r\n\r\nEn raison de la pandémie de coronavirus qui a durement frappé le Chili (500 000 contaminations, 14 000 décès), les électeurs, dûment masqués, ont formé toute la journée de longues files d&#039;attente devant les centres de vote, appliquant les mesures de distanciation physique, a constaté l&#039;AFP.\r\n\r\nDe nombreux électeurs ont évoqué un scrutin &quot;historique&quot;. &quot;Le Chili mérite une catharsis nationale et je pense que c&#039;est le début&quot;, a déclaré à l&#039;AFP Felipe, un ingénieur de 35 ans.\r\n\r\nRemplacer la Constitution héritée de la dictature d&#039;Augusto Pinochet (1973-1990) était une des revendications des manifestations lancées à partir du 18 octobre 2019, afin de réclamer une société plus juste.\r\n\r\nLa loi fondamentale actuelle limite fortement l&#039;action de l&#039;État et promeut l&#039;activité privée dans tous les secteurs, notamment l&#039;éducation, la santé et les retraites.', '2020-10-26 08:30:14', 2),
(41, 'Plus de 500 agents de police en quarantaine', '(Belga) Au 19 octobre, il y avait 557 agents de police en quarantaine, dont une bonne moitié malade du Covid-19 (282), le reste parce qu&#039;ils ont été en contact avec une personne contaminée (275), signalent lundi Het Nieuwsblad, De Standaard et Het Belang van Limburg.\r\n\r\n\r\nCependant, &quot;les chiffres ne sont que partiels et incomplets. Au cours de la semaine dernière, les quarantaines ont presque doublé&quot;, précise le porte-parole de la police fédérale. Les syndicats mettent en avant que les agents de police exercent un métier de contact et que le nouveau coronavirus les frappe tant dans les polices locales que fédérale. Ils avertissent que d&#039;ici quelques jours, les services policiers de base ne pourront plus être garantis par manque d&#039;agents. Ils plaident pour que les agents soient testés de manière prioritaire et préventive à l&#039;instar du personnel soignant. Le cabinet de la ministre des Affaires intérieures, Annelies Verlinden (CD&amp;V), abonde en ce sens. &quot;La ministre a demandé au gouvernement d&#039;administrer des tests pour le coronavirus aux agents. Nous supposons que cela sera bientôt en ordre&quot;, selon la porte-parole Sofie ­Demeyer. (Belga)', '2020-10-26 09:37:13', 1),
(43, '&#039;(a§è', 'etyuè§yuui fguyhrè§yuj drtghytyj', '2020-10-26 14:23:29', 1),
(44, 'Jordan 1 Retro High Dior', 'Jordan Brand connected with Parisian fashion house Dior to create history with the Jordan 1 Retro High Dior, now available on StockX. This is the first time that Jordan has collaborated with a legacy fashion label like Dior, making this release one for the books. This release was limited to only 8,500 pairs, each pair individually numbered.\r\n\r\nThis Jordan 1 Retro High is composed of a white and grey leather upper with traditional Dior monogram print Swoosh. These shoes are made in Italy with premium materials. Co-branded icy translucent soles, Dior branded tongue and Wings logo, and a silver “Air Dior” hang tag completes the design. These sneakers released in April of 2020 and retailed for $2,000.', '2020-10-26 16:01:10', 1);

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
(2, 20),
(37, 21),
(38, 23),
(40, 25),
(40, 26),
(40, 27),
(41, 28),
(39, 31),
(39, 32),
(39, 33),
(43, 34),
(39, 35),
(44, 36),
(44, 37);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rubriques`
--

INSERT INTO `rubriques` (`idrubriques`, `rubriques_titre`, `rubriques_text`, `rubriques_idrubriques`) VALUES
(6, 'Belgique', 'L\'actualité en Belgique', 0),
(7, 'Monde', 'L\'actualité dans le monde Belgique', 0),
(8, 'Sport', 'Tout sur le sport', 0),
(9, 'Politique', 'Restez informé sur la politique, géopolitique etc...', 0),
(10, 'Art', 'Tout sur l\'art', 0);

-- --------------------------------------------------------

--
-- Structure de la table `theimages`
--

DROP TABLE IF EXISTS `theimages`;
CREATE TABLE IF NOT EXISTS `theimages` (
  `idtheimages` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `theimages_title` varchar(400) DEFAULT NULL,
  `theimages_name` varchar(60) NOT NULL,
  PRIMARY KEY (`idtheimages`),
  UNIQUE KEY `theimages_name_UNIQUE` (`theimages_name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `theimages`
--

INSERT INTO `theimages` (`idtheimages`, `theimages_title`, `theimages_name`) VALUES
(18, 'Le jardinier est de nature curieuse', '20201025160251-98998.png'),
(19, 'L&#039;Europe en difficult&eacute;', '20201025160453-43530.png'),
(20, 'L&#039;Asie s&#039;en sort bien', '20201025160511-74194.png'),
(21, 'Google', '20201026080955-55010.jpg'),
(23, 'frenchweb', '20201026082236-75851.png'),
(25, 'Des Chiliens s&#039;enlacent pour c&eacute;l&eacute;brer le vote favorable &agrave; la r&eacute;daction d&#039;une nouvelle Constitution', '20201026083125-12457.png'),
(26, '', '20201026083144-74560.png'),
(27, '', '20201026083159-13150.png'),
(28, 'Au 19 octobre, il y avait 557 agents de police en quarantaine', '20201026093858-44408.png'),
(31, 'ryrtytyu', '20201026140010-83609.jpg'),
(32, '', '20201026140131-20332.jpg'),
(33, '', '20201026140246-73563.jpg'),
(34, '', '20201026142329-98242.jpg'),
(35, 'yt(u', '20201026144541-40205.jpg'),
(36, 'Jordan 1 Retro High Dior', '20201026160110-56881.jpg'),
(37, 'autre paire', '20201026160814-43232.jpg');

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
  ADD CONSTRAINT `fk_articles_users` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`);

--
-- Contraintes pour la table `articles_has_rubriques`
--
ALTER TABLE `articles_has_rubriques`
  ADD CONSTRAINT `fk_articles_has_rubriques_articles1` FOREIGN KEY (`articles_idarticles`) REFERENCES `articles` (`idarticles`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_articles_has_rubriques_rubriques1` FOREIGN KEY (`rubriques_idrubriques`) REFERENCES `rubriques` (`idrubriques`) ON DELETE CASCADE;

--
-- Contraintes pour la table `articles_has_theimages`
--
ALTER TABLE `articles_has_theimages`
  ADD CONSTRAINT `fk_articles_has_theimages_articles1` FOREIGN KEY (`articles_idarticles`) REFERENCES `articles` (`idarticles`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_articles_has_theimages_theimages1` FOREIGN KEY (`theimages_idtheimages`) REFERENCES `theimages` (`idtheimages`) ON DELETE CASCADE;

--
-- Contraintes pour la table `rubriques`
--
ALTER TABLE `rubriques`
  ADD CONSTRAINT `fk_rubriques_rubriques1` FOREIGN KEY (`rubriques_idrubriques`) REFERENCES `rubriques` (`idrubriques`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_permission` FOREIGN KEY (`permissions_idpermissions`) REFERENCES `permissions` (`idpermissions`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
