DELIMITER $$

CREATE TRIGGER AddResultadoPartida 
AFTER INSERT ON Partida
FOR EACH ROW 
BEGIN
	IF EXISTS (SELECT 1 FROM Estatistica_Time WHERE Id = NEW.IdTimeVencedor) THEN
		UPDATE Estatistica_Time
        SET
			Vitorias = Vitorias + 1,
            Partidas = Partidas + 1
		WHERE Id = NEW.IdTimeVencedor;
        
	END IF;
    
    IF EXISTS (SELECT 1 FROM Estatistica_Time WHERE Id = NEW.IdTimePerdedor) THEN
		UPDATE Estatistica_Time
        SET
			Derrotas = Derrotas + 1,
            Partidas = Partidas + 1
		WHERE Id = NEW.IdTimePerdedor;
    END IF;
END $$

DELIMITER ;