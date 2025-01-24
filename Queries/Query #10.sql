-- Todos os times que ganharam em Janeiro de 2025

SELECT 
    t.Nome AS NomeTime,
    t.Pais,
    p.DataPartida
FROM 
    Partida p
JOIN 
    Time t ON p.IdTimeVencedor = t.Id
WHERE 
    p.DataPartida BETWEEN '2025-01-01' AND '2025-01-31';

CREATE INDEX idx_data_partida_partida ON Partida(DataPartida);
CREATE INDEX idx_time_idtime ON Time(id);
CREATE INDEX idx_partida_idtimevencedor ON Partida(IdTimeVencedor);