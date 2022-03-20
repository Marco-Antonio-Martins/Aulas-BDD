USE AP2

INSERT INTO cursos(nomeCurso, valorCredito) VALUES ('Ciência da Computação', 4);
INSERT INTO cursos(nomeCurso, valorCredito) VALUES ('Engenharia de Software', 4);
INSERT INTO cursos(nomeCurso, valorCredito) VALUES ('Sistema da Informação', 4);

SELECT *
FROM cursos;

INSERT INTO disciplinas(nome, qtCreditos) VALUES ('FUNDAMENTOS DE BANCO DE DADOS', 170);
INSERT INTO disciplinas(nome, qtCreditos) VALUES ('ESTRUTURAS DE DADOS', 171);
INSERT INTO disciplinas(nome, qtCreditos) VALUES ('PLATAFORMAS COMPUTACIONAIS', 172);
INSERT INTO disciplinas(nome, qtCreditos) VALUES ('ENGENHARIA DE SOFTWARE', 173);
INSERT INTO disciplinas(nome, qtCreditos) VALUES ('PROGRAMAÇÃO ORIENTADA A OBJETOS', 174);

SELECT *
FROM disciplinas;

INSERT INTO professores(email, nome, valorHora) VALUES ('madialegal@rede.ulbra.br', 'Madianita Banana', 88.00);
INSERT INTO professores(email, nome, valorHora) VALUES ('fernandalegal@rede.ulbra.br', 'Fernanda do racha', 88.00);
INSERT INTO professores(email, nome, valorHora) VALUES ('fabianolegal@rede.ulbra.br', 'Fabiano o Mais Brabo de Konoha', 88.00);

SELECT *
FROM professores;

INSERT INTO profCursos(chSemanal, codCurso, codProf) VALUES (4, 1, 1);
INSERT INTO profCursos(chSemanal, codCurso, codProf) VALUES (4, 2, 1);
INSERT INTO profCursos(chSemanal, codCurso, codProf) VALUES (4, 2, 2);
INSERT INTO profCursos(chSemanal, codCurso, codProf) VALUES (4, 3, 2);
INSERT INTO profCursos(chSemanal, codCurso, codProf) VALUES (4, 1, 3);
INSERT INTO profCursos(chSemanal, codCurso, codProf) VALUES (4, 3, 3);

SELECT *
FROM profCursos;

INSERT INTO alunos(email, nome) VALUES ('ana@rede.ulbra.br', 'Ana Banana');
INSERT INTO alunos(email, nome) VALUES ('beto@rede.ulbra.br', 'Beto Bolado');
INSERT INTO alunos(email, nome) VALUES ('carlos@rede.ulbra.br', 'Carlos Cansado');
INSERT INTO alunos(email, nome) VALUES ('douglas@rede.ulbra.br', 'Douglas Doido');
INSERT INTO alunos(email, nome) VALUES ('eduardo@rede.ulbra.br', 'Eduardo Estranho');
INSERT INTO alunos(email, nome) VALUES ('fernanda@rede.ulbra.br', 'Fernanda Feia');

SELECT *
FROM alunos;

INSERT INTO aluCursos(codAluno, codCurso) VALUES (1,1);
INSERT INTO aluCursos(codAluno, codCurso) VALUES (2,1);
INSERT INTO aluCursos(codAluno, codCurso) VALUES (3,1);
INSERT INTO aluCursos(codAluno, codCurso) VALUES (4,2);
INSERT INTO aluCursos(codAluno, codCurso) VALUES (4,3);
INSERT INTO aluCursos(codAluno, codCurso) VALUES (5,3);
INSERT INTO aluCursos(codAluno, codCurso) VALUES (5,1);
INSERT INTO aluCursos(codAluno, codCurso) VALUES (6,1);
INSERT INTO aluCursos(codAluno, codCurso) VALUES (6,2);

SELECT *
FROM aluCursos;

INSERT INTO turmas(numTurma,anoSemestre, codCurso, codDisciplina, qtVagas) Values(1,'2021-1', 1, 1, 10);
INSERT INTO turmas(numTurma,anoSemestre, codCurso, codDisciplina, qtVagas) Values(2,'2021-2', 2, 2, 15);
INSERT INTO turmas(numTurma,anoSemestre, codCurso, codDisciplina, qtVagas) Values(3,'2021-2', 3, 3, 20);
INSERT INTO turmas(numTurma,anoSemestre, codCurso, codDisciplina, qtVagas) Values(4,'2021-1', 1, 4, 25);
INSERT INTO turmas(numTurma,anoSemestre, codCurso, codDisciplina, qtVagas) Values(5,'2021-1', 2, 5, 10);
INSERT INTO turmas(numTurma,anoSemestre, codCurso, codDisciplina, qtVagas) Values(6,'2021-1', 3, 5, 30);

SELECT *
FROM turmas;

INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(2,'2021-2', 1, '20/10/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(3,'2021-2', 1, '23/09/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(4,'2021-1', 1, '04/03/2021');

INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(1,'2021-1', 2, '25/03/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(2,'2021-2', 2, '03/08/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(5,'2021-1', 2, '22/04/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(6,'2021-1', 2, '18/04/2021');

INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(1,'2021-1', 3, '26/02/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(3,'2021-2', 3, '25/11/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(5,'2021-1', 3, '08/02/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(6,'2021-1', 3, '16/03/2021');

INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(2,'2021-2', 4, '15/07/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(3,'2021-2', 4, '12/09/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(4,'2021-1', 4, '19/05/2021');

INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(3,'2021-2', 5, '07/06/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(1,'2021-1', 5, '13/06/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(4,'2021-1', 5, '25/03/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(6,'2021-1', 5, '10/10/2021');

INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(1,'2021-1', 6, '09/06/2021');
INSERT INTO matriculas(numTurma, anoSemestre, codAluno, data) VALUES(3,'2021-2', 6, '16/07/2021');

SELECT *
FROM matriculas;

