
-- Dropa o banco anterior para criação de um novo
DROP DATABASE coristas;

-- Cria o banco de dados com um nome mais geral para o projeto
CREATE DATABASE IF NOT EXISTS orquestra_db;
USE orquestra_db;

-- Tabela para guardar os dados de login no sistema
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(50) NOT NULL UNIQUE, 
    senha VARCHAR(255) NOT NULL
);

-- Tabela de vozes
CREATE TABLE vozes (
    id_voz INT AUTO_INCREMENT PRIMARY KEY,
    tipo_voz ENUM('Soprano', 'Contralto', 'Tenor', 'Baixo', 'Intermediária') NOT NULL
);

-- Tabela de instrumentos
CREATE TABLE instrumentos (
    id_instrumento INT AUTO_INCREMENT PRIMARY KEY,
    nome_instrumento VARCHAR(50) NOT NULL,
    grupo ENUM('Cordas', 'Madeiras', 'Metais', 'Percussão') NOT NULL
);

-- Contém apenas o que é específico de um corista
CREATE TABLE coristas (
    id_corista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(14) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    id_voz INT,
    FOREIGN KEY (id_voz) REFERENCES vozes(id_voz)
);

-- Contém apenas o que é específico de um músico
CREATE TABLE musicos (
    id_musico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(14) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    id_instrumento INT,
    FOREIGN KEY (id_instrumento) REFERENCES instrumentos(id_instrumento)
);

-- Tabela de eventos
CREATE TABLE eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nome_evento VARCHAR(100),
    data_evento DATETIME NOT NULL, -- DATETIME permite guardar data e hora
    local_evento VARCHAR(255),
    tipo ENUM('Ensaio','Apresentação', 'Reunião')
);

CREATE TABLE presenca_coristas (
    id_evento INT,
    id_corista INT,
    presente BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_evento, id_corista),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_corista) REFERENCES coristas(id_corista)
);

CREATE TABLE presenca_musicos (
    id_evento INT,
    id_musico INT,
    presente BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_evento, id_musico),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_musico) REFERENCES musicos(id_musico)
);

-- Inserindo alguns dados iniciais para testes
INSERT INTO instrumentos (nome_instrumento) VALUES ('Violino'), ('Viola'), ('Violoncelo'), ('Contrabaixo'), ('Piano');

-- Criando um usuário padrão para podermos fazer o primeiro login
-- login: admin / senha: admin
INSERT INTO usuarios (login, senha) VALUES ('admin', 'admin');