-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : sql8614.phpnet.org:3306
-- Généré le : Dim 13 déc. 2020 à 17:13
-- Version du serveur :  10.3.25-MariaDB-1:10.3.25+maria~stretch-log
-- Version de PHP : 7.3.19-1~deb10u1

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `mvc_proc_upload`
--
CREATE DATABASE IF NOT EXISTS `mvc_proc_upload` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mvc_proc_upload`;

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
                            `idarticles` int(10) UNSIGNED NOT NULL,
                            `articles_title` varchar(150) NOT NULL,
                            `articles_text` text NOT NULL,
                            `articles_date` datetime DEFAULT current_timestamp(),
                            `users_idusers` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(43, 'Avec le coronavirus, les fleuristes aussi font grise mine', 'Dans sa boutique d&#039;un quartier huppé proche de l&#039;arc de Triomphe, Pascal Mutel feuillette son carnet de commandes. A la date du jour, les pages consacrées à deux grands hôtels parisiens sont vides. Ou presque.\r\n\r\n&quot;Un bouquet commandé, ouah!&quot; ironise le fleuriste. D&#039;ordinaire, ces établissements de luxe demandent quotidiennement des dizaines de bouquets pour fleurir les chambres. Mais leur fréquentation a chuté.\r\n\r\n&quot;Les palaces ont des taux d&#039;occupation autour de 10%... Et on ne met pas de fleurs dans des chambres vides&quot;, pointe M. Mutel, à la tête d&#039;une société de 14 salariés.\r\n\r\nIl fait ses calculs: entre les événements d&#039;entreprise annulés à la chaîne et les commandes amaigries, il estime que son chiffre d&#039;affaires sera amputé de 30% en mars et de 40% en avril. &quot;Pour l&#039;instant, on fait le dos rond. On commence à être habitués&quot;.\r\n\r\nEgalement président de la chambre syndicale des fleuristes d&#039;Ile-de-France, il rappelle que les commerces de région parisienne avaient été durement affectés par l&#039;épisode des &quot;Gilets jaunes&quot; et la paralysie des transports pendant la grève contre la réforme des retraites.  \r\n\r\nLes inquiétudes portent maintenant sur le maintien des rassemblements familiaux du printemps, mariages en tête.\r\n\r\n&quot;On a commencé à avoir des remontées faisant état d&#039;annulations ou de reports&quot;, rapporte Jean-Christophe Conrié, directeur de la Fédération française des artisans fleuristes. \r\n\r\nLes organisateurs font face à des défections d&#039;invités - soudain dans l&#039;incapacité de trouver un moyen de déplacement en raison des mesures de restrictions visant à endiguer l&#039;épidémie. Ils craignent aussi d&#039;exposer leurs proches âgés.\r\n\r\nDans ces conditions, &quot;on sent que tout le monde réduit un peu la voilure&quot;, remarque Gilles Pothier, fleuriste à Paris et président d&#039;Interflora.', '2020-10-26 14:23:29', 1),
(44, 'Jordan 1 Retro High Dior', 'Jordan Brand connected with Parisian fashion house Dior to create history with the Jordan 1 Retro High Dior, now available on StockX. This is the first time that Jordan has collaborated with a legacy fashion label like Dior, making this release one for the books. This release was limited to only 8,500 pairs, each pair individually numbered.\r\n\r\nThis Jordan 1 Retro High is composed of a white and grey leather upper with traditional Dior monogram print Swoosh. These shoes are made in Italy with premium materials. Co-branded icy translucent soles, Dior branded tongue and Wings logo, and a silver “Air Dior” hang tag completes the design. These sneakers released in April of 2020 and retailed for $2,000.', '2020-10-26 16:01:10', 1),
(45, 'Covid-19 : quel rôle doivent jouer les managers dans la gestion émotionnelle des collaborateurs ?', 'Face à la crise sanitaire actuelle, difficile de garder parfois le contrôle de ses émotions. Depuis mars, le rythme de vie de millions de salariés en France a été bouleversé du jour au lendemain, entraînant son lot de craintes et d’incertitudes. Face à l’inquiétude des collaborateurs, le rôle des managers a évidemment évolué et gagné en importance. Thomas Le Vigoureux, fondateur de Neomoon, cabinet de coaching et conseil en transformation des organisations et du leadership, livre son éclairage sur la relation manager-salarié en pleine crise du coronavirus et distille quelques conseils pour l’améliorer dans le contexte actuel.\r\n\r\nChaque mardi et vendredi, Jean-Luc Raymond de FranceNum.gouv.fr nous fait découvrir les meilleures initiatives de TPE et PME en matière de transformation numérique. Aujourd’hui, focus sur les métiers de bouche. La livraison de repas pour les restaurateurs : est-ce une solution durable ? Quels sont les avantages de la livraison à domicile et comment la mettre en place pour les métiers de bouche ? \r\n\r\nEt enfin, assiste-t-on à une accélération du commerce connecté avec la crise actuelle ?', '2020-10-30 07:56:26', 2),
(46, 'Les vaccins européens seront distribués &quot;au même moment&quot; entre les Etats-membres', '&quot;Il y a déjà un accord des 27 sur ce point&quot;, a assuré l&#039;Allemande.\r\n\r\n&quot;Nous devons anticiper le moment où un ou plusieurs vaccins seront disponibles&quot;, a expliqué à ses côtés le président du Conseil européen Charles Michel, revenant sur le contenu des discussions. Il fallait entre autres s&#039;assurer &quot;que nous sommes bien d&#039;accord pour garantir une distribution équitable entre Etats membres&quot; quand un ou plusieurs contrats signés par la Commission se concrétiseront par la fourniture de vaccins. Il faudra aussi &quot;tenter de converger sur la question des populations qui devraient avoir un accès prioritaire aux vaccins&quot;. Il y a eu jeudi soir un échange de vues à ce sujet, qui a été positif, ont assuré les deux présidents.\r\n\r\nLa Commission a transmis aux Etats un document basé sur des recommandations scientifiques, mettant en avant les éléments à prendre en compte pour prioriser les vaccinations. &quot;On a demandé aux Etats d&#039;implémenter maintenant cela au niveau national, et de nous transmettre leur stratégie de vaccination. Cela a été bien reçu&quot;, ajoute Ursula von der Leyen.\r\n\r\nLa Commission a déjà conclu des contrats d&#039;achat anticipé avec trois groupes pharmaceutiques. Via ces contrats, elle s&#039;assure d&#039;acquérir un certain nombre de doses, achetées finalement par les Etats membres, si le vaccin développé passe avec succès toutes les phases d&#039;essais cliniques et se révèle suffisamment sûr et efficace pour une mise sur le marché européen. La Commission est proche de contrats similaires avec trois autres firmes et les discussions avancent bien avec une septième. Depuis que l&#039;exécutif européen a lancé cette stratégie de négociations centralisées et d&#039;achats communs anticipés, il a toujours assuré que son but est d&#039;avoir un portefeuilles varié de vaccins, de quoi augmenter ses chances de pouvoir couvrir toute la population qui en a besoin.\r\n\r\nLa collaboration devra aussi être logistique, car les campagnes de vaccination seront de vrais défis sur ce point, a insisté Charles Michel. Les vaccins attendus ne devront pas forcément être tous conservés à la même température, ce qui implique un transport différent, etc. &quot;Il y a sur tous ces sujets une très forte volonté de travailler d&#039;arrache pied&quot; pour harmoniser, insiste Charles Michel.', '2020-10-30 07:59:39', 3),
(47, 'Les autorités n&#039;ont jamais reçu autant de signalements de cyberattaques: &quot;Le nombre réel est encore bien plus élevé&quot;', 'Le Centre pour la Cybersécurité Belgique (CCB) a déjà reçu cette année 5.387 signalements de cyberattaques ou d&#039;autres incidents en ligne, relate De Tijd vendredi. C&#039;est plus que sur toute l&#039;année 2019, au cours de laquelle 4.484 notifications avaient été reçues. Les méthodes les plus rapportées sont le hameçonnage et les rançongiciels, a indiqué le Premier ministre Alexander De Croo (Open Vld) - dont dépend le CCB - alors qu&#039;il répondait à une question parlementaire de Katrien Houtmeyers (N-VA).\r\n\r\nSelon M. De Croo, ces milliers de signalements n&#039;offrent pour autant pas une image complète du problème. &quot;Le nombre réel de cyberattaques en Belgique est en réalité bien plus élevé. Tant des entreprises que des particuliers indiquent en avoir été victimes, sans toujours avoir porté plainte à la police. À l&#039;exception de quelques fournisseurs de services essentiels qui relèvent de la loi sur la sécurité des réseaux et de l&#039;information, il n&#039;y a aucune obligation de signaler les incidents en ligne&quot;.\r\n\r\nEn revanche, tempère le Premier ministre, ce nombre record de rapports indique que la plateforme de signalement en ligne cert.be devient de plus en plus connue des victimes.', '2020-10-30 08:05:37', 1),
(48, 'erytydrty', 'grfjhytj', '2020-10-30 12:18:00', 3),
(49, 'Carte confinement : notre sélection d&#039;outils pour calculer le déplacement de 1 km autour de chez vous', 'Alors que le confinement limite à nouveau les déplacements des Français, Clubic vous propose une liste d&#039;outils indispensables qui vous aideront à ne pas sortir des clous des restrictions du gouvernement.\r\n\r\nOn se souviendra du vendredi 30 octobre 2020 comme le début du deuxième confinement imposé par l&#039;État aux Français, dans le cadre de la pandémie de Covid-19, qui a fait plus de 36 000 morts dans le pays depuis le début de l&#039;année. Comme au printemps, les déplacements sont interdits, mais des exceptions sont toutefois possibles, à l&#039;aide d&#039;une attestation qu&#039;on ne peut que vous conseiller de télécharger ou d&#039;imprimer depuis le site du gouvernement. Certains déplacements brefs sont par exemple autorisés, mais dans un rayon maximal d&#039;un kilomètre et dans la limite d&#039;une heure par jour. Pour savoir jusqu&#039;où vous pouvez mettre les pieds pour vos balades, votre footing ou vos sorties avec Junior, plusieurs outils, gratuits, sont à votre disposition en ligne. Clubic vous propose sa sélection.\r\n\r\n1. Géoportail, le précis « gouvernemental »\r\n\r\nLe portail Web géographique du gouvernement, Géoportail, a trouvé ces derniers mois une nouvelle utilité. Déjà plébiscité par les Français lors du premier confinement, l&#039;outil devrait à nouveau trouver son intérêt auprès du public avec sa carte.\r\n\r\nAprès avoir accédé aux outils cartographiques en cliquant en haut à droite sur la petite clé plate, il vous suffit de cliquer sur l&#039;onglet « Mesures » puis de choisir l&#039;option « Calculer une isochrone ». Ensuite, vous n&#039;avez plus qu&#039;à entrer votre adresse et à bien sélectionner le bouton « isodistance » en rentrant « 1 », correspondant à la distance de déplacement autorisée autour de votre domicile, et à choisir le mode piéton, avant d&#039;appuyer sur le bouton « Calculer » pour voir le résultat.\r\n\r\nEt celui-ci est tout à fait convenable. L&#039;outil est plutôt intelligent, puisqu&#039;il délimite directement un périmètre défini en fonction du paysage, de l&#039;aménagement ou de la topographie du territoire où vous vous trouvez. Par exemple, en choisissant un lieu situé en bord de mer, la carte prend soin de découper les limites.', '2020-10-30 12:27:30', 2),
(50, 'La loi de programmation de la recherche va programmer… la fin de la recherche française', 'Du gel des postes aux financements privés, le projet de loi s&#039;éloigne de plus en plus de l&#039;intérêt commun. La LPR doit être abandonnée afin de sauvegarder un enseignement supérieur et une recherche scientifique démocratiques, équitables et publics.\r\n\r\nNous rappelons que le préambule de la Constitution française de 1958 garantit l’équité d’accès pour toutes et tous à l’éducation, c’est-à-dire l’accès pour toutes et tous aux formations primaires, secondaires mais également supérieures. Malgré des soubresauts à chaque changement gouvernemental, le système est arrivé entre les années 1970 et 2000 à une relative équité de moyens humains et financiers entre établissements universitaires publics pour exercer leurs missions.\r\n\r\nAinsi, au sein des 85 universités françaises réparties sur le territoire, le citoyen pouvait être assuré de bénéficier d’une formation de qualité proche de lui, dispensée par des personnels qualifiés ; qualifications garanties par des normes nationales de formation et de recrutement. Mais dès les années 90, des rapports successifs au sein de l’Organisation de coopération et de développement économiques (OCDE) ont pointé le désinvestissement de la recherche privée entrepreneuriale, cœur de la recherche appliquée. La Commission européenne s’est alors portée à son chevet au travers d’une politique stratégique d’assujettissement à moyen terme de l’éducation et de la recherche publiques européennes au monde économique privé.\r\n\r\nLa course aux financements\r\nSur le plan de la recherche, ce sont les financements dits par appels à projet qui se déploient au détriment des financements dits récurrents, pérennes, des laboratoires. Ces financements par à-coups (typiquement de un à trois ans) limitent les bénéficiaires, flèchent et restreignent drastiquement les thématiques de recherche vers les besoins du privé (principalement du secteur industriel) et instaurent la mise en concurrence entre tous les acteurs : individus, laboratoires, établissements. Le temps consacré à la recherche elle-même en pâtit de par la multiplication du temps pour courir après son financement.\r\n\r\nLa raréfaction des moyens récurrents pousse progressivement les chercheurs à orienter leur travail sur les thématiques financées, laissant de côté des pans entiers de recherche, notamment la recherche fondamentale. Bien que garanties par le code de la recherche, l’indépendance et la liberté des chercheurs se trouvent de fait soumises au diktat des agences et aux interférences de l’Etat. Le Covid-19, thématique de recherche devenue moins «porteuse», en est un exemple criant. Toutes les disciplines scientifiques sont touchées, mais plus particulièrement celles des sciences humaines et sociales. Or n’oublions pas que la recherche alimente la mise à jour des contenus de formations du supérieur.\r\n\r\nPrises en étau entre une sous-dotation organisée, caractérisée par le «gel» de postes et les embauches de vacataires, et une augmentation des charges avec l’augmentation du nombre d’étudiants ou l’internationalisation des recherches, bon nombre d’universités sont au bord de la rupture et sabrent dans les formations, faisant de fait voler en éclat l’équité territoriale de l’ESR.\r\n\r\nLa LPR, présentée comme la solution, pourrait être l’acte de décès de notre système universitaire de service public. Cette loi sanctuarise les inégalités entre établissements, entre personnels et entre usagers : d’un côté les universités d’excellence, de l’autre celles de proximité. Cela ne doit pas avoir lieu. L’équité sur tout le territoire des établissements universitaires doit redevenir une clé de voûte de la Constitution française ! Cette loi renforcera les luttes intestines pour trouver des moyens de travail au lieu de fédérer les énergies pour irriguer la société de nouveaux savoirs. Elle favorisera les dérives vers des abus d’autorité jusqu’aux méconduites scientifiques.', '2020-10-30 14:48:04', 3),
(51, 'Construire un menu arborescent avec une fonction récursive en PHP 7', 'Un sujet assez difficile à comprendre dans le monde de la programmation web pour plusieurs webmasters qui ont appris par eux-mêmes, dont je fais parti, est la technique de récursivité, où une fonction fait appel à elle-même. Cette fonction est dit récursive dans ce cas, et elle peut être nécessaire dans plusieurs situations, telles que la création d’un menu arborescent complexe où le nombre de sous-catégories n’est pas prévisible.\r\n\r\n\r\nCommençons par la structure d’une base de donnée MySQL simple et typique pour ces catégories. Celle-ci est une table, appelée Animaux, contenant une liste de catégories, avec leur identification propre, leur nom, et leur lien de parenté avec une autre catégorie, si elle est en fait une sous catégorie de celle-ci dans une menu arborescent.', '2020-11-06 10:26:40', 2),
(52, 'Présidentielle américaine: Trump exige un recomptage dans un État clé', 'L’équipe de campagne du président a transféré 3 millions de dollars pour un recomptage partiel, selon la commission électorale du Wisconsin.\r\n\r\nPrésidentielle américaine: Trump exige un recomptage dans un État clé.\r\n\r\nLe président américain Donald Trump veut recompter une partie des votes dans l’État du Wisconsin. L’équipe de campagne du président a transféré 3 millions de dollars pour un recomptage partiel, selon la commission électorale de l’État.', '2020-11-19 20:43:18', 1),
(53, 'Coronavirus en Belgique: les autorités constatent trop de monde à Bruges et Bruxelles', 'La police de Bruges demande au public de ne pas se rendre au festival des lumières durant ce week-end en raison d&#039;une affluence trop importante. Le bourgmestre de Bruxelles, lui, appelle au respect des consignes sanitaires alors que beaucoup de gens ont rallié, ce samedi, le centre de la capitale.\r\n\r\nLa 2e édition de &#039;Wintergloed&#039; a débuté vendredi dans le centre de Bruges. Dans ce cadre, des installations lumineuses ont été disposées dans dix lieux emblématiques de la ville.\r\n\r\nA Bruxelles, les illuminations et le sapin de Noël de la Grand Place ont également attiré beaucoup de monde. Trop, selon le bourgmestre de la Ville, Philippe Close. &quot;Beaucoup de gens se sont rendus dans le centre ville aujourd&#039;hui. Malheureusement trop de gens en même temps. Nous demandons à chacun d&#039;entre vous de respecter toutes les consignes sanitaires. Nous devons absolument poursuivre, ensemble, nos efforts&quot;, a-t-il tweeté samedi soir.', '2020-11-29 08:09:36', 3),
(54, 'France : 500.000 manifestants contre la loi &quot;sécurité globale&quot; selon les organisateurs, 133.000 selon les autorités', 'Les marches des libertés contre le texte de loi sécurité globale et les violences policières ont rassemblé samedi en France 133.000 personnes, selon un comptage du ministère de l&#039;Intérieur effectué à 18H00. Les organisateurs des &quot;marches des libertés&quot; contre le texte de loi sécurité globale et les violences policières estiment quant à eux que 500.000 manifestants paradé dans les rues de France.\r\n\r\nLes manifestants ont défilé ce samedi en France contre le texte de loi &quot;sécurité globale&quot; et sa mesure phare, qui prévoit de restreindre la possibilité de filmer les forces de l&#039;ordre, mais aussi contre les violences policières et le racisme.\r\n\r\n&quot;Laissez nous filmer, laissez nous respirer&quot;\r\nDe multiples rassemblements se sont tenus un peu partout dans l’Hexagone, contre ce texte jugé attentatoire à &quot;la liberté d’expression&quot; et à &quot;l’Etat de droit&quot; par ses opposants.\r\n\r\nPlusieurs milliers de personnes, 6.000 selon la préfecture, ont manifesté dans le centre-ville de Bordeaux contre la loi &quot;sécurité globale&quot;, la plus importante manifestation dans cette ville depuis la crise des &quot;gilets jaunes&quot;, ont constaté des journalistes de l&#039;AFP.\r\n\r\n&quot;Vos armes, nos caméras&quot;, &quot;Je suis Michel Zecler&quot;, &quot;Laissez nous filmer, laissez nous respirer&quot;, &quot;bienvenue sur la planète taire&quot; ou &quot;Flouter tue&quot;, pouvait-on lire sur des pancartes dans le cortège, sur lequel flottait les drapeaux de nombreuses organisations de gauche.\r\n\r\nA Montpellier (sud), ils étaient 4 à 5000, brandissant des pancartes clamant &quot;Plus de flics que de médecins - sens des priorités&quot; ou &quot;Démocratie floutée&quot;. A Rennes (ouest), Maud, 45 ans, était là pour protester contre ce &quot;réel déni démocratique&quot; et la &quot;dérive autoritaire.', '2020-11-29 08:15:02', 2),
(55, '«Louvain-le-Mec»: Dérive sexiste ou humour entre étudiants?', 'Cette page se veut une réponse humoristique au groupe Louvain-la-meuf, réservé aux filles et dont l&#039;objectif est d&#039;entretenir la solidarité et l&#039;entraide féminine à Louvain-la-Neuve. Les autorités de l&#039;UCLouvain estiment que certains contenus de Louvain-le-mec incompatibles avec les valeurs de l&#039;université et les condamnent fermement. Les administrateurs de la page identifiés comme étudiants de l&#039;UCLouvain ont été convoqués. Alors que Louvain-la-meuf est un groupe construit pour garantir un espace sécurisé réunissant les femmes de Louvain-la-Neuve avec une non-mixité choisie comme un outil politique, Louvain-le-mec se veut une réponse sarcastique à la démarche. &quot;Sous couvert d&#039;humour, des propos sexistes, oppressifs, homophobes, fascisants se sont multipliés. La femme est réduite au rang de lave-vaisselle, les hommes homosexuels sont rabaissés, les actions militantes de lutte contre le sexisme sont moquées, le droit à l&#039;avortement y est vivement attaqué, des drapeaux du Vlaams Belang exhibés. Notons que ce genre de groupe a de grandes similarités avec d&#039;autres boysclubs qui ont été récemment dévoilés&quot;, dénonce le communiqué qui appèle au démantèlement de cette page Facebook.\r\n\r\nDu côté de l&#039;UCLouvain, on confirme que les administrateurs de la page Louvain-le-mec qui ont pu être identifiés comme étudiants de l&#039;université ont été convoqués par le vice-recteur aux affaires étudiantes, Philippe Hiligsmann. L&#039;UCLouvain rappelle qu&#039;elle n&#039;a pas vraiment de prise sur l&#039;existence d&#039;un groupe constitué sur Facebook et dont le nom n&#039;utilise pas celui de l&#039;université. Par contre, l&#039;incompatibilité de certains contenus de la page Louvain-le-mec avec les valeurs de l&#039;UCLouvain sont soulignées.\r\n\r\n&quot;La page se veut satirique mais on ne peut pas admettre certains propos sexistes, homophobes, transphobes... Toute la gamme des violences verbales est présente sur cette page et nous le dénonçons fermement. Des étudiants ont été convoqués pour leur signaliser le caractère inadmissible des propos tenus. Ces contenus sont en porte-à-faux avec l&#039;article 34 de notre Règlement des études et des examens, qui concerne les valeurs de l&#039;Université. Des sanctions disciplinaires peuvent s&#039;appliquer: elles vont de l&#039;avertissement jusqu&#039;au renvoi définitif. Leur mise en œuvre est de la compétence du vice-recteur aux affaires étudiantes et c&#039;est lui qui évalue la situation&quot;, indique mercredi soir la conseillère du recteur à la politique de genre, Tania Van Hemelryck.', '2020-11-29 08:20:24', 1);

-- --------------------------------------------------------

--
-- Structure de la table `articles_has_rubriques`
--

DROP TABLE IF EXISTS `articles_has_rubriques`;
CREATE TABLE `articles_has_rubriques` (
                                          `articles_idarticles` int(10) UNSIGNED NOT NULL,
                                          `rubriques_idrubriques` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles_has_rubriques`
--

INSERT INTO `articles_has_rubriques` (`articles_idarticles`, `rubriques_idrubriques`) VALUES
(1, 10),
(2, 7),
(2, 11),
(2, 12),
(2, 14),
(3, 6),
(3, 14),
(37, 7),
(37, 9),
(37, 11),
(37, 13),
(38, 11),
(38, 13),
(39, 7),
(39, 11),
(39, 13),
(40, 7),
(40, 8),
(40, 9),
(40, 10),
(40, 12),
(41, 6),
(41, 9),
(41, 12),
(43, 11),
(43, 12),
(44, 8),
(44, 11),
(45, 11),
(45, 12),
(46, 7),
(46, 9),
(46, 11),
(46, 12),
(46, 14),
(47, 6),
(47, 11),
(47, 12),
(47, 13),
(48, 7),
(48, 9),
(48, 10),
(48, 14),
(49, 7),
(49, 12),
(49, 13),
(50, 7),
(50, 9),
(50, 11),
(50, 12),
(50, 13),
(50, 14),
(51, 7),
(51, 13),
(52, 6),
(52, 7),
(52, 12),
(53, 6),
(53, 12),
(53, 14),
(54, 7),
(54, 9),
(54, 12),
(55, 6),
(55, 12);

-- --------------------------------------------------------

--
-- Structure de la table `articles_has_theimages`
--

DROP TABLE IF EXISTS `articles_has_theimages`;
CREATE TABLE `articles_has_theimages` (
                                          `articles_idarticles` int(10) UNSIGNED NOT NULL,
                                          `theimages_idtheimages` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles_has_theimages`
--

INSERT INTO `articles_has_theimages` (`articles_idarticles`, `theimages_idtheimages`) VALUES
(2, 19),
(2, 20),
(3, 18),
(37, 21),
(38, 23),
(39, 31),
(39, 32),
(39, 35),
(40, 25),
(40, 26),
(40, 27),
(41, 28),
(43, 34),
(43, 40),
(44, 36),
(44, 37),
(45, 41),
(46, 42),
(47, 43),
(49, 44),
(50, 45),
(51, 46),
(52, 49),
(53, 50),
(53, 51),
(54, 52),
(55, 53);

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
                               `idpermissions` int(10) UNSIGNED NOT NULL,
                               `permissions_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
CREATE TABLE `rubriques` (
                             `idrubriques` int(10) UNSIGNED NOT NULL,
                             `rubriques_titre` varchar(120) NOT NULL,
                             `rubriques_text` varchar(500) DEFAULT NULL,
                             `rubriques_idrubriques` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rubriques`
--

INSERT INTO `rubriques` (`idrubriques`, `rubriques_titre`, `rubriques_text`, `rubriques_idrubriques`) VALUES
(6, 'Belgique', 'L\'actualité en Belgique', NULL),
(7, 'Monde', 'L\'actualité dans le Monde', NULL),
(8, 'Sport', 'Tout sur le sport', NULL),
(9, 'Politique', 'Restez informé sur la politique, géopolitique etc...', NULL),
(10, 'Art', 'Tout sur l\'art', NULL),
(11, 'Economie', 'Tout sur l\'économie', NULL),
(12, 'Société', 'Actualités sur la société au sens large', NULL),
(13, 'Technologie', 'Tout sur les technologie', NULL),
(14, 'Science', 'Tout sur la science', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `theimages`
--

DROP TABLE IF EXISTS `theimages`;
CREATE TABLE `theimages` (
                             `idtheimages` int(10) UNSIGNED NOT NULL,
                             `theimages_title` varchar(400) DEFAULT NULL,
                             `theimages_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(34, '', '20201026142329-98242.jpg'),
(35, 'yt(u', '20201026144541-40205.jpg'),
(36, 'Jordan 1 Retro High Dior', '20201026160110-56881.jpg'),
(37, 'autre paire', '20201026160814-43232.jpg'),
(40, 'March&eacute; aux fleurs', '20201028175333-38412.jpg'),
(41, 'Good Morning FrenchWeb', '20201030075626-62204.png'),
(42, 'AFP', '20201030075939-88860.png'),
(43, 'CCB', '20201030080537-70543.png'),
(44, 'Clubic', '20201030122730-32704.png'),
(45, 'Dans un laboratoire qui travaille sur un traitement contre le coronavirus, en f&eacute;vrier.', '20201030144804-88533.jpg'),
(46, 'fonction r&eacute;cursive', '20201106102641-71220.gif'),
(49, 'Trump', '20201119204318-10634.jpg'),
(50, 'Trop de monde &agrave; Bruxelles', '20201129080936-55164.jpg'),
(51, 'Tweet', '20201129081012-49422.jpg'),
(52, 'Manifestations en France', '20201129081502-61925.jpg'),
(53, 'Humour ou d&eacute;rive sexiste?', '20201129082024-54921.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
                         `idusers` int(10) UNSIGNED NOT NULL,
                         `users_name` varchar(45) DEFAULT NULL,
                         `users_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Le binaire permet au mot de passe d''être sensible à la casse (minuscule, majuscule)',
                         `permissions_idpermissions` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idusers`, `users_name`, `users_pwd`, `permissions_idpermissions`) VALUES
(1, 'myNameIsAdmin', 'myNameIsAdmin', 1),
(2, 'myNameIsEditor', 'myNameIsEditor', 2),
(3, 'myNameIsModerator', 'myNameIsModerator', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
    ADD PRIMARY KEY (`idarticles`),
    ADD UNIQUE KEY `titre_UNIQUE` (`articles_title`),
    ADD KEY `fk_articles_users_idx` (`users_idusers`);

--
-- Index pour la table `articles_has_rubriques`
--
ALTER TABLE `articles_has_rubriques`
    ADD PRIMARY KEY (`articles_idarticles`,`rubriques_idrubriques`),
    ADD KEY `fk_articles_has_rubriques_rubriques1_idx` (`rubriques_idrubriques`),
    ADD KEY `fk_articles_has_rubriques_articles1_idx` (`articles_idarticles`);

--
-- Index pour la table `articles_has_theimages`
--
ALTER TABLE `articles_has_theimages`
    ADD PRIMARY KEY (`articles_idarticles`,`theimages_idtheimages`),
    ADD KEY `fk_articles_has_theimages_theimages1_idx` (`theimages_idtheimages`),
    ADD KEY `fk_articles_has_theimages_articles1_idx` (`articles_idarticles`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
    ADD PRIMARY KEY (`idpermissions`),
    ADD UNIQUE KEY `droit_name_UNIQUE` (`permissions_name`);

--
-- Index pour la table `rubriques`
--
ALTER TABLE `rubriques`
    ADD PRIMARY KEY (`idrubriques`),
    ADD KEY `fk_rubriques_rubriques1_idx` (`rubriques_idrubriques`);

--
-- Index pour la table `theimages`
--
ALTER TABLE `theimages`
    ADD PRIMARY KEY (`idtheimages`),
    ADD UNIQUE KEY `theimages_name_UNIQUE` (`theimages_name`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`idusers`),
    ADD UNIQUE KEY `users_name_UNIQUE` (`users_name`),
    ADD KEY `fk_users_permissions_id` (`permissions_idpermissions`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
    MODIFY `idarticles` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
    MODIFY `idpermissions` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `rubriques`
--
ALTER TABLE `rubriques`
    MODIFY `idrubriques` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `theimages`
--
ALTER TABLE `theimages`
    MODIFY `idtheimages` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
    MODIFY `idusers` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
