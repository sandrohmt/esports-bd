DELIMITER $$

CREATE PROCEDURE AtualizarRankingJogador(IN p_IdCategoriaJogador INT)
BEGIN

    CREATE TEMPORARY TABLE TempRanking AS
    SELECT 
        IdJogador, 
        Pontuacao,
        ROW_NUMBER() OVER (ORDER BY Pontuacao DESC) AS NovaPosicao
    FROM Ranking_Jogador
    WHERE IdCategoriaJogador = p_IdCategoriaJogador;

    UPDATE Ranking_Jogador RJ
    JOIN TempRanking TR
    ON RJ.IdJogador = TR.IdJogador
    SET RJ.Posicao = TR.NovaPosicao
    WHERE RJ.IdCategoriaJogador = p_IdCategoriaJogador;

    DROP TEMPORARY TABLE TempRanking;
END$$

DELIMITER ;