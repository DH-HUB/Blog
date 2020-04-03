-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 03 avr. 2020 à 12:41
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `monblog`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `publication_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `articleid` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `articleid` (`articleid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `username`, `content`, `publication_date`, `articleid`) VALUES
(1, 'Stéphane', 'Belle photo', '2020-04-02 21:26:35', 1),
(3, 'Esther', 'Vertus médicinales :\r\nExpectorante : les feuilles et les fleurs de la violette odorante soignent les affections broncho-pulmonaires d\'intensité faible à modérée, comme la toux, les rhumes et les bronchites. Sudorifique : elle favorise la transpiration et fait baisser la fièvre, en cas d\'état grippal.', '2020-04-03 13:49:02', 3),
(4, '', '!', '2020-04-03 14:06:04', 5);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `publication_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(100) NOT NULL,
  `writerid` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `writerid` (`writerid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `publication_date`, `image`, `writerid`) VALUES
(1, 'Tulipes', 'Les tulipes forment un genre de plantes herbacées de la famille des Liliacées, qui compte une centaine d\'espèces originaires des régions tempérées chaudes de l\'Ancien monde. Plusieurs espèces sont largement cultivées comme plantes ornementales et ont donné lieu à la création de plusieurs milliers de variétés', '2020-04-02 21:22:17', '5e86c04ed67bf.jpg', 11),
(3, 'La violette', 'La Violette odorante est une petite plante vivace de la famille des Violaceae formant des colonies plus ou moins étendues, aux tiges formant des stolons, aux feuilles ovales, en cœur à la base, munies', '2020-04-03 04:06:44', '5e86bcdc3c320.jpg', 12),
(4, 'Rosa luciae', 'Le rosier de Wichura est une espèce de rosiers classée dans la section des Synstylae, originaire d\'Asie orientale : Chine Taïwan, Japon, Corée, Philippines. Il forme des fourrés dans les régions côtières, sur les falaises maritimes, sur terrains calcaires, jusqu\'à 500 mètres d\'altitude.', '2020-04-03 06:28:42', '5e86bc84371e1.jpg', 14),
(5, 'le girofle ', '\r\nOriginaire d\'Indonésie, le girofle est connu pour ses nombreux bienfaits. Il est anti-inflammatoire et apaise les douleurs musculaires. Mais c\'est aussi un très bon anesthésiant local et un antiseptique efficace. Le girofle agit également contre les bactéries, les microbes et les virus.', '2020-04-03 13:57:39', '5e8724b3bac84.jpg', 10);

-- --------------------------------------------------------

--
-- Structure de la table `writers`
--

DROP TABLE IF EXISTS `writers`;
CREATE TABLE IF NOT EXISTS `writers` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `hashed_password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `writers`
--

INSERT INTO `writers` (`id`, `username`, `hashed_password`) VALUES
(10, 'marie', '$2y$10$W0Jp.iWvS8p6SQVcN4yuBOi77PbM4QsRjbg6Y9/AwDPtib0W7HnFC'),
(11, 'nina', '$2y$10$nnHqOQmtUT9.nq6hid6mEO1dW0Cj4iQFQN3WoqCvuLgZVgpdgqwIG'),
(12, 'Grégory', '$2y$10$BGYn7EpaqlE2iD/q1k6xhu94e8QbE3nENVUY/KXDKiml5T3ToSpvC'),
(13, 'nina', '$2y$10$Yar7TDPiz2veW79dhC/DNevV5.a9SxJZmksN3LkXqrC/zaqg3BM3O'),
(14, 'Pierre', '$2y$10$iF.nQsNfm7ESOY4TS4cPHuAVP8Kvskra.nQuEbpb/DJtVk1MIWsJC'),
(15, '', '$2y$10$WqIaUqhQfnlhKdQfLJNc0ubIk73W7jd6rXPQ3hPI/mOAKUfoORthS');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`articleid`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`writerid`) REFERENCES `writers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
