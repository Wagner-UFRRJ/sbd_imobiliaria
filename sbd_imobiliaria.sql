-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 22-Nov-2021 às 11:41
-- Versão do servidor: 8.0.26
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sbd_imobiliaria`
--
CREATE DATABASE IF NOT EXISTS `sbd_imobiliaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `sbd_imobiliaria`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `id` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `estado_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id`, `nome`, `estado_id`) VALUES
(1, 'uba', 4),
(2, 'tocantins', 4),
(3, 'Vassouras', 2),
(4, 'Nova Iguaçu', 2),
(5, 'Volta Redonda', 2),
(6, 'Campinas', 1),
(7, 'Santos', 1),
(8, 'Natal', 7),
(9, 'Vitoria', 3),
(11, 'São Paulo', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `id` int NOT NULL,
  `sigla` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id`, `sigla`) VALUES
(1, 'SP'),
(2, 'RJ'),
(3, 'ES'),
(4, 'MG'),
(5, 'RS'),
(6, 'PA'),
(7, 'RN');

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem`
--

CREATE TABLE `imagem` (
  `id` int NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `estado` int NOT NULL,
  `imagem` varchar(250) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `local` point DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `imagem`
--

INSERT INTO `imagem` (`id`, `titulo`, `estado`, `imagem`, `latitude`, `longitude`, `local`) VALUES
(1, 'teste', 4, 'c:\\Apache24\\htdocs\\imobiliaria\\media\\img\\cute-kitten-scaled.jpg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel`
--

CREATE TABLE `imovel` (
  `id` int NOT NULL,
  `id_proprietario` int NOT NULL,
  `rgi` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `local` point NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `imovel`
--

INSERT INTO `imovel` (`id`, `id_proprietario`, `rgi`, `data`, `local`) VALUES
(1, 17, '4324', '2010-10-10', 0xe61000000101000000b4667d87969245c07413315eea6c36c0),
(2, 18, '234', '2012-10-10', 0xe61000000101000000b4667de7668f45c03ed8988e716d36c0),
(3, 19, '123123', '2013-10-11', 0xe61000000101000000b4667dc7529645c06a6027717b6c36c0),
(4, 20, '32423234', '2014-07-12', 0xe61000000101000000b4667d07be9045c0f0599645716636c0),
(5, 21, '45345', '2010-10-07', 0xe61000000101000000b4667d07eb9045c01ea9c6a0667336c0),
(6, 22, '4353', '2018-12-31', 0xe61000000101000000b4a679e7598d45c08faf9fd9ec7136c0),
(7, 23, '345345', '2010-10-10', 0xe610000001010000009c678c36e88a3ac0427e7ec48f9121c0),
(8, 24, '324234', '2010-11-05', 0xe61000000101000000b486abde249b45c085f1c86d7a7636c0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietario`
--

CREATE TABLE `proprietario` (
  `id` int NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `proprietario`
--

INSERT INTO `proprietario` (`id`, `nome`) VALUES
(7, 'wagner'),
(8, 'messi'),
(9, 'cristiano ronaldo'),
(10, 'scholes'),
(11, 'wagner'),
(12, 'messi'),
(13, 'cristiano ronaldo'),
(14, 'a'),
(15, 'b'),
(16, 'fjghdfkgh'),
(17, '1'),
(18, '2'),
(19, '1'),
(20, '3'),
(21, '1'),
(22, '1'),
(23, '2'),
(24, '3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `regiao`
--

CREATE TABLE `regiao` (
  `id` int NOT NULL,
  `valor_m2` float NOT NULL,
  `geometria` polygon NOT NULL,
  `geometria_utm` polygon DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `regiao`
--

INSERT INTO `regiao` (`id`, `valor_m2`, `geometria`, `geometria_utm`) VALUES
(1, 5000, 0xe610000001030000000100000005000000b4667da70c9345c09f3e14e3b76f36c0b4667d67f68e45c030f61372b17036c0b4667d47808e45c051cacb5b487536c0b4667da72b9245c0e19dc6766b7636c0b4667da70c9345c09f3e14e3b76f36c0, NULL),
(2, 1000, 0xe610000001030000000100000005000000b4667da77f9845c005c684cab46936c0b4667d67749845c022871249c26f36c0b4667d67f09445c05136ccaa347036c0b4667d076f9445c0e94641ca806936c0b4667da77f9845c005c684cab46936c0, 0xd37f0000010300000001000000050000008d5d05f1a4f024415c829ddd16b05c41c7393d8dacf02441abbf6f3e88ad5c412d59576fbe06254157f3d2574fad5c41ead7ce5a320a25413fe65ee722b05c418d5d05f1a4f024415c829ddd16b05c41),
(3, 2000, 0xe610000001030000000100000005000000b4667d27159245c07316cc11776436c0b4667d872e9145c07ff67cbef86d36c0b4667de7698c45c06314f3538a6e36c0b4667d87428c45c0d8d138b1086536c0b4667d27159245c07316cc11776436c0, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cidade_estado1_idx` (`estado_id`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `imagem`
--
ALTER TABLE `imagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imagem_ibfk_1` (`estado`);

--
-- Índices para tabela `imovel`
--
ALTER TABLE `imovel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proprietario` (`id_proprietario`);

--
-- Índices para tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `regiao`
--
ALTER TABLE `regiao`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `imagem`
--
ALTER TABLE `imagem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `imovel`
--
ALTER TABLE `imovel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `regiao`
--
ALTER TABLE `regiao`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Limitadores para a tabela `imagem`
--
ALTER TABLE `imagem`
  ADD CONSTRAINT `imagem_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`);

--
-- Limitadores para a tabela `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `imoveis_ibfk_1` FOREIGN KEY (`id_proprietario`) REFERENCES `proprietario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
