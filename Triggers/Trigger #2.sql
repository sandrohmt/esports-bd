DELIMITER $$

CREATE TRIGGER AtualizarVezesCampeao 
AFTER INSERT ON Desempenho_Time
FOR EACH ROW 
BEGIN
	IF NEW.FoiCampeao = TRUE THEN
		UPDATE Estatistica_Time
		SET 
			VezesCampeao = VezesCampeao + 1,
			TorneiosJogados = TorneiosJogados + 1
        WHERE Id = NEW.IdTime;
    END IF;
END $$

DELIMITER ;