CREATE DATABASE IF NOT EXISTS `sgcr`;

-- -----------------------------------------------------
-- Schema sgcr
-- -----------------------------------------------------
USE `sgcr` ;

-- -----------------------------------------------------
-- Table `sgcr`.`tamanhos_camisas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`tamanhos_camisas` (
  `id` INT NOT NULL,
  `tamanho` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`atletas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`atletas` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `apelido` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `sexo` TINYINT(1) NOT NULL,
  `dataNascimento` VARCHAR(10) NOT NULL,
  `cpf` VARCHAR(45) NULL,
  `cep` VARCHAR(8) NOT NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(6) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `telefone` VARCHAR(11) NULL,
  `celular` VARCHAR(11) NULL,
  `tamanhosCamisasId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_atletas_tamanhos_camisas1_idx` (`tamanhosCamisasId` ASC),
  CONSTRAINT `fk_atletas_tamanhos_camisas1`
    FOREIGN KEY (`tamanhosCamisasId`)
    REFERENCES `sgcr`.`tamanhos_camisas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`organizadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`organizadores` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `sexo` TINYINT(1) NOT NULL,
  `dataNascimento` VARCHAR(10) NOT NULL,
  `cpf` VARCHAR(11) NULL,
  `cep` VARCHAR(8) NOT NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(6) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `telefone` VARCHAR(11) NULL,
  `celular` VARCHAR(11) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`corridas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`corridas` (
  `id` INT NOT NULL,
  `nomeCorrida` VARCHAR(45) NOT NULL,
  `maxPessoas` INT NOT NULL,
  `horarioInicio` VARCHAR(5) NOT NULL,
  `horarioFinal` VARCHAR(5) NOT NULL,
  `banner` VARCHAR(255) NULL,
  `rua` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `regulamento` VARCHAR(255) NULL,
  `organizadoresId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_corridas_organizadores1_idx` (`organizadoresId` ASC),
  CONSTRAINT `fk_corridas_organizadores1`
    FOREIGN KEY (`organizadoresId`)
    REFERENCES `sgcr`.`organizadores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`ingressos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`ingressos` (
  `id` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `dataInicio` VARCHAR(19) NOT NULL,
  `dataFinal` VARCHAR(19) NOT NULL,
  `quantidade` INT NOT NULL,
  `corridasId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ingressos_corridas1_idx` (`corridasId` ASC),
  CONSTRAINT `fk_ingressos_corridas1`
    FOREIGN KEY (`corridasId`)
    REFERENCES `sgcr`.`corridas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`percursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`percursos` (
  `id` INT NOT NULL,
  `imagemPercurso` VARCHAR(255) NOT NULL,
  `quilometragem` DOUBLE NOT NULL,
  `corridasId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_percursos_corridas1_idx` (`corridasId` ASC),
  CONSTRAINT `fk_percursos_corridas1`
    FOREIGN KEY (`corridasId`)
    REFERENCES `sgcr`.`corridas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`inscricoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`inscricoes` (
  `id` INT NOT NULL,
  `dataCompra` VARCHAR(10) NOT NULL,
  `numeroPeito` INT NOT NULL,
  `tempoPercorrido` TIME NULL,
  `formaPagamento` TINYINT(1) NOT NULL,
  `pago` TINYINT(1) NULL,
  `corridasId` INT NOT NULL,
  `atletaId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_inscricao_corridas1_idx` (`corridasId` ASC),
  INDEX `fk_inscricao_atleta1_idx` (`atletaId` ASC),
  CONSTRAINT `fk_inscricao_corridas1`
    FOREIGN KEY (`corridasId`)
    REFERENCES `sgcr`.`corridas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscricao_atleta1`
    FOREIGN KEY (`atletaId`)
    REFERENCES `sgcr`.`atletas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`kits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`kits` (
  `id` INT NOT NULL,
  `quantidade` VARCHAR(45) NOT NULL,
  `imagemKit` VARCHAR(255) NULL,
  `tipoChip` VARCHAR(45) NULL,
  `corridasId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_kits_corridas1_idx` (`corridasId` ASC),
  CONSTRAINT `fk_kits_corridas1`
    FOREIGN KEY (`corridasId`)
    REFERENCES `sgcr`.`corridas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`produto_kit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`produto_kit` (
  `id` INT NOT NULL,
  `produto` VARCHAR(45) NULL,
  `preco` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`produtos_kit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`produtos_kit` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  `kitsId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_kit_kits1_idx` (`kitsId` ASC),
  CONSTRAINT `fk_produtos_kit_kits1`
    FOREIGN KEY (`kitsId`)
    REFERENCES `sgcr`.`kits` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`pontuacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`pontuacoes` (
  `id` INT NOT NULL,
  `pontuacao` INT NULL,
  `corridasId` INT NOT NULL,
  PRIMARY KEY (`id`, `corridasId`),
  INDEX `fk_classificacao_corridas1_idx` (`corridasId` ASC),
  CONSTRAINT `fk_classificacao_corridas1`
    FOREIGN KEY (`corridasId`)
    REFERENCES `sgcr`.`corridas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`administrador` (
  `id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`rankings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`rankings` (
  `id` INT NOT NULL,
  `nomeRanking` VARCHAR(45) NOT NULL,
  `administradorId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rankings_administrador1_idx` (`administradorId` ASC),
  CONSTRAINT `fk_rankings_administrador1`
    FOREIGN KEY (`administradorId`)
    REFERENCES `sgcr`.`administrador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgcr`.`corridas_ranking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgcr`.`corridas_ranking` (
  `id` INT NOT NULL,
  `corridasId` INT NOT NULL,
  `rankingsId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_corrida_ranking_corridas1_idx` (`corridasId` ASC),
  INDEX `fk_corrida_ranking_rankings1_idx` (`rankingsId` ASC),
  CONSTRAINT `fk_corrida_ranking_corridas1`
    FOREIGN KEY (`corridasId`)
    REFERENCES `sgcr`.`corridas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_corrida_ranking_rankings1`
    FOREIGN KEY (`rankingsId`)
    REFERENCES `sgcr`.`rankings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

