CREATE TABLE Time (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100) NOT NULL,
	Pais VARCHAR(50) NOT NULL,
	Treinador VARCHAR(100) NOT NULL
);

CREATE TABLE Jogador (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nick VARCHAR(50) NOT NULL UNIQUE,
	Nome VARCHAR(100) NOT NULL,
	Idade INT NOT NULL,
	DataNasc DATE NOT NULL,
	Nacionalidade VARCHAR(50) NOT NULL,
	Mouse VARCHAR(50),
	Teclado VARCHAR(50),
	Headset VARCHAR(50)
);

CREATE TABLE Evento (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100) NOT NULL,
	DataInicio DATE NOT NULL,
	DataFim DATE,
	Organizador VARCHAR(100) NOT NULL
);

CREATE TABLE Jogo (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100) NOT NULL,
	Genero VARCHAR(50),
	Desenvolvedora VARCHAR(100),
	Versao VARCHAR(50),
	Plataforma VARCHAR(50)
);

CREATE TABLE Torneio (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	IdEvento INT NOT NULL,
	IdJogo INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Premiacao DECIMAL(10, 2) NOT NULL,
	Local VARCHAR(100) NOT NULL,
	IdTimeVencedor INT,
	DataInicio DATE NOT NULL,
	DataFim DATE,
	FOREIGN KEY (IdEvento) REFERENCES Evento(Id),
	FOREIGN KEY (IdJogo) REFERENCES Jogo(Id),
	FOREIGN KEY (IdTimeVencedor) REFERENCES Time(Id)
);

CREATE TABLE Transmissao (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	IdEvento INT NOT NULL,
	Canal VARCHAR(100) NOT NULL,
	Narrador VARCHAR(100) NOT NULL,
	Comentarista VARCHAR(100) NOT NULL,
	Plataforma VARCHAR(50) NOT NULL,
	TotalVisualizacoes INT,
	FOREIGN KEY (IdEvento) REFERENCES Evento(Id)
);

CREATE TABLE Desempenho_Time (
	IdTime INT NOT NULL,
	IdTorneio INT NOT NULL,
	Vitorias INT DEFAULT 0,
	Derrotas INT DEFAULT 0,
	PosicaoFinal INT,
    FoiCampeao BOOLEAN,
	Premio DECIMAL(10, 2) NOT NULL,
	PRIMARY KEY (IdTime, IdTorneio),
	FOREIGN KEY (IdTime) REFERENCES Time(Id),
	FOREIGN KEY (IdTorneio) REFERENCES Torneio(Id)
);

CREATE TABLE Partida (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	IdTime INT NOT NULL,
	IdTorneio INT NOT NULL,
	DataPartida DATE NOT NULL,
	Placar VARCHAR(50) NOT NULL,
	IdTimeVencedor INT NOT NULL,
	IdTimePerdedor INT NOT NULL,
	FOREIGN KEY (IdTime, IdTorneio) REFERENCES Desempenho_Time(IdTime, IdTorneio),
	FOREIGN KEY (IdTimeVencedor) REFERENCES Time(Id),
	FOREIGN KEY (IdTimePerdedor) REFERENCES Time(Id)
);


CREATE TABLE Estatistica_Time (
	Id INT PRIMARY KEY,
	Vitorias INT DEFAULT 0,
	Derrotas INT DEFAULT 0,
	Partidas INT DEFAULT 0,
	TorneiosJogados INT DEFAULT 0,
	VezesCampeao INT DEFAULT 0,
	PremiacaoTotal DECIMAL(10, 2) DEFAULT 0,
	FOREIGN KEY (Id) REFERENCES Time(Id)
);

CREATE TABLE Ingresso (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	IdEvento INT NOT NULL,
	Valor DECIMAL(10, 2) NOT NULL,
	DataVendaInicio DATE NOT NULL,
	DataVendaFim DATE NOT NULL,
	Lote VARCHAR(50) NOT NULL,
	TipoAssento VARCHAR(50) NOT NULL,
	FOREIGN KEY (IdEvento) REFERENCES Evento(Id)
);

CREATE TABLE Estatistica_Jogador (
	Id INT PRIMARY KEY,
	Abates INT DEFAULT 0,
	Mortes INT DEFAULT 0,
	Assistencias INT DEFAULT 0,
	Vitorias INT DEFAULT 0,
	Derrotas INT DEFAULT 0,
	Partidas INT DEFAULT 0,
	VezesCampeao INT DEFAULT 0,
	PremiacaoTotal DECIMAL(10, 2) DEFAULT 0,
	FOREIGN KEY (Id) REFERENCES Jogador(Id)
);

CREATE TABLE Categoria_Jogador (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
	Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE Ranking_Jogador (
	IdJogador INT NOT NULL,
	IdCategoriaJogador INT NOT NULL,
	Pontuacao DECIMAL(10, 2) DEFAULT 0,
	Posicao INT DEFAULT 0,
	PRIMARY KEY (IdJogador, IdCategoriaJogador),
	FOREIGN KEY (IdJogador) REFERENCES Jogador(Id),
	FOREIGN KEY (IdCategoriaJogador) REFERENCES Categoria_Jogador(Id)
);

CREATE TABLE Categoria_Time (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
	Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE Ranking_Time (
	IdTime INT NOT NULL,
	IdCategoriaTime INT NOT NULL,
	Pontuacao DECIMAL(10, 2) DEFAULT 0,
	Posicao INT DEFAULT 0,
	PRIMARY KEY (IdTime, IdCategoriaTime),
	FOREIGN KEY (IdTime) REFERENCES Time(Id),
	FOREIGN KEY (IdCategoriaTime) REFERENCES Categoria_Time(Id)
);

CREATE TABLE Patrocinador (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100) NOT NULL,
	Setor VARCHAR(50),
	Pais VARCHAR(50) NOT NULL
);

CREATE TABLE Patrocinio (
	IdPatrocinador INT NOT NULL,
	IdTime INT NOT NULL,
	ValorContrato DECIMAL(10, 2) NOT NULL,
	DataInicio DATE NOT NULL,
	DataFim DATE,
	PRIMARY KEY (IdPatrocinador, IdTime),
	FOREIGN KEY (IdPatrocinador) REFERENCES Patrocinador(Id),
	FOREIGN KEY (IdTime) REFERENCES Time(Id)
);

CREATE TABLE Contrato (
	IdJogador INT NOT NULL,
	IdTime INT NOT NULL,
	DataInicio DATE NOT NULL,
	DataFim DATE,
	Salario DECIMAL(10, 2) NOT NULL,
	PRIMARY KEY (IdJogador, IdTime),
	FOREIGN KEY (IdJogador) REFERENCES Jogador(Id),
	FOREIGN KEY (IdTime) REFERENCES Time(Id)
);

CREATE TABLE Desempenho_Jogador (
	IdTime INT NOT NULL,
	IdTorneio INT NOT NULL,
    IdJogador INT NOT NULL,
    Abates INT DEFAULT 0,
    Mortes INT DEFAULT 0,
    Assistencias INT DEFAULT 0,
    Vitorias INT, 
    Derrotas INT,
    Premio DECIMAL(10, 2) NOT NULL,
    FoiCampeao BOOLEAN,
	PRIMARY KEY (IdTime, IdTorneio, IdJogador),
    FOREIGN KEY (IdTime, IdTorneio) REFERENCES Desempenho_Time(IdTime, IdTorneio),
    FOREIGN KEY (IdJogador) REFERENCES Jogador(Id)
);

CREATE TABLE Regras (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE Regras_Torneio (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    IdRegra INT NOT NULL,
    IdTorneio INT NOT NULL,
    FOREIGN KEY (IdRegra) REFERENCES Regras(Id),
    FOREIGN KEY (IdTorneio) REFERENCES Torneio(Id)
);
