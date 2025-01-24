-- Consulta de contratos com jogadores times com nacionalidades diferentes

SELECT 
    j.Nome AS NomeJogador,
    t.Nome AS NomeTime,
    j.Nacionalidade AS NacionalidadeJogador,
    t.pais AS PaisTime,
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
    j.Nacionalidade != t.pais;

CREATE INDEX idx_nacionalidade_jogador ON Jogador (Nacionalidade);
CREATE INDEX idx_nacionalidade_jogador_Hash ON Jogador (Nacionalidade) USING HASH;
CREATE INDEX idx_pais_time ON Time (Pais);
CREATE INDEX idx_pais_time_Hash ON Time (Pais) USING HASH;
CREATE INDEX idx_contrato_jogador ON Contrato (IdJogador);
CREATE INDEX idx_contrato_jogador_Hash ON Contrato (IdJogador) USING HASH;
CREATE INDEX idx_contrato_time ON Contrato (IdTime);
CREATE INDEX idx_contrato_time_Hash ON Contrato (IdTime) USING HASH;
