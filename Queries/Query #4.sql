-- Consulta de times com taxa de vitória maior que 70% com quantidade de jogos mínima de 50

SELECT 
    t.Nome AS Time,
    et.Vitorias,
    et.Partidas,
    (et.Vitorias / et.Partidas) * 100 AS TaxaVitorias
FROM 
    Estatistica_Time et
JOIN 
    Time t ON et.Id = t.Id
WHERE 
    (et.Vitorias / et.Partidas) > 0.7
    AND et.Partidas >= 50;

CREATE INDEX idx_time_estatistica_time_id ON Estatistica_Time(Id);
CREATE INDEX idx_time_estatistica_time_id_Hash ON Estatistica_Time(Id) USING HASH;
CREATE INDEX idx_vitorias_Estatistica_Time ON Estatistica_Time(Vitorias);
CREATE INDEX idx_derrotas_Estatistica_Time ON Estatistica_Time(Derrotas);
CREATE INDEX idx_partidas_Estatistica_Time ON Estatistica_Time(Partidas);
