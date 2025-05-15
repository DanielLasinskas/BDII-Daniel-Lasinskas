DROP DATABASE IF EXISTS brazillianleague;
CREATE DATABASE brazillianleague;
USE brazillianleague;

-- Criar a tabela Times
CREATE TABLE Times (
    ID_Times INT PRIMARY KEY NOT NULL,
    Elenco TEXT NOT NULL,
    Uniforme VARCHAR(50) NOT NULL,
    Títulos INT,
    Estádio VARCHAR(100) NOT NULL
);

-- Criar a tabela Tabela_Classificação (deve ser criada antes de Jogos)
CREATE TABLE Tabela_Classificação (
    ID_Tabela_Classificação INT PRIMARY KEY NOT NULL,
    ID_Times INT NOT NULL,
    Pontos INT NOT NULL,
    Vitórias INT NOT NULL,
    Empates INT NOT NULL,
    Derrotas INT NOT NULL,
    Gols_Marcados INT NOT NULL,
    Gols_Contra INT NOT NULL,
    Soma_de_Gols INT NOT NULL,
    FOREIGN KEY (ID_Times) REFERENCES Times(ID_Times)
);

-- Criar a tabela Jogos (faz referência a Tabela_Classificação e Times)
CREATE TABLE Jogos (
    ID_Jogos INT PRIMARY KEY NOT NULL,
    ID_Times INT NOT NULL,
    ID_Tabela_Classificação INT NOT NULL,
    Data_Jogos DATE NOT NULL,
    Local_Jogos VARCHAR(100) NOT NULL,
    FOREIGN KEY (ID_Tabela_Classificação) REFERENCES Tabela_Classificação(ID_Tabela_Classificação),
    FOREIGN KEY (ID_Times) REFERENCES Times(ID_Times)
);

-- Criar a tabela Jogador
CREATE TABLE Jogador (
    ID_Jogador INT PRIMARY KEY NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Posição VARCHAR(50) NOT NULL,
    Gols INT NOT NULL,
    Assistências INT NOT NULL,
    Jogos INT NOT NULL,
    Títulos INT NOT NULL,
    ID_Times INT NOT NULL,
    FOREIGN KEY (ID_Times) REFERENCES Times(ID_Times)
);

-- Criar a tabela Usuario
CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY,
    ID_Times INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Time_Favorito INT NOT NULL,
    FOREIGN KEY (Time_Favorito) REFERENCES Times(ID_Times)
);

-- Criar a tabela Aplicativo
CREATE TABLE Aplicativo (
    ID_Aplicativo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    ID_Usuario INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);
