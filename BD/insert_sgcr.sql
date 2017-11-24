-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 21-Nov-2017 às 00:32
-- Versão do servidor: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sgcr`
--
CREATE DATABASE IF NOT EXISTS `sgcr` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sgcr`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Jonas Gomes', 'adm1@gmail.com', '123123'),
(2, 'Rafael Lana', 'adm2@email.com', '123123'),
(3, 'Arielesco Altino', 'adm3@gmail.com', '123123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `atleta`
--

CREATE TABLE `atleta` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `apelido` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `tamanho_camisa` varchar(2) NOT NULL,
  `data_nascimento` varchar(10) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `complemento` varchar(80) DEFAULT NULL,
  `telefone` varchar(11) NOT NULL,
  `celular` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `atleta`
--

INSERT INTO `atleta` (`id`, `nome`, `apelido`, `email`, `senha`, `sexo`, `tamanho_camisa`, `data_nascimento`, `cpf`, `cep`, `estado`, `cidade`, `bairro`, `logradouro`, `numero`, `complemento`, `telefone`, `celular`) VALUES
(1, 'Dorival Junior', 'Dori', 'dorival@gmail.com', '123123', 'M', 'M', '1998-08-20', '12353849699', '36031574', 'Minas Gerais', 'Juiz de Fora', 'Fabrica', 'Bernardo Mascarenhas', '12', 'n/a', '32329898', '99987952'),
(2, 'Jackson Nunes', 'Jack', 'jack@gmail.com', '123123', 'M', 'G', '1998-09-15', '12345678996', '36541574', 'Rio de Janeiro', 'Barra Mansa', 'Mansa', 'Perto do mar', '678', 'ap 234', '32456987', '99987600'),
(3, 'Camila Rezende', 'Camis', 'camis@gmail.com', '123123', 'F', 'P', '1990-12-25', '15473849699', '36541574', 'Sao Paulo', 'Sao Paulo', 'Das Cruzes', 'Rua das Placas', '23', 'ap 201', '32456987', '99875536');

-- --------------------------------------------------------

--
-- Estrutura da tabela `boleto`
--

CREATE TABLE `boleto` (
  `id` int(11) NOT NULL,
  `codigo_barra` varchar(45) NOT NULL,
  `data_emissao` varchar(10) NOT NULL,
  `data_vencimento` varchar(10) NOT NULL,
  `nome_titular` varchar(45) NOT NULL,
  `cpf_titular` varchar(11) NOT NULL,
  `inscricao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao_credito`
--

CREATE TABLE `cartao_credito` (
  `id` int(11) NOT NULL,
  `numero` varchar(16) NOT NULL,
  `codigo_seguranca` varchar(3) NOT NULL,
  `validade` varchar(5) NOT NULL,
  `nome_titular` varchar(45) NOT NULL,
  `inscricao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `corrida`
--

CREATE TABLE `corrida` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `horario` varchar(5) NOT NULL,
  `data` varchar(8) NOT NULL,
  `max_pessoa` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `regulamento` varchar(255) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `organizador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `corrida`
--

INSERT INTO `corrida` (`id`, `nome`, `horario`, `data`, `max_pessoa`, `banner`, `descricao`, `regulamento`, `cep`, `estado`, `cidade`, `bairro`, `logradouro`, `organizador_id`) VALUES
(1, 'Corrida da Paz', '22:38', '18-12-17', 250, 'caminho da img', 'Paz a todos na Terra', 'consultar site', '36031524', 'Minas Gerais', 'Juiz de Fora', 'Morto', 'Das Flores', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `corrida_ranking`
--

CREATE TABLE `corrida_ranking` (
  `id` int(11) NOT NULL,
  `corrida_id` int(11) NOT NULL,
  `ranking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inscricao`
--

CREATE TABLE `inscricao` (
  `id` int(11) NOT NULL,
  `data_compra` varchar(10) NOT NULL,
  `numero_peito` int(11) NOT NULL,
  `pago` tinyint(1) DEFAULT NULL,
  `kit_retirado` tinyint(1) DEFAULT NULL,
  `tempo_largada` varchar(8) DEFAULT NULL,
  `tempo_chegada` varchar(8) DEFAULT NULL,
  `percurso_id` int(11) NOT NULL,
  `atleta_id` int(11) NOT NULL,
  `kit_id` int(11) NOT NULL,
  `kit_corrida_id` int(11) NOT NULL,
  `lote_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kit`
--

CREATE TABLE `kit` (
  `id` int(11) NOT NULL,
  `corrida_id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `tipo_chip` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `kit`
--

INSERT INTO `kit` (`id`, `corrida_id`, `nome`, `quantidade`, `imagem`, `tipo_chip`) VALUES
(1, 1, 'KIT VIP', 150, 'caminho da imagem', 'Descartável');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lote`
--

CREATE TABLE `lote` (
  `id` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `preco` double NOT NULL,
  `data_inicio` varchar(19) NOT NULL,
  `data_final` varchar(19) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `corrida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lote`
--

INSERT INTO `lote` (`id`, `tipo`, `preco`, `data_inicio`, `data_final`, `quantidade`, `corrida_id`) VALUES
(1, 'VIP', 260, '2017-02-56', '2017-06-10', 30, 1),
(2, 'Unico', 53, '2017-05-10', '2017-06-10', 200, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `organizador`
--

CREATE TABLE `organizador` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `data_nascimento` varchar(10) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `complemento` varchar(80) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `celular` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `organizador`
--

INSERT INTO `organizador` (`id`, `nome`, `email`, `senha`, `sexo`, `data_nascimento`, `cpf`, `cep`, `estado`, `cidade`, `bairro`, `logradouro`, `numero`, `complemento`, `telefone`, `celular`) VALUES
(1, 'Jhon', 'Minas Gerais', 'M', 'M', '1998-10-01', '1235384654', '36031369', 'Minas Gerais', 'Juiz de Fora', 'Sao Geraldo', 'Rua das Pedras', '131', 'clube', '32332686', '999822421'),
(2, 'Sara', 'Minas Gerais', 'F', 'F', '1998-02-10', '1235384654', '36031369', 'Minas Gerais', 'Juiz de Fora', 'Pedregulho', 'Rua das Pedras', '775', 'Perto da pedra', '32332686', '999822421');

-- --------------------------------------------------------

--
-- Estrutura da tabela `percurso`
--

CREATE TABLE `percurso` (
  `id` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `quilometragem` double NOT NULL,
  `corrida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `percurso`
--

INSERT INTO `percurso` (`id`, `imagem`, `quilometragem`, `corrida_id`) VALUES
(1, 'caminho da imagem', 12, 1),
(2, 'caminho da imagem', 25, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pontuacao`
--

CREATE TABLE `pontuacao` (
  `id` int(11) NOT NULL,
  `ranking_id` int(11) NOT NULL,
  `pontuacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pontuacao`
--

INSERT INTO `pontuacao` (`id`, `ranking_id`, `pontuacao`) VALUES
(1, 1, 10),
(2, 2, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `administrador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `administrador_id`) VALUES
(1, 'Camiseta', 1),
(2, 'Bone', 2),
(3, 'Shortin', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_kit`
--

CREATE TABLE `produto_kit` (
  `id` int(11) NOT NULL,
  `descricao` varchar(155) NOT NULL,
  `valor` double(6,2) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `kit_id` int(11) NOT NULL,
  `kit_corrida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto_kit`
--

INSERT INTO `produto_kit` (`id`, `descricao`, `valor`, `produto_id`, `kit_id`, `kit_corrida_id`) VALUES
(1, 'Camisa branca', 30.00, 1, 1, 1),
(2, 'Bone preto', 10.00, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ranking`
--

CREATE TABLE `ranking` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `intervalo_faixa_etaria` int(11) DEFAULT NULL,
  `administrador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ranking`
--

INSERT INTO `ranking` (`id`, `nome`, `intervalo_faixa_etaria`, `administrador_id`) VALUES
(1, 'Masculino', 10, 2),
(2, 'Feminino', 5, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atleta`
--
ALTER TABLE `atleta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boleto`
--
ALTER TABLE `boleto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_boleto_inscricao1_idx` (`inscricao_id`);

--
-- Indexes for table `cartao_credito`
--
ALTER TABLE `cartao_credito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cartao_credito_inscricao1_idx` (`inscricao_id`);

--
-- Indexes for table `corrida`
--
ALTER TABLE `corrida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_corridas_organizadores1_idx` (`organizador_id`);

--
-- Indexes for table `corrida_ranking`
--
ALTER TABLE `corrida_ranking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_corrida_ranking_corridas1_idx` (`corrida_id`),
  ADD KEY `fk_corrida_ranking_rankings1_idx` (`ranking_id`);

--
-- Indexes for table `inscricao`
--
ALTER TABLE `inscricao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inscricao_atleta1_idx` (`atleta_id`),
  ADD KEY `fk_inscricoes_percursos1_idx` (`percurso_id`),
  ADD KEY `fk_inscricao_kit1_idx` (`kit_id`,`kit_corrida_id`),
  ADD KEY `fk_inscricao_lote1_idx` (`lote_id`);

--
-- Indexes for table `kit`
--
ALTER TABLE `kit`
  ADD PRIMARY KEY (`id`,`corrida_id`),
  ADD KEY `fk_kits_corridas1_idx` (`corrida_id`);

--
-- Indexes for table `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ingressos_corridas1_idx` (`corrida_id`);

--
-- Indexes for table `organizador`
--
ALTER TABLE `organizador`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `percurso`
--
ALTER TABLE `percurso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_percursos_corridas1_idx` (`corrida_id`);

--
-- Indexes for table `pontuacao`
--
ALTER TABLE `pontuacao`
  ADD PRIMARY KEY (`id`,`ranking_id`),
  ADD KEY `fk_pontuacao_ranking1_idx` (`ranking_id`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produto_administrador1_idx` (`administrador_id`);

--
-- Indexes for table `produto_kit`
--
ALTER TABLE `produto_kit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produtos_kit_produto1_idx` (`produto_id`),
  ADD KEY `fk_produto_kit_kit1_idx` (`kit_id`,`kit_corrida_id`);

--
-- Indexes for table `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rankings_administrador1_idx` (`administrador_id`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `boleto`
--
ALTER TABLE `boleto`
  ADD CONSTRAINT `fk_boleto_inscricao1` FOREIGN KEY (`inscricao_id`) REFERENCES `inscricao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `cartao_credito`
--
ALTER TABLE `cartao_credito`
  ADD CONSTRAINT `fk_cartao_credito_inscricao1` FOREIGN KEY (`inscricao_id`) REFERENCES `inscricao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `corrida`
--
ALTER TABLE `corrida`
  ADD CONSTRAINT `fk_corridas_organizadores1` FOREIGN KEY (`organizador_id`) REFERENCES `organizador` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `corrida_ranking`
--
ALTER TABLE `corrida_ranking`
  ADD CONSTRAINT `fk_corrida_ranking_corridas1` FOREIGN KEY (`corrida_id`) REFERENCES `corrida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_corrida_ranking_rankings1` FOREIGN KEY (`ranking_id`) REFERENCES `ranking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `inscricao`
--
ALTER TABLE `inscricao`
  ADD CONSTRAINT `fk_inscricao_atleta1` FOREIGN KEY (`atleta_id`) REFERENCES `atleta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscricao_kit1` FOREIGN KEY (`kit_id`,`kit_corrida_id`) REFERENCES `kit` (`id`, `corrida_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscricao_lote1` FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscricoes_percursos1` FOREIGN KEY (`percurso_id`) REFERENCES `percurso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `kit`
--
ALTER TABLE `kit`
  ADD CONSTRAINT `fk_kits_corridas1` FOREIGN KEY (`corrida_id`) REFERENCES `corrida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `fk_ingressos_corridas1` FOREIGN KEY (`corrida_id`) REFERENCES `corrida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `percurso`
--
ALTER TABLE `percurso`
  ADD CONSTRAINT `fk_percursos_corridas1` FOREIGN KEY (`corrida_id`) REFERENCES `corrida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pontuacao`
--
ALTER TABLE `pontuacao`
  ADD CONSTRAINT `fk_pontuacao_ranking1` FOREIGN KEY (`ranking_id`) REFERENCES `ranking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_administrador1` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produto_kit`
--
ALTER TABLE `produto_kit`
  ADD CONSTRAINT `fk_produto_kit_kit1` FOREIGN KEY (`kit_id`,`kit_corrida_id`) REFERENCES `kit` (`id`, `corrida_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produtos_kit_produto1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `fk_rankings_administrador1` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
