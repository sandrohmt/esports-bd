DELIMITER $$

CREATE PROCEDURE AtualizarRankingTime(IN p_IdCategoriaTime INT)
BEGIN

    CREATE TEMPORARY TABLE TempRanking AS
    SELECT 
        IdTime, 
        Pontuacao,
        ROW_NUMBER() OVER (ORDER BY Pontuacao DESC) AS NovaPosicao
    FROM Ranking_Time
    WHERE IdCategoriaTime = p_IdCategoriaTime;

    UPDATE Ranking_Time RT
    JOIN TempRanking TR
    ON RT.IdTime = TR.IdTime
    SET RT.Posicao = TR.NovaPosicao
    WHERE RT.IdCategoriaTime = p_IdCategoriaTime;

    DROP TEMPORARY TABLE TempRanking;
END$$

DELIMITER ;
