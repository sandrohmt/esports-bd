DELIMITER $$

CREATE PROCEDURE InserirDesempenhoTime (
    IN p_IdTime INT,
    IN p_IdTorneio INT,
    IN p_Vitorias INT,
    IN p_Derrotas INT,
    IN p_PosicaoFinal INT,
    IN p_FoiCampeao BOOLEAN,
    IN p_Premio DECIMAL(10, 2)
)
BEGIN

    INSERT INTO Desempenho_Time (
        IdTime, IdTorneio, Vitorias, Derrotas, PosicaoFinal,
        FoiCampeao, Premio 
    )
    VALUES (
        p_IdTime, p_IdTorneio, p_Vitorias, p_Derrotas, p_PosicaoFinal,
        p_FoiCampeao, p_Premio
    );

    UPDATE Estatistica_Time
    SET 
        Vitorias = Vitorias + p_Vitorias,
        Derrotas = Derrotas + p_Derrotas,
        Partidas = Partidas + p_Vitorias + p_Derrotas,  
        TorneiosJogados = TorneiosJogados + 1,
        PremiacaoTotal = PremiacaoTotal + p_Premio,
        VezesCampeao = VezesCampeao + CASE WHEN p_FoiCampeao THEN 1 ELSE 0 END
    WHERE Id = p_IdTime;
END$$

DELIMITER ;
