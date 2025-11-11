
CREATE DATABASE IF NOT EXISTS coral;
USE coral;

CREATE TABLE IF NOT EXISTS usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL
);


INSERT INTO usuario (username, password) VALUES ('admin', 'admin123')
ON DUPLICATE KEY UPDATE username=username;

CREATE TABLE IF NOT EXISTS `coristas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `tipo_voz` varchar(50) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS `musicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `instrumento` varchar(100) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `agenda_apresentacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `local` varchar(150) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `presencas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_corista` int(11) DEFAULT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  `presente` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_corista` (`id_corista`),
  KEY `id_agenda` (`id_agenda`),
  CONSTRAINT `presencas_ibfk_1` FOREIGN KEY (`id_corista`) REFERENCES `coristas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `presencas_ibfk_2` FOREIGN KEY (`id_agenda`) REFERENCES `agenda_apresentacoes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;