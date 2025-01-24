DELIMITER //

CREATE PROCEDURE SimularPartidasTorneio(IN p_IdTorneio INT, IN p_NumPartidas INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE time1 INT;
    DECLARE time2 INT;
    DECLARE placar1 INT;
    DECLARE placar2 INT;
    DECLARE vencedor INT;
    DECLARE perdedor INT;

    WHILE i <= p_NumPartidas DO
        SELECT Id INTO time1 FROM Time ORDER BY RAND() LIMIT 1;
        SELECT Id INTO time2 FROM Time WHERE Id <> time1 ORDER BY RAND() LIMIT 1;

        SET placar1 = FLOOR(RAND() * 10);
        SET placar2 = FLOOR(RAND() * 10);

        IF placar1 > placar2 THEN
            SET vencedor = time1;
            SET perdedor = time2;
        ELSE
            SET vencedor = time2;
            SET perdedor = time1;
        END IF;

        INSERT INTO Partida (IdTime, IdTorneio, DataPartida, Placar, IdTimeVencedor, IdTimePerdedor)
        VALUES (time1, p_IdTorneio, CURDATE(), CONCAT(placar1, ' x ', placar2), vencedor, perdedor);

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;
