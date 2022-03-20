USE AP2
--Questão 3

--A) Consulta em uma tabela, que use SELECT, FROM, WHERE

SELECT *
FROM cursos
WHERE nomeCurso = 'Ciência da Computação';

--B) Consulta em uma tabela, que use SELECT, FROM funções de agregação (SUM, MIN, MAX, AVG etc.), sem agrupamento

SELECT COUNT(codAluno) as 'Quantidade de alunos cadastrados'
FROM alunos;

--C) Consulta em uma tabela, que use SELECT, FROM, funções de agregação (SUM, MIN, MAX, AVG etc.) e agrupamento (GROUP BY)

SELECT codProf, COUNT(codProf) AS 'Quantidade de cursos associados'
FROM profCursos
GROUP BY codProf;

--D) Consulta em uma tabela, que use SELECT, FROM, funções de agregação (SUM, MIN, MAX, AVG etc.), agrupamento (GROUP BY) e HAVING

SELECT codProf, COUNT(codProf) AS 'Quantidade de cursos associados'
FROM profCursos
GROUP BY codProf
HAVING codProf = 2;

--E) Consulta que relacione duas tabelas com junção, que use SELECT, FROM e WHERE

SELECT P.nome, P.email, PC.codCurso
FROM profCursos as pc, professores as p
WHERE PC.codProf = P.codProf;

--F) Consulta que relacione duas tabelas com junção, que use SELECT, FROM, WHERE e ORDER BY

SELECT P.nome, P.email, PC.codCurso
FROM profCursos as pc, professores as p
WHERE PC.codProf = P.codProf
ORDER BY codCurso;

--G) Consulta que relacione duas tabelas com junção e use SELECT, FROM, funções de agregação (SUM, MIN, MAX, AVG etc.), agrupamento (GROUP BY) e HAVING

SELECT P.nome, count(*) as 'Qt. cursos sendo ministrados' 
FROM profCursos PC
INNER JOIN professores P ON  PC.codProf = P.codProf
GROUP BY P.nome
HAVING count(*) > 0;

--H) Consulta que relacione três tabelas com junção e use SELECT, FROM, funções de agregação (SUM, MIN, MAX, AVG etc.), agrupamento (GROUP BY)

SELECT P.nome, count(P.nome) as 'Qt. cursos sendo ministrados', SUM(C.valorCredito) as 'Total de créditos'
FROM profCursos PC
INNER JOIN professores P ON  PC.codProf = P.codProf
INNER JOIN cursos C ON PC.codCurso = C.codCurso
GROUP BY P.nome, C.valorCredito;

--I) Consulta que relacione três ou mais tabelas com junção, usando os comandos que desejar, que não seja apenas apresentar todos os dados das tabelas, deve haver um contexto

SELECT P.nome as 'Nome do professor', P.email as 'E-mail para contato', C.nomeCurso as 'Curso que está ministrando', PC.chSemanal as 'Carga horária do curso'
FROM profCursos AS PC 
INNER JOIN professores P ON PC.codProf = P.codProf
INNER JOIN cursos C ON PC.codCurso = C.codCurso;

--J) Consulta que relacione quatro ou mais tabelas com junção, usando os comandos que desejar, que não seja apenas apresentar todos os dados das tabelas, deve haver um contexto


SELECT A.nome as 'Nome do aluno', C.nomeCurso as 'Curso', T.anoSemestre as 'Semestre', D.nome as 'Disciplinas por aluno'
FROM aluCursos AS AC 
INNER JOIN alunos A ON AC.codAluno = A.codAluno 
INNER JOIN cursos C ON AC.codCurso = C.codCurso
INNER JOIN turmas T ON AC.codCurso = T.codCurso
INNER JOIN disciplinas D ON D.codDisciplina = T.codDisciplina
ORDER BY A.nome