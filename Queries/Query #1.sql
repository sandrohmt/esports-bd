-- Consulta de Jogador com salário maior que 500000 com contrato iniciado em 2024

SELECT 
    c.IdJogador, 
    j.Nick AS Jogador, 
    t.Nome AS Time, 
    c.DataInicio, 
    c.DataFim, 
    c.Salario
FROM 
    Contrato c
JOIN 
    Jogador j ON c.IdJogador = j.Id
JOIN 
    Time t ON c.IdTime = t.Id
WHERE 
    c.Salario > 5000000.00 
    AND c.DataInicio >= '2024-01-01';

CREATE INDEX idx_salario_Contrato ON Contrato(Salario);
CREATE INDEX idx_data_inicio_Contrato ON Contrato(DataInicio);
CREATE INDEX idx_idjogador_contrato_Hash ON Contrato(IdJogador) USING HASH; 
CREATE INDEX idx_idjogador_contrato ON Contrato(IdJogador);
CREATE INDEX idx_idtime_contrato_Hash ON Contrato(IdTime) USING HASH;
CREATE INDEX idx_idtime_contrato ON Contrato(IdTime);