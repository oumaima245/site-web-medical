-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 21 fév. 2023 à 18:01
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mdsite`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `nom_utilisateur` varchar(30) NOT NULL,
  `pwd1` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `a_ID` int(11) NOT NULL,
  `Title` varchar(500) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `WriterID` int(11) DEFAULT NULL,
  `PublishDate` date DEFAULT NULL,
  `Modifier_Date` date DEFAULT NULL,
  `Text` text DEFAULT NULL,
  `LikeNum` int(11) DEFAULT NULL,
  `CommentNum` int(11) DEFAULT NULL,
  `ReadNum` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `c_id` int(11) NOT NULL,
  `nom_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `cmnt_ID` int(11) DEFAULT NULL,
  `article_ID` int(11) DEFAULT NULL,
  `ur_id` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Content` varchar(3000) DEFAULT NULL,
  `LikeNum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compte pro`
--

CREATE TABLE `compte pro` (
  `D_id` int(11) NOT NULL,
  `nom complet` varchar(50) NOT NULL,
  `email_professional` varchar(50) NOT NULL,
  `Téléphone` char(10) NOT NULL,
  `genre` varchar(7) NOT NULL,
  `specialite` varchar(60) NOT NULL,
  `experiance` varchar(1000) NOT NULL,
  `permis_de_metier` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`permis_de_metier`)),
  `pwd` varchar(30) NOT NULL,
  `local_medical_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE `consultation` (
  `id_r` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `lieu_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `l_ID` int(11) NOT NULL,
  `ur_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `local_medical`
--

CREATE TABLE `local_medical` (
  `id_lieu` int(11) NOT NULL,
  `genre_lieu` varchar(30) NOT NULL,
  `nom_lieu` varchar(100) NOT NULL,
  `adress` varchar(200) NOT NULL,
  `telephone` char(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`photos`)),
  `video` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`video`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `ur_id` int(11) NOT NULL,
  `D_id` int(11) NOT NULL,
  `id_RV` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Statut` varchar(30) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `id_pay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rv_online`
--

CREATE TABLE `rv_online` (
  `rv_id` int(11) NOT NULL,
  `date_rv` date NOT NULL,
  `temps` time NOT NULL,
  `id_r` int(11) NOT NULL,
  `ur_id` int(11) NOT NULL,
  `D_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `ur_id` int(11) NOT NULL,
  `nom_utilisateur` varchar(35) NOT NULL,
  `genre` varchar(7) NOT NULL,
  `Téléphone` char(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `photo_profile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`photo_profile`)),
  `Nom_et_prenom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`nom_utilisateur`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`a_ID`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`c_id`);

--
-- Index pour la table `compte pro`
--
ALTER TABLE `compte pro`
  ADD PRIMARY KEY (`D_id`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`l_ID`);

--
-- Index pour la table `local_medical`
--
ALTER TABLE `local_medical`
  ADD PRIMARY KEY (`id_lieu`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_RV`);

--
-- Index pour la table `rv_online`
--
ALTER TABLE `rv_online`
  ADD PRIMARY KEY (`rv_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`ur_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `a_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compte pro`
--
ALTER TABLE `compte pro`
  MODIFY `D_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `l_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `local_medical`
--
ALTER TABLE `local_medical`
  MODIFY `id_lieu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_RV` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rv_online`
--
ALTER TABLE `rv_online`
  MODIFY `rv_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `ur_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
