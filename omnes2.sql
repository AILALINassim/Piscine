-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 29 mai 2022 à 12:41
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omnes`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `ID_Admin` varchar(50) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `MDP` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Admin`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`ID_Admin`, `Nom`, `Prenom`, `Email`, `MDP`) VALUES
('876543zaa7654', 'Ly', 'Tony', 'tony@gmail.com', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `cartebancaire`
--

DROP TABLE IF EXISTS `cartebancaire`;
CREATE TABLE IF NOT EXISTS `cartebancaire` (
  `ID_CB` varchar(50) NOT NULL,
  `adresse` varchar(40) DEFAULT NULL,
  `Ville` varchar(20) DEFAULT NULL,
  `CodePostal` int(11) DEFAULT NULL,
  `Pays` varchar(15) DEFAULT NULL,
  `ID_Paiement` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_CB`),
  KEY `fk_Paiement` (`ID_Paiement`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cartebancaire`
--

INSERT INTO `cartebancaire` (`ID_CB`, `adresse`, `Ville`, `CodePostal`, `Pays`, `ID_Paiement`) VALUES
('6293686e59117', 'az', 'za', 212, 'zaza', '6293686e59119');

-- --------------------------------------------------------

--
-- Structure de la table `carteetudiante`
--

DROP TABLE IF EXISTS `carteetudiante`;
CREATE TABLE IF NOT EXISTS `carteetudiante` (
  `ID_CE` varchar(50) NOT NULL,
  `Nom` varchar(15) DEFAULT NULL,
  `Prenom` varchar(15) DEFAULT NULL,
  `Ecole` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_CE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `carteetudiante`
--

INSERT INTO `carteetudiante` (`ID_CE`, `Nom`, `Prenom`, `Ecole`) VALUES
('6292abe48c113', 'Ly', 'Tony', 'ECE Paris');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `ID_Client` varchar(50) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prenom` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `MDP` varchar(20) DEFAULT NULL,
  `ID_Reservation` varchar(50) DEFAULT NULL,
  `ID_CE` varchar(50) DEFAULT NULL,
  `ID_CB` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Client`),
  KEY `fk_Reservation` (`ID_Reservation`),
  KEY `fk_CE` (`ID_CE`),
  KEY `fk_CB` (`ID_CB`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`ID_Client`, `Nom`, `Prenom`, `Email`, `MDP`, `ID_Reservation`, `ID_CE`, `ID_CB`) VALUES
('6290fe8cb539a', 'eztze', 'eztzetez', 'oscar@gmail.com', 'test', '6292a6860ace7', '6290fe8cb539f', NULL),
('6292abe48c110', 'Ly', 'Tony', 'tony1@gmail.com', 'tony', '6293686e59110', '6292abe48c113', '6293686e59117');

-- --------------------------------------------------------

--
-- Structure de la table `coach`
--

DROP TABLE IF EXISTS `coach`;
CREATE TABLE IF NOT EXISTS `coach` (
  `ID_Coach` varchar(50) NOT NULL,
  `Nom` varchar(15) DEFAULT NULL,
  `Prenom` varchar(15) DEFAULT NULL,
  `Activite` varchar(15) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `MDP` varchar(50) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `ID_Reservation` varchar(50) NOT NULL,
  `CV_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Coach`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `coach`
--

INSERT INTO `coach` (`ID_Coach`, `Nom`, `Prenom`, `Activite`, `Phone`, `Email`, `MDP`, `image_url`, `ID_Reservation`, `CV_url`) VALUES
('62925feecb209', 'Dupont', 'Lea', 'Diving', '0768986532', 'leadiving@yahoo.fr', 'lea', 'diving coach.jpg', '6293686e59110', ''),
('62925f71ef257', 'Parry', 'Diane', 'Tennis', '0658975312', 'dianetennis@outlook.fr', 'diane', 'tennis coach.jfif', '', ''),
('62925f0154d5f', 'Demba', 'Henry', 'Rugby', '0754287490', 'Henrugby@gmail.com', 'henrugby', 'rugby coach.png', '', ''),
('62925e92ce117', 'Evans', 'Mark', 'Football', '0654782509', 'markevans@yahoo.fr', 'mark123', 'football coach.webp', '', ''),
('629260de2a6cf', 'Muffat', 'Laure', 'Swimming', '0645832638', 'laure23@gmail.com', 'laure23', 'swimming coach.jpeg', '', ''),
('629261fbb882b', 'Inshape', 'Tibo', 'Bodybuilding', '0687323829', 'boomN@gmail.com', 'damn', 'tibo.jpg', '62936491a2e16', ''),
('62926264daa81', 'Becattini', 'Justine', 'Fitness', '0765434567', 'juju@yahoo.fr', 'jujufit', 'fitness coach.jfif', '', ''),
('629262c725220', 'Martin', 'Eric', 'Biking', '0687654345', 'eric@gmail.com', 'eric', 'biking coach.jfif', '', ''),
('629263069f212', 'Petit', 'Elise', 'Cardio-Training', '0734567892', 'elise@outlook.fr', 'elise', 'cardio training coach.jfif', '', ''),
('629268cf3076e', 'Thompson', 'Shaun', 'Group Training', '0792137298', 'insanity@gmail.com', 'shaun', 'group lessons category.jfif', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `ID_Paiement` varchar(50) NOT NULL,
  `Nom` varchar(15) DEFAULT NULL,
  `dateexpiration` varchar(20) DEFAULT NULL,
  `codesecu` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `ID_Reservation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Paiement`),
  KEY `fk_Reservation` (`ID_Reservation`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`ID_Paiement`, `Nom`, `dateexpiration`, `codesecu`, `type`, `ID_Reservation`) VALUES
('6293686e59119', 'Ly', '2022-06-03', 453, 'zazaza', '6293686e59110');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `ID_Reservation` varchar(50) NOT NULL,
  `date` varchar(25) DEFAULT NULL,
  `heure` varchar(10) DEFAULT NULL,
  `prix` varchar(25) DEFAULT NULL,
  `ID_Client` varchar(50) DEFAULT NULL,
  `ID_Coach` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Reservation`),
  KEY `fk_CE` (`ID_Client`),
  KEY `fk_CB` (`ID_Coach`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`ID_Reservation`, `date`, `heure`, `prix`, `ID_Client`, `ID_Coach`) VALUES
('6293686e59110', '2022-06-03', '21:21', '5', '6292abe48c110', '62925feecb209');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
