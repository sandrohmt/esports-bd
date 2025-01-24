DELIMITER $$

CREATE PROCEDURE InserirDesempenhoJogador (
    IN p_IdTime INT,
    IN p_IdTorneio INT,
    IN p_IdJogador INT,
    IN p_Abates INT,
    IN p_Mortes INT,
    IN p_Assistencias INT,
    IN p_Vitorias INT,
    IN p_Derrotas INT,
    IN p_Premio DECIMAL(10, 2),
    IN p_FoiCampeao BOOLEAN
)
BEGIN
    INSERT INTO Desempenho_Jogador (
        IdTime, IdTorneio, IdJogador, 
        Abates, Mortes, Assistencias, Vitorias, Derrotas, 
        Premio, FoiCampeao
    )
    VALUES (
        p_IdTime, p_IdTorneio, p_IdJogador, 
        p_Abates, p_Mortes, p_Assistencias, p_Vitorias, p_Derrotas, 
        p_Premio, p_FoiCampeao
    );

    UPDATE Estatistica_Jogador
    SET 
        Abates = Abates + p_Abates,
        Mortes = Mortes + p_Mortes,
        Assistencias = Assistencias + p_Assistencias,
        Vitorias = Vitorias + p_Vitorias,
        Derrotas = Derrotas + p_Derrotas,
        Partidas = Partidas + p_Vitorias + p_Derrotas, 
        PremiacaoTotal = PremiacaoTotal + p_Premio,
        VezesCampeao = VezesCampeao + CASE WHEN p_FoiCampeao THEN 1 ELSE 0 END
    WHERE Id = p_IdJogador;
END$$

DELIMITER ;
