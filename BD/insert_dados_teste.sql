INSERT INTO administrador VALUES(DEFAULT, 'adm1@email.com', '111111');
INSERT INTO administrador VALUES(DEFAULT, 'adm2@email.com', '222222');
INSERT INTO administrador VALUES(DEFAULT, 'adm3@email.com', '333333');

INSERT INTO tamanhos_camisas VALUES (DEFAULT,'P');
INSERT INTO tamanhos_camisas VALUES (DEFAULT,'M');
INSERT INTO tamanhos_camisas VALUES (DEFAULT,'G');

INSERT INTO atletas VALUES (
	DEFAULT,
    'Rafael Lana',
    'Lana',
    'rafael@gmail.com',
    '123456',
    1,
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
    2
);

INSERT INTO atletas VALUES (
	DEFAULT,
    'Arielson Altino',
    'Ariel',
    'arielson@gmail.com',
    '123456',
    1,
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
    3
);

INSERT INTO atletas VALUES (
	DEFAULT,
    'Jonas Gomes',
    'JJ',
    'jonas@gmail.com',
    '123456',
    1,
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
    3
);

INSERT INTO atletas VALUES (
	DEFAULT,
    'Lana Del Rey',
    'Lana',
    'lanadelrey@gmail.com',
    'darkparadise',
    0,
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
    1
);

INSERT INTO organizadores VALUES (
	DEFAULT,
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
	DEFAULT,
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
	DEFAULT,
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
	DEFAULT,
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
	DEFAULT,
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


INSERT INTO ingressos VALUES (DEFAULT,'Único',60.00,'2017-10-15 00:00','2017-11-28 00:00',800,1);
INSERT INTO ingressos VALUES (DEFAULT,'Único',80.00,'2017-09-25 12:00','2017-11-26 00:00',700,2);
INSERT INTO ingressos VALUES (DEFAULT,'Único',95.00,'2017-11-05 06:00','2017-12-10 00:00',1200,3);


INSERT INTO percursos VALUES (DEFAULT,'caminho da imagem',9,1);
INSERT INTO percursos VALUES (DEFAULT,'caminho da imagem',4.5,1);
INSERT INTO percursos VALUES (DEFAULT,'caminho da imagem',10,2);
INSERT INTO percursos VALUES (DEFAULT,'caminho da imagem',12,3);


INSERT INTO rankings VALUES (DEFAULT,'Corridas Geral Juiz de Fora',5, 1);
INSERT INTO rankings VALUES (DEFAULT,'Corridas Premium',10, 1);
INSERT INTO rankings VALUES (DEFAULT,'Corridas do sudeste de Minas',7, 2);

INSERT INTO corridas_ranking VALUES(DEFAULT, 1, 1);
INSERT INTO corridas_ranking VALUES(DEFAULT, 2, 1);
INSERT INTO corridas_ranking VALUES(DEFAULT, 3, 1);
INSERT INTO corridas_ranking VALUES(DEFAULT, 1, 2);
INSERT INTO corridas_ranking VALUES(DEFAULT, 2, 2);

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

INSERT INTO kits VALUES(DEFAULT,'VIP','caminho imagem','Retornavel',1);
INSERT INTO kits VALUES(DEFAULT,'Comum','caminho imagem','Descartavel',1);
INSERT INTO kits VALUES(DEFAULT,'Premium','caminho imagem','Descartavel',2);
INSERT INTO kits VALUES(DEFAULT,'Normal','caminho imagem','Descartavel',2);
INSERT INTO kits VALUES(DEFAULT,'Especial','caminho imagem','Retornavel',3);
INSERT INTO kits VALUES(DEFAULT,'Comum','caminho imagem','Descartavel',3);


INSERT INTO produtos_kit VALUES (DEFAULT,'Número de Peito',5.00,1); 
INSERT INTO produtos_kit VALUES (DEFAULT,'Chip Eletrônico',15.00,1); 
INSERT INTO produtos_kit VALUES (DEFAULT,'Camiseta Tecido Tecnológico',35.00,1); 

INSERT INTO produtos_kit VALUES (DEFAULT,'Número de Peito',5.00,2); 
INSERT INTO produtos_kit VALUES (DEFAULT,'Chip Eletrônico',15.00,2); 

INSERT INTO produtos_kit VALUES (DEFAULT,'Número de Peito',4.00,3); 
INSERT INTO produtos_kit VALUES (DEFAULT,'Chip',12.00,3); 
INSERT INTO produtos_kit VALUES (DEFAULT,'Camiseta',30.00,3); 

INSERT INTO produtos_kit VALUES (DEFAULT,'Número de Peito',4.00,4); 
INSERT INTO produtos_kit VALUES (DEFAULT,'Chip',12.00,4); 

INSERT INTO produtos_kit VALUES (DEFAULT,'Número de Peito',5.00,5); 
INSERT INTO produtos_kit VALUES (DEFAULT,'Chip Eletrônico',16.00,5); 
INSERT INTO produtos_kit VALUES (DEFAULT,'Camisa',32.00,5); 

INSERT INTO produtos_kit VALUES (DEFAULT,'Número de Peito',5.00,6); 
INSERT INTO produtos_kit VALUES (DEFAULT,'Chip Eletrônico',16.00,6); 


-- INSCRIÇÕES CORRIDA 1
-- data compra, número peito, tempo percorrido, forma pagamento, pago, corridasId, atletasId, kitsId
 
INSERT INTO inscricoes VALUES (DEFAULT,'2017-09-15 17:25:20','1','01:20:15',1,1,1,1,1);
INSERT INTO inscricoes VALUES (DEFAULT,'2017-09-16 15:22:11','2','01:12:10',0,1,1,2,2);
INSERT INTO inscricoes VALUES (DEFAULT,'2017-09-10 12:22:11','3','01:21:12',0,1,1,3,2);
INSERT INTO inscricoes VALUES (DEFAULT,'2017-09-12 16:22:11','4','01:24:42',1,1,1,4,1);

-- INSCRIÇÕES CORRIDA 2
INSERT INTO inscricoes VALUES (DEFAULT,'2017-09-18 17:32:11','1','00:00:00',1,1,2,1,1);
INSERT INTO inscricoes VALUES (DEFAULT,'2017-09-19 09:28:23','2','00:00:00',1,0,2,2,1);
INSERT INTO inscricoes VALUES (DEFAULT,'2017-09-25 12:22:13','3','00:00:00',0,0,2,3,2);


