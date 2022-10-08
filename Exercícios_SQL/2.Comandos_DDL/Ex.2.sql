CREATE DATABASE eleicao;
USE eleicao;

CREATE TABLE eleitor(
	titulo_eleitor VARCHAR(30) UNIQUE NOT NULL PRIMARY KEY,
    zona_eleitoral CHAR(5) NOT NULL,
    sessao_eleitoral CHAR(5) NOT NULL,
    nome VARCHAR(40) NOT NULL
);

CREATE TABLE cargo(
	codigo_cargo INT UNIQUE NOT NULL PRIMARY KEY,
    nome_cargo ENUM('Prefeito','Vereador'),
    salario FLOAT NOT NULL DEFAULT '17000',
    numero_vagas INT UNIQUE NOT NULL
);

CREATE TABLE partido(
	codigo_partido INT UNIQUE NOT NULL PRIMARY KEY,
    sigla CHAR(5) UNIQUE NOT NULL,
    nome VARCHAR(40) UNIQUE NOT NULL,
    numero INT UNIQUE NOT NULL
);

CREATE TABLE candidato(
	numero_candidato INT UNIQUE NOT NULL PRIMARY KEY,
    nome VARCHAR(40) UNIQUE NOT NULL,
    codigo_cargo INT NOT NULL,
    codigo_partido INT NOT NULL,
    CONSTRAINT fk_candidato_cargo FOREIGN KEY (cargo) REFERENCES cargo (codigo_cargo),
    CONSTRAINT fk_candidato_partido FOREIGN KEY (partido) REFERENCES partido (codigo_partido)
);

CREATE TABLE voto(
	titulo_eleitor VARCHAR(30) UNIQUE NOT NULL PRIMARY KEY,
    numero_candidato INT NOT NULL,
    CONSTRAINT fk_voto_candidato FOREIGN KEY (candidato) REFERENCES candidato (numero_candidato)
);




	
    