-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27-Dez-2017 às 18:36
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

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Arielson Souza', 'arielson@hotmail.com', '123'),
(2, 'Rafael Lana', 'rafael@hotmail.com', '123'),
(5, 'Jonas Silva', 'jonas@hotmail.com', '123');

--
-- Extraindo dados da tabela `atleta`
--

INSERT INTO `atleta` (`id`, `nome`, `apelido`, `email`, `senha`, `sexo`, `tamanho_camisa`, `data_nascimento`, `cpf`, `cep`, `estado`, `cidade`, `bairro`, `logradouro`, `numero`, `complemento`, `telefone`, `celular`) VALUES
(1, 'Fausto Silva', 'Faustão', 'fausto@hotmail.com', '123', 'M', 'G', '12/01/1954', '123.654.876-32', '25789452', 'RJ', 'Rio de Janeiro', 'Urca', '15 de novembro', '1356', NULL, '(21)95898-7414', '(21)92582-7841'),
(2, 'Maria da Graça Meneghel', 'Xuxa', 'maria@hotmail.con', '123', 'F', 'P', '05/03/1968', '235.648.791-56', '36016789', 'CE', 'Piau', 'Ladeira', 'Marechal Hermes', '5489', 'Beco', '(35)48759-8412', '(35)84526-3147'),
(3, 'Inês Brasil', 'Nenê', 'ines@hotmail.com', '123', 'F', 'M', '03/11/1979', '236.541.897-52', '35654789', 'RJ', 'Rio de Janeiro', 'São Gonçalo', 'Rua Princesa Isabel ', '123', '', '(21)54789-6325', '(21)94456-8721'),
(7, 'Ângela Dantas de Macedo Aragão ', 'Gê', 'angela@hotmail.om', '123', 'F', 'P', '21/11/1995', '452.478.963-25', '24737484', 'RJ', 'São Gonçalo', 'Eliane', 'Estrada Santa Isabel ', '145', NULL, '(21)92145-8796', '(21)96884-5415'),
(8, 'Rodolfo Duarte Martins Strognoff', NULL, 'rodolfo@hotmail.com', '123', 'M', 'G', '05/04/1986', '365.874.569-82', '16010250', 'SP', 'Araçatuba', 'Centro ', 'Rua Princesa Isabel ', '85', NULL, '(11)98547-1236', '(11)96587-4523'),
(9, 'Ian Lucas de Aquino Silvério de Azevedo Prado', 'Ianzim', 'ian@hotmail.com', '123', 'M', 'M', '21/10/1991', '258.741.365-28', '12947591', 'SP', 'Atibaia/', 'Jardim Santa Bárbara ', 'Rua Isabel Pires Antônio ', '75', NULL, '(11)98478-5565', '(11)94257-8524');

--
-- Extraindo dados da tabela `boleto`
--

INSERT INTO `boleto` (`id`, `codigo_barra`, `data_emissao`, `data_vencimento`, `nome_titular`, `cpf_titular`, `inscricao_id`, `inscricao_corrida_id`) VALUES
(1, '345484634648', '22/11/2017', '22/12/2017', 'Ângela Dantas de Macedo Aragão', '452.478.963-25', 16, 2),
(2, '54369465631456314', '22/10/2017', '23/11/2017', 'Rodolfo Duarte Martins Strognoff', '365.874.569-82', 17, 2),
(3, '47494746964645', '22/11/2017', '22/11/2017', 'Ian Lucas de Aquino Silvério de Azevedo Prado', '258.741.365-28', 18, 3);

--
-- Extraindo dados da tabela `cartao_credito`
--

INSERT INTO `cartao_credito` (`id`, `numero`, `codigo_seguranca`, `validade`, `nome_titular`, `inscricao_id`, `inscricao_corrida_id`) VALUES
(10, '1', '245', '10/2019', 'Fausto Silva', 13, 3),
(11, '2', '584', '10/2025', 'Maria da Graça Meneguel', 14, 1),
(12, '3', '753', '10/2023', 'Ian Lucas de Aquino Silvério de Azevedo Prado', 15, 1);

--
-- Extraindo dados da tabela `corrida`
--

INSERT INTO `corrida` (`id`, `nome`, `horario`, `data`, `max_pessoa`, `banner`, `descricao`, `regulamento`, `cep`, `estado`, `cidade`, `bairro`, `logradouro`, `numero`, `edicao`, `ativo`, `organizador_id`) VALUES
(1, 'Corrida da Paz', '08:00:00', '21/03/2018', 2000, NULL, 'A Corrida da Paz tem como abjetivo além de promover a saúde dos participantes, conscientizar sobre o valor da paz mundial. Venha se divertir em Paz.', NULL, '28016200', 'RJ', 'Campos dos Goytacazes', 'Vila da Rainha', 'Alameda Demerval Crespo', '145', NULL, 1, 1),
(2, 'Corrida Outubro Rosa', '08:00:00', '22/04/2018', 3000, NULL, 'A corrida Outubro Rosa tem como objetivo promover a conscientização da importância do exame e diagnostico assim como a prevenção contra a doença.   ', 'Futuramente será postado', '29155070', 'ES', 'Cariacica', 'Bela Vista ', 'Rua Juiz de Fora ', '150', 1, 1, 2),
(3, 'Corrida Contra Violência Infantil', '07:00:00', '21/02/2018', 2000, NULL, 'A Corrida Contra Violência Infantil tem como objetivo promover a conscientização sobre os problemas sociais causados pela violência infantil. Venha combater a violência !!!  ', 'Futuramente será postado', '22011010', 'RJ', 'Rio de Janeiro', 'Copacabana ', 'Avenida Princesa Isabel', '123', 1, 1, 3);

--
-- Extraindo dados da tabela `inscricao`
--

INSERT INTO `inscricao` (`id`, `corrida_id`, `data_compra`, `numero_peito`, `pago`, `kit_retirado`, `tempo_largada`, `tempo_chegada`, `atleta_id`, `percurso_id`, `lote_id`, `kit_id`) VALUES
(13, 3, '26/10/2017', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2),
(14, 1, '20/11/2017', NULL, NULL, NULL, NULL, NULL, 2, 2, 2, 3),
(15, 1, '11/12/2017', NULL, NULL, NULL, NULL, NULL, 3, 3, 3, 4),
(16, 2, '04/01/2018', NULL, NULL, NULL, NULL, NULL, 7, 1, 5, 3),
(17, 2, '06/01/2018', NULL, NULL, NULL, NULL, NULL, 8, 3, 6, 4),
(18, 3, '22/01/2018', NULL, NULL, NULL, NULL, NULL, 9, 3, 8, 4);

--
-- Extraindo dados da tabela `kit`
--

INSERT INTO `kit` (`id`, `nome`, `imagem`, `tipo_chip`, `data_inicio_retirada`, `data_final_retirada`) VALUES
(2, 'VIP', NULL, 'Retornável', '21/01/2018', '02/02/2018'),
(3, 'Premio', NULL, 'Reciclavel', '21/01/2018', '02/02/2018'),
(4, 'Básico', NULL, 'Reciclavel', '21/01/2018', '02/02/2018');

--
-- Extraindo dados da tabela `lote`
--

INSERT INTO `lote` (`id`, `tipo`, `preco`, `data_inicio`, `data_final`, `corrida_id`) VALUES
(1, '1º Lote ', 25, '21/09/2017', '21/11/2017', 1),
(2, '2º Lote', 50, '22/11/2017', '22/01/2018', 1),
(3, '3º Lote', 70, '23/01/2018', '10/03/2018', 1),
(4, '1º Lote ', 25, '22/10/2017', '22/12/2017', 2),
(5, '2º Lote', 50, '23/12/2017', '23/02/2018', 2),
(6, '3º Lote', 70, '24/02/2018', '15/04/2018', 2),
(7, '1º Lote', 25, '22/09/2017', '22/11/2017', 3),
(8, '2º Lote', 50, '23/11/2017', '23/12/2017', 3),
(9, '3º Lote', 70, '24/12/2017', '15/02/2018', 3);

--
-- Extraindo dados da tabela `organizador`
--

INSERT INTO `organizador` (`id`, `nome`, `email`, `senha`, `sexo`, `data_nascimento`, `cpf`, `cep`, `estado`, `cidade`, `bairro`, `logradouro`, `numero`, `complemento`, `telefone`, `celular`) VALUES
(1, 'Marcelo Alvares de Castro', 'marcelo@hotmail.com', '123', 'M', '07/06/1980', '147.896.523-65', '36458796', 'TO', 'Arueira', 'Flores Altas', 'Avenida das Pedras', '753', NULL, '(45)87965-2356', '(45)98752-1456'),
(2, 'Laura Marques de Mello Alcântara ', 'laura@hotmail.com', '123', 'F', '12/10/1985', '458.796.325-41', '21456987', 'SP', 'São Paulo', 'Jardins', 'Rua Presidente Arthur Bernardes', '456', NULL, '(11)85479-6325', '(11)87459-6325'),
(3, 'Frederico Lavinas Gonçalves Damas', 'frederico@hotmail.com', '123', 'M', '09/06/1990', '112.547.896-35', '36236587', 'MG', 'Tocantins de Minas', 'Roseiral', 'Rua Condessa do Rio Novo', '658', NULL, '(32)23547-8965', '(32)54789-6558');

--
-- Extraindo dados da tabela `percurso`
--

INSERT INTO `percurso` (`id`, `imagem`, `quilometragem`, `descricao`) VALUES
(1, NULL, 3, 'Percurso pequeno. Ideal para corredores iniciantes'),
(2, NULL, 10, 'Percurso Intermediário.   '),
(3, NULL, 20, 'Percurso Longo. Ideal para corredores experientes. ');

--
-- Extraindo dados da tabela `pontuacao`
--

INSERT INTO `pontuacao` (`id`, `ranking_id`, `pontuacao`) VALUES
(1, 1, 50),
(2, 2, 70),
(3, 1, 25),
(4, 2, 50),
(5, 1, 15),
(6, 2, 25),
(7, 1, 5),
(8, 2, 15),
(9, 2, 5);

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `administrador_id`) VALUES
(1, 'Boné Masculino', 1),
(2, 'Short Masculino', 5),
(3, 'Camisa Masculina', 2),
(4, 'Camisa Feminina', 5),
(5, 'Boné Feminino', 2),
(6, 'Short Feminino', 1);

--
-- Extraindo dados da tabela `ranking`
--

INSERT INTO `ranking` (`id`, `nome`, `intervalo_faixa_etaria`, `idade_inicial`, `administrador_id`) VALUES
(1, 'Juiz de Fora', 5, 10, 1),
(2, 'Rio de Janeiro', 7, 5, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
