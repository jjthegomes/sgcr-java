-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27-Dez-2017 às 18:35
-- Versão do servidor: 10.1.21-MariaDB
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

DROP DATABASE SGCR;
CREATE DATABASE SGCR;

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `cpf` varchar(14) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `complemento` varchar(80) DEFAULT NULL,
  `telefone` varchar(14) NOT NULL,
  `celular` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `cpf_titular` varchar(14) NOT NULL,
  `inscricao_id` int(11) NOT NULL,
  `inscricao_corrida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao_credito`
--

CREATE TABLE `cartao_credito` (
  `id` int(11) NOT NULL,
  `numero` varchar(16) NOT NULL,
  `codigo_seguranca` varchar(3) NOT NULL,
  `validade` varchar(7) NOT NULL,
  `nome_titular` varchar(45) NOT NULL,
  `inscricao_id` int(11) NOT NULL,
  `inscricao_corrida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `corrida`
--

CREATE TABLE `corrida` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `horario` varchar(8) NOT NULL,
  `data` varchar(10) NOT NULL,
  `max_pessoa` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `regulamento` varchar(255) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `numero` varchar(6) DEFAULT NULL,
  `edicao` int(11) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `organizador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `corrida_ranking`
--

CREATE TABLE `corrida_ranking` (
  `ranking_id` int(11) NOT NULL,
  `corrida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inscricao`
--

CREATE TABLE `inscricao` (
  `id` int(11) NOT NULL,
  `corrida_id` int(11) NOT NULL,
  `data_compra` varchar(10) NOT NULL,
  `numero_peito` int(11) DEFAULT NULL,
  `pago` tinyint(1) DEFAULT NULL,
  `kit_retirado` tinyint(1) DEFAULT NULL,
  `tempo_largada` varchar(8) DEFAULT NULL,
  `tempo_chegada` varchar(8) DEFAULT NULL,
  `atleta_id` int(11) NOT NULL,
  `percurso_id` int(11) NOT NULL,
  `lote_id` int(11) NOT NULL,
  `kit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kit`
--

CREATE TABLE `kit` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `tipo_chip` varchar(45) DEFAULT NULL,
  `data_inicio_retirada` varchar(10) DEFAULT NULL,
  `data_final_retirada` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kit_corrida`
--

CREATE TABLE `kit_corrida` (
  `corrida_id` int(11) NOT NULL,
  `kit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `corrida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `cpf` varchar(14) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `complemento` varchar(80) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `celular` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `percurso`
--

CREATE TABLE `percurso` (
  `id` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `quilometragem` double NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `percurso_corrida`
--

CREATE TABLE `percurso_corrida` (
  `corrida_id` int(11) NOT NULL,
  `percurso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pontuacao`
--

CREATE TABLE `pontuacao` (
  `id` int(11) NOT NULL,
  `ranking_id` int(11) NOT NULL,
  `pontuacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `administrador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_kit`
--

CREATE TABLE `produto_kit` (
  `id` int(11) NOT NULL,
  `descricao` varchar(155) NOT NULL,
  `valor` double(6,2) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `kit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ranking`
--

CREATE TABLE `ranking` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `intervalo_faixa_etaria` int(11) DEFAULT NULL,
  `idade_inicial` int(11) DEFAULT NULL,
  `administrador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD KEY `fk_boleto_inscricao1_idx` (`inscricao_id`,`inscricao_corrida_id`);

--
-- Indexes for table `cartao_credito`
--
ALTER TABLE `cartao_credito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cartao_credito_inscricao1_idx` (`inscricao_id`,`inscricao_corrida_id`);

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
  ADD PRIMARY KEY (`ranking_id`,`corrida_id`),
  ADD KEY `fk_corrida_ranking_corridas1_idx` (`corrida_id`),
  ADD KEY `fk_corrida_ranking_rankings1_idx` (`ranking_id`);

--
-- Indexes for table `inscricao`
--
ALTER TABLE `inscricao`
  ADD PRIMARY KEY (`id`,`corrida_id`),
  ADD KEY `fk_inscricao_atleta1_idx` (`atleta_id`),
  ADD KEY `fk_inscricoes_percursos1_idx` (`percurso_id`),
  ADD KEY `fk_inscricao_lote1_idx` (`lote_id`),
  ADD KEY `fk_inscricao_kit1_idx` (`kit_id`),
  ADD KEY `fk_inscricao_corrida1_idx` (`corrida_id`);

--
-- Indexes for table `kit`
--
ALTER TABLE `kit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kit_corrida`
--
ALTER TABLE `kit_corrida`
  ADD PRIMARY KEY (`corrida_id`,`kit_id`),
  ADD KEY `fk_kit_corrida_kit1_idx` (`kit_id`),
  ADD KEY `fk_kit_corrida_corrida1_idx` (`corrida_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `percurso_corrida`
--
ALTER TABLE `percurso_corrida`
  ADD PRIMARY KEY (`corrida_id`,`percurso_id`),
  ADD KEY `fk_percurso_corrida_corrida1_idx` (`corrida_id`),
  ADD KEY `fk_percurso_corrida_percurso1` (`percurso_id`);

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
  ADD KEY `fk_produto_kit_kit1_idx` (`kit_id`);

--
-- Indexes for table `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rankings_administrador1_idx` (`administrador_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `atleta`
--
ALTER TABLE `atleta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `boleto`
--
ALTER TABLE `boleto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cartao_credito`
--
ALTER TABLE `cartao_credito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `corrida`
--
ALTER TABLE `corrida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inscricao`
--
ALTER TABLE `inscricao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `kit`
--
ALTER TABLE `kit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lote`
--
ALTER TABLE `lote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `organizador`
--
ALTER TABLE `organizador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `percurso`
--
ALTER TABLE `percurso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pontuacao`
--
ALTER TABLE `pontuacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `produto_kit`
--
ALTER TABLE `produto_kit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ranking`
--
ALTER TABLE `ranking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `boleto`
--
ALTER TABLE `boleto`
  ADD CONSTRAINT `fk_boleto_inscricao1` FOREIGN KEY (`inscricao_id`,`inscricao_corrida_id`) REFERENCES `inscricao` (`id`, `corrida_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cartao_credito`
--
ALTER TABLE `cartao_credito`
  ADD CONSTRAINT `fk_cartao_credito_inscricao1` FOREIGN KEY (`inscricao_id`,`inscricao_corrida_id`) REFERENCES `inscricao` (`id`, `corrida_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_inscricao_corrida1` FOREIGN KEY (`corrida_id`) REFERENCES `corrida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscricao_kit1` FOREIGN KEY (`kit_id`) REFERENCES `kit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscricao_lote1` FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscricoes_percursos1` FOREIGN KEY (`percurso_id`) REFERENCES `percurso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `kit_corrida`
--
ALTER TABLE `kit_corrida`
  ADD CONSTRAINT `fk_kit_corrida_corrida1` FOREIGN KEY (`corrida_id`) REFERENCES `corrida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kit_corrida_kit1` FOREIGN KEY (`kit_id`) REFERENCES `kit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `fk_ingressos_corridas1` FOREIGN KEY (`corrida_id`) REFERENCES `corrida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `percurso_corrida`
--
ALTER TABLE `percurso_corrida`
  ADD CONSTRAINT `fk_percurso_corrida_corrida1` FOREIGN KEY (`corrida_id`) REFERENCES `corrida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_percurso_corrida_percurso1` FOREIGN KEY (`percurso_id`) REFERENCES `percurso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_produto_kit_kit1` FOREIGN KEY (`kit_id`) REFERENCES `kit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
