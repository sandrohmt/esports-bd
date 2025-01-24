-- Consulta de todos os contratos com mais de 4 anos de duração que terminaram antes de 2000

SELECT 
    j.Nome AS NomeJogador,
    t.Nome AS NomeTime,
    c.DataInicio,
    c.DataFim,
    c.Salario,
    DATEDIFF(c.DataFim, c.DataInicio) AS DuracaoContratoEmDias
FROM 
    Contrato c
JOIN 
    Jogador j ON c.IdJogador = j.Id
JOIN 
    Time t ON c.IdTime = t.Id
WHERE 
    DATEDIFF(c.DataFim, c.DataInicio) > 1460  
    AND YEAR(c.DataFim) < 2000;  

CREATE INDEX idx_data_inicio_contrato ON Contrato (DataInicio);
CREATE INDEX idx_data_fim_contrato ON Contrato (DataFim);
CREATE INDEX idx_contrato_jogador ON Contrato (IdJogador);
CREATE INDEX idx_contrato_jogador_Hash ON Contrato (IdJogador) USING HASH;
CREATE INDEX idx_contrato_time ON Contrato (IdTime);
CREATE INDEX idx_contrato_time_Hash ON Contrato (IdTime) USING HASH;
