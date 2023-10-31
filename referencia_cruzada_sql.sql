-- Exercícios
-- 1.1 Monte uma tabela de referência cruzada que mostre, para cada localização, a média de
-- dias de chuva por mês. O resultado deve ser parecido com aquele exibido pela Figura 1.1.1.

SELECT * FROM crosstab(
	'SELECT
		location,
		month,
		AVG(raindays)
	FROM
		rainfalls
	GROUP BY
		location, month
	ORDER BY location , month;'
)AS tab_ref_cruzada_month(
	"location" TEXT,
	"jan" NUMERIC (10),
	"fev" NUMERIC (10),
	"mar" NUMERIC (10),
	"abr" NUMERIC (10),
	"mai" NUMERIC (10),
	"jun" NUMERIC (10),
	"jul" NUMERIC (10),
	"ago" NUMERIC (10),
	"set" NUMERIC (10),
	"out" NUMERIC (10),
	"nov" NUMERIC (10),
	"dez" NUMERIC (10)	
);


-- SELECT * FROM rainfalls

-- SELECT * FROM crosstab(
-- 	'SELECT
-- 		location,
-- 		year,
-- 		SUM(raindays)
-- 	FROM
-- 		rainfalls
-- 	GROUP BY
-- 		location, year
-- 	ORDER BY location , year;'
-- )AS tab_ref_cruzada(
-- 	"location" TEXT,
-- 	"2012" BIGINT,
-- 	"2013" BIGINT,
-- 	"2014" BIGINT,
-- 	"2015" BIGINT,
-- 	"2016" BIGINT,
-- 	"2017" BIGINT
-- );

-- INSTALANDO A EXTENSÃO PARA FAZER A TABELA CRUZADA
-- CREATE EXTENSION IF NOT EXISTS tablefunc ;

-- SELECIONANDO A EXTENSÃO
-- SELECT * FROM pg_extension ;

-- CREATE TABLE tb_nota(
-- 	cod_nota SERIAL PRIMARY KEY,
-- 	nome_aluno VARCHAR(200) NOT NULL,
-- 	disciplina VARCHAR(200) NOT NULL,
-- 	nota NUMERIC (10,2) NOT NULL,
-- 	data_obtencao DATE
-- ); 

-- INSERT INTO tb_nota(
-- 	nome_aluno,disciplina,nota,data_obtencao)
-- VALUES
-- ('Ana','Matemática',9,'2020-04-02'),
-- ('Ana','Inglês',10,'2020-04-03'),
-- ('Ana','Biologia',8,'2020-04-04'),
-- ('Ana','História',10,'2020-04-05'),
-- ('João','Matemática',7,'2020-04-02'),
-- ('João','Inglês',10,'2020-04-03'),
-- ('João','Biologia',7,'2020-04-04'),
-- ('João','História',7,'2020-04-05');

-- FAZENDO O "PROCV"
-- SELECT * FROM crosstab(
-- 	'
-- 		SELECT
-- 			-- uma linha por nome de aluno
-- 			nome_aluno,
-- 			-- uma coluna por disciplina
-- 			disciplina,
-- 			-- cada célula tem uma nota
-- 			nota
-- 		FROM tb_nota
-- 		ORDER BY nome_aluno , disciplina ;
-- 	'
-- ) AS tb_ref_cruzada(
-- 	nome VARCHAR (200),
-- 	biologia NUMERIC (10,2),
-- 	história NUMERIC (10,2),
-- 	ingles NUMERIC (10,2),
-- 	matematica NUMERIC (10,2)
-- )
