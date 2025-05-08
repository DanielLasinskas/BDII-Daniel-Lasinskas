create database brazillianleague;
USE brazillianleague;


CREATE TABLE Times (
    ID_Times INT PRIMARY KEY NOT NULL,
    Elenco TEXT NOT NULL,
    Uniforme VARCHAR(50) NOT NULL,
    Títulos INT,
    Estádio VARCHAR(100) NOT NULL
);


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


CREATE TABLE Jogos (
    ID_Jogos INT PRIMARY KEY NOT NULL,
    Data_Jogos DATE NOT NULL,
    Local_Jogos VARCHAR(100) NOT NULL,
    ID_Tabela_Classificação INT NOT NULL,
    ID_Times INT NOT NULL,
    FOREIGN KEY (ID_Tabela_Classificação) REFERENCES Tabela_Classificação(ID_Tabela_Classificação),
    FOREIGN KEY (ID_Times) REFERENCES Times(ID_Times)
);


CREATE TABLE Tabela_Classificação (
    ID_Tabela_Classificação INT PRIMARY KEY NOT NULL,
    Pontos INT NOT NULL,
    Vitórias INT NOT NULL,
    Empates INT NOT NULL,
    Derrotas INT NOT NULL,
    Gols_Marcados INT NOT NULL,
    Gols_Contra INT NOT NULL,
    Soma_de_Gols INT NOT NULL,
    ID_Times INT NOT NULL,
    ID_Jogos INT NOT NULL,
    FOREIGN KEY (ID_Times) REFERENCES Times(ID_Times),
    FOREIGN KEY (ID_Jogos) REFERENCES Jogos(ID_Jogos)
);


CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Time_Favorito INT NOT NULL,
    FOREIGN KEY (Time_Favorito) REFERENCES Times(ID_Times)
);


CREATE TABLE Aplicativo (
    ID_Aplicativo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    ID_Usuario INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);
