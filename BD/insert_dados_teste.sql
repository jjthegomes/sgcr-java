INSERT INTO administrador VALUES(1, 'adm1@email.com', '111111');
INSERT INTO administrador VALUES(2, 'adm2@email.com', '222222');
INSERT INTO administrador VALUES(3, 'adm3@email.com', '333333');


INSERT INTO atletas VALUES (
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

INSERT INTO atletas VALUES (
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

INSERT INTO atletas VALUES (
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

INSERT INTO atletas VALUES (
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

INSERT INTO organizadores VALUES (
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

INSERT INTO organizadores VALUES (
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


INSERT INTO corridas VALUES (
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

INSERT INTO corridas VALUES (
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

INSERT INTO corridas VALUES (
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


INSERT INTO ingressos VALUES (1,'Único',60.00,'2017-10-15 00:00','2017-11-28 00:00',800,1);
INSERT INTO ingressos VALUES (2,'Único',80.00,'2017-09-25 12:00','2017-11-26 00:00',700,2);
INSERT INTO ingressos VALUES (3,'Único',95.00,'2017-11-05 06:00','2017-12-10 00:00',1200,3);


INSERT INTO percursos VALUES (1,'caminho da imagem',9,1);
INSERT INTO percursos VALUES (2,'caminho da imagem',4.5,1);
INSERT INTO percursos VALUES (3,'caminho da imagem',10,2);
INSERT INTO percursos VALUES (4,'caminho da imagem',12,3);


INSERT INTO rankings VALUES (1,'Corridas Geral Juiz de Fora',5, 1);
INSERT INTO rankings VALUES (2,'Corridas Premium',10, 1);
INSERT INTO rankings VALUES (3,'Corridas do sudeste de Minas',7, 2);

INSERT INTO corridas_ranking VALUES(1, 1, 1);
INSERT INTO corridas_ranking VALUES(2, 2, 1);
INSERT INTO corridas_ranking VALUES(3, 3, 1);
INSERT INTO corridas_ranking VALUES(4, 1, 2);
INSERT INTO corridas_ranking VALUES(5, 2, 2);

INSERT INTO pontuacoes VALUES(1, 50,1);
INSERT INTO pontuacoes VALUES(2, 30,1);
INSERT INTO pontuacoes VALUES(3, 20,1);
INSERT INTO pontuacoes VALUES(1, 60,2);
INSERT INTO pontuacoes VALUES(2, 35,2);
INSERT INTO pontuacoes VALUES(3, 20,2);
INSERT INTO pontuacoes VALUES(1, 75,3);
INSERT INTO pontuacoes VALUES(2, 45,3);
INSERT INTO pontuacoes VALUES(3, 35,3);
INSERT INTO pontuacoes VALUES(4, 25,3);
INSERT INTO pontuacoes VALUES(5, 10,3);

INSERT INTO kits VALUES(1,'VIP','caminho imagem','Retornavel',1);
INSERT INTO kits VALUES(2,'Comum','caminho imagem','Descartavel',1);
INSERT INTO kits VALUES(3,'Premium','caminho imagem','Descartavel',2);
INSERT INTO kits VALUES(4,'Normal','caminho imagem','Descartavel',2);
INSERT INTO kits VALUES(5,'Especial','caminho imagem','Retornavel',3);
INSERT INTO kits VALUES(6,'Comum','caminho imagem','Descartavel',3);


INSERT INTO produtos_kit VALUES (1,'Número de Peito',5.00,1); 
INSERT INTO produtos_kit VALUES (2,'Chip Eletrônico',15.00,1); 
INSERT INTO produtos_kit VALUES (3,'Camiseta Tecido Tecnológico',35.00,1); 

INSERT INTO produtos_kit VALUES (4,'Número de Peito',5.00,2); 
INSERT INTO produtos_kit VALUES (5,'Chip Eletrônico',15.00,2); 

INSERT INTO produtos_kit VALUES (6,'Número de Peito',4.00,3); 
INSERT INTO produtos_kit VALUES (7,'Chip',12.00,3); 
INSERT INTO produtos_kit VALUES (8,'Camiseta',30.00,3); 

INSERT INTO produtos_kit VALUES (9,'Número de Peito',4.00,4); 
INSERT INTO produtos_kit VALUES (10,'Chip',12.00,4); 

INSERT INTO produtos_kit VALUES (11,'Número de Peito',5.00,5); 
INSERT INTO produtos_kit VALUES (12,'Chip Eletrônico',16.00,5); 
INSERT INTO produtos_kit VALUES (13,'Camisa',32.00,5); 

INSERT INTO produtos_kit VALUES (14,'Número de Peito',5.00,6); 
INSERT INTO produtos_kit VALUES (15,'Chip Eletrônico',16.00,6); 


-- INSCRIÇÕES CORRIDA 1
-- data compra, número peito, tempo percorrido, forma pagamento, pago, corridasId, atletasId, kitsId
 
INSERT INTO inscricoes VALUES (1,'2017-09-15 17:25:20','1','01:20:15',1,1,1,1,1);
INSERT INTO inscricoes VALUES (2,'2017-09-16 15:22:11','2','01:12:10',0,1,1,2,2);
INSERT INTO inscricoes VALUES (3,'2017-09-10 12:22:11','3','01:21:12',0,1,1,3,2);
INSERT INTO inscricoes VALUES (4,'2017-09-12 16:22:11','4','01:24:42',1,1,1,4,1);

-- INSCRIÇÕES CORRIDA 2
INSERT INTO inscricoes VALUES (5,'2017-09-18 17:32:11','1','00:00:00',1,1,2,1,1);
INSERT INTO inscricoes VALUES (6,'2017-09-19 09:28:23','2','00:00:00',1,0,2,2,1);
INSERT INTO inscricoes VALUES (7,'2017-09-25 12:22:13','3','00:00:00',0,0,2,3,2);

