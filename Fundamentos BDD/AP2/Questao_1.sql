CREATE DATABASE AP2
USE AP2
CREATE TABLE cursos(
codCurso int IDENTITY (1, 1),
nomeCurso varchar(50) NOT NULL UNIQUE,
valorCredito Money DEFAULT 0,
PRIMARY KEY (codCurso)
)

CREATE TABLE disciplinas(
codDisciplina int IDENTITY (1, 1),
nome varchar(50) NOT NULL UNIQUE,
qtCreditos int NOT NULL,
PRIMARY KEY (codDisciplina)
)

CREATE TABLE professores(
codProf int IDENTITY (1, 1),
nome varchar(100) NOT NULL UNIQUE,
email varchar(50) NOT NULL,
valorHora Money DEFAULT 0,
PRIMARY KEY (codProf)
)

CREATE TABLE alunos(
codAluno int IDENTITY (1, 1),
nome varchar(100) NOT NULL UNIQUE,
email varchar(50) NOT NULL,
PRIMARY KEY (codAluno)
)

CREATE TABLE profCursos(
codProf int, 
codCurso int, 
chSemanal int NOT NULL,
PRIMARY KEY (codProf, codCurso),
FOREIGN KEY (codProf) REFERENCES professores(codProf),
FOREIGN KEY (codCurso) REFERENCES cursos(codCurso)
)

CREATE TABLE aluCursos(
codAluno int, 
codCurso int, 
PRIMARY KEY (codAluno, codCurso),
FOREIGN KEY (codAluno) REFERENCES alunos(codAluno),
FOREIGN KEY (codCurso) REFERENCES cursos(codCurso)
)

CREATE TABLE turmas(
numTurma int, 
anoSemestre varchar(15) NOT NULL,
codCurso int, 
codDisciplina int, 
qtVagas int DEFAULT 0,
PRIMARY KEY (numTurma, anoSemestre),
FOREIGN KEY (codCurso) REFERENCES cursos(codCurso),
FOREIGN KEY (codDisciplina) REFERENCES disciplinas(codDisciplina),
)

CREATE TABLE matriculas(
numTurma int, 
anoSemestre varchar(15),
codAluno int, 
data date,
PRIMARY KEY (numTurma, anoSemestre, codAluno),
FOREIGN KEY (numTurma, anoSemestre) REFERENCES turmas(numTurma, anoSemestre),
FOREIGN KEY (codAluno) REFERENCES alunos(codAluno),
)

