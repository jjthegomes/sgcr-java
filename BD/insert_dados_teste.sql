USE sgcr;

INSERT INTO administrador VALUES(1, 'Arielson Altino de Souza','arielson@email.com', '123123');
INSERT INTO administrador VALUES(2, 'Jonas Silva Gomes','jonas@email.com', '123123');
INSERT INTO administrador VALUES(3, 'Rafael Souza de Lana','rafael@email.com', '123123');

INSERT INTO atleta VALUES (
    1,
    'Rafael Lana',
    'Lana',
    'rafael@gmail.com',
    '123456',
    'M',
    '1997-01-01',
    '11122233344',
    '36080480',
    'Juiz de Fora',
    'Minas Gerais',
    'Rua dos Alfeneiros',
    'Esplanada',
    '4',
    'Tem erro não',
    '3222-4444',
    '98888-7777',
    'P'
);

INSERT INTO atleta VALUES (
    2,
    'Arielson Altino',
    'Ariel',
    'arielson@gmail.com',
    '123456',
    'M',
    '1992-10-30',
    '22233344455',
    '34999123',
    'Três Rios',
    'Rio de Janeiro',
    'Rua São Geraldo',
    'Montanheira',
    '654',
    NULL,
    '3333-4444',
    '99777-7777',
    'M'
);

INSERT INTO atleta VALUES (
    3,
    'Jonas Gomes',
    'JJ',
    'jonas@gmail.com',
    '123456',
    'M',
    '1998-09-30',
    '33344455566',
    '36111345',
    'Juiz de Fora',
    'Minas Gerais',
    'Avenida das Laranjeiras',
    'São Geraldo',
    '345',
    NULL,
    '5555-7777',
    '99222-1111',
    'G'
);

INSERT INTO atleta VALUES (
    4,
    'Lana Del Rey',
    'Lana',
    'lanadelrey@gmail.com',
    'darkparadise',
    'F',
    '1985-06-21',
    '99988877766',
    '30451222',
    'Juiz de Fora',
    'Minas Gerais',
    'Rua Ultraviolence',
    'Brooklyn Baby',
    '666',
    NULL,
    '1111-7070',
    '98111-7070',
    'M'
);

INSERT INTO organizador VALUES (
    1,
    'Maria ',
    'maria@gmail.com',
    '123456',
    0,
    '1980-05-20',
    '12312312312',
    '3600011',
    'Juiz de Fora',
    'Minas Gerais',
    'Rua das Margaridas',
    'Bairu',
    '1234',
    'Perto do posto policial',
    '1111-1212',
    '98111-1212'
);

INSERT INTO organizador VALUES (
    2,
    'João',
    'joao@gmail.com',
    '123456',
    1,
    '1970-05-25',
    '32132132132',
    '3600055',
    'Juiz de Fora',
    'Minas Gerais',
    'Rua do beco sem fim',
    'Bosque dos Atrasados',
    '987',
    NULL,
    '3232-1212',
    '98765-1212'
);


INSERT INTO corrida VALUES (
    1,
    'Corrida em Homenagem a Mané Garricha',
    800,
    '2017-11-20 08:30',
    '2017-11-20 12:30',
    'caminho do banner',
    'Rua do beco sem fim',
    '54321000',
    'Juiz de Fora',
    'Minas Gerais',
    'Parque das Águas',
    'Venha homenagear um dos maiores jogadores do futebol mundial!',
    'caminho para o regulamento',
    1
);

INSERT INTO corrida VALUES (
    2,
    '1° Corrida e Caminhada Contra o Câncer de Mama',
    700,
    '2017-11-30 07:30',
    '2017-11-30 11:30',
    'caminho do banner',
    'Rua das Margaridas',
    '44444222',
    'Juiz de Fora',
    'Minas Gerais',
    'Parque das Saudades',
    'ASSOCIAÇÃO DE MULHERES DE ATITUDE COM COMPROMISSO SOCIAL AMAC',
    'caminho para o regulamento',
    1
);

INSERT INTO corrida VALUES (
    3,
    'AJ CIRCUITO RACE 2ª EDIÇÃO',
    1200,
    '2017-12-14 08:00',
    '2017-12-14 12:30',
    'caminho do banner',
    'Avenida da Barra',
    '66666111',
    'Juiz de Fora',
    'Minas Gerais',
    'Centro',
    'A prova pedestre, AJ CIRCUITO RACE, nas distâncias de 4,5 KM e 9 KM, é uma realização da AJ Personal. O evento será disputado na cidade de Niteroi/RJ, no dia 19 DE NOVEMBRO DE 2017, a partir das 8h00, por pessoas de ambos os sexos, devidamente inscritos, com qualquer condição climática.',
    'caminho para o regulamento',
    2
);


INSERT INTO lote VALUES (1,'Único',60.00,'2017-10-15 00:00','2017-11-28 00:00',800,1);
INSERT INTO lote VALUES (2,'Único',80.00,'2017-09-25 12:00','2017-11-26 00:00',700,2);
INSERT INTO lote VALUES (3,'Único',95.00,'2017-11-05 06:00','2017-12-10 00:00',1200,3);


INSERT INTO percurso VALUES (1,'caminho da imagem',9,1);
INSERT INTO percurso VALUES (2,'caminho da imagem',4.5,1);
INSERT INTO percurso VALUES (3,'caminho da imagem',10,2);
INSERT INTO percurso VALUES (4,'caminho da imagem',12,3);


INSERT INTO ranking VALUES (1,'corrida Geral Juiz de Fora',5, 1);
INSERT INTO ranking VALUES (2,'corrida Premium',10, 1);
INSERT INTO ranking VALUES (3,'corrida do sudeste de Minas',7, 2);

INSERT INTO corrida_ranking VALUES(1, 1, 1);
INSERT INTO corrida_ranking VALUES(2, 2, 1);
INSERT INTO corrida_ranking VALUES(3, 3, 1);
INSERT INTO corrida_ranking VALUES(4, 1, 2);
INSERT INTO corrida_ranking VALUES(5, 2, 2);

INSERT INTO pontuacao VALUES(1, 50,1);
INSERT INTO pontuacao VALUES(2, 30,1);
INSERT INTO pontuacao VALUES(3, 20,1);
INSERT INTO pontuacao VALUES(1, 60,2);
INSERT INTO pontuacao VALUES(2, 35,2);
INSERT INTO pontuacao VALUES(3, 20,2);
INSERT INTO pontuacao VALUES(1, 75,3);
INSERT INTO pontuacao VALUES(2, 45,3);
INSERT INTO pontuacao VALUES(3, 35,3);
INSERT INTO pontuacao VALUES(4, 25,3);
INSERT INTO pontuacao VALUES(5, 10,3);

INSERT INTO kit VALUES(1,1,'VIP','caminho imagem','Retornavel');
INSERT INTO kit VALUES(2,1,'Comum','caminho imagem','Descartavel');
INSERT INTO kit VALUES(1,2,'Premium','caminho imagem','Descartavel');
INSERT INTO kit VALUES(2,2,'Normal','caminho imagem','Descartavel');
INSERT INTO kit VALUES(1,3,'Especial','caminho imagem','Retornavel');
INSERT INTO kit VALUES(2,3,'Comum','caminho imagem','Descartavel');


INSERT INTO produto_kit VALUES (1,1,'Número de Peito',5.00);
INSERT INTO produto_kit VALUES (2,1,'Chip Eletrônico',15.00,1);
INSERT INTO produto_kit VALUES (3,1,'Camiseta Tecido Tecnológico',35.00);

INSERT INTO produto_kit VALUES (1,2,'Número de Peito',5.00);
INSERT INTO produto_kit VALUES (2,2,'Chip Eletrônico',15.00);

INSERT INTO produto_kit VALUES (1,3,'Número de Peito',4.00);
INSERT INTO produto_kit VALUES (2,3,'Chip',12.00);
INSERT INTO produto_kit VALUES (3,3,'Camiseta',30.00);

INSERT INTO produto_kit VALUES (9,'Número de Peito',4.00,4);
INSERT INTO produto_kit VALUES (10,'Chip',12.00,4);

INSERT INTO produto_kit VALUES (11,'Número de Peito',5.00,5);
INSERT INTO produto_kit VALUES (12,'Chip Eletrônico',16.00,5);
INSERT INTO produto_kit VALUES (13,'Camisa',32.00,5);

INSERT INTO produto_kit VALUES (14,'Número de Peito',5.00,6);
INSERT INTO produto_kit VALUES (15,'Chip Eletrônico',16.00,6);


-- INSCRIÇÕES
-- data compra, número peito, pago, kit retirado, tempo largada, tempo chegada, percursoId, atletaId, kitId, corridaId

-- CORRIDA 1
INSERT INTO inscricao VALUES (1,'2017-09-15 17:25:20','1',true,true,'01:20:15','01:40:15',1,1,1,1);
INSERT INTO inscricao VALUES (2,'2017-09-16 15:22:11','2',true,true,'01:12:10','02:20:20',1,2,2,1);
INSERT INTO inscricao VALUES (3,'2017-09-10 12:22:11','3',true,false,'01:21:12','01:50:27',2,3,1,1);
INSERT INTO inscricao VALUES (4,'2017-09-12 16:22:11','4',true,false,'01:24:42','02:10:11',2,4,2,1);

-- CORRIDA 2
INSERT INTO inscricao VALUES (5,'2017-09-18 17:32:11','1',false,false,'00:00:00','00:00:00',3,1,1,2);
INSERT INTO inscricao VALUES (6,'2017-09-19 09:28:23','2',false,false,'00:00:00','00:00:00',3,2,2,2);
INSERT INTO inscricao VALUES (7,'2017-09-25 12:22:13','3',true,false,'00:00:00','00:00:00',3,3,1,2);

-- CORRIDA 3
INSERT INTO inscricao VALUES (8,'2017-05-12 12:28:23','2',false,false,'00:00:00','00:00:00',4,2,1,3);
INSERT INTO inscricao VALUES (9,'2017-05-13 19:12:51','3',false,false,'00:00:00','00:00:00',4,4,1,3);
