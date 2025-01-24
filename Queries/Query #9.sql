-- Consulta de países campeões mais de 5 vezes

SELECT 
    t.Pais,
    SUM(et.VezesCampeao) AS TotalVezesCampeao
FROM 
    Time t
JOIN 
    Estatistica_Time et ON t.Id = et.Id
GROUP BY 
    t.Pais
HAVING 
    SUM(et.VezesCampeao) > 5
ORDER BY 
    TotalVezesCampeao DESC;

CREATE INDEX idx_vezes_campeao_estatistica_time ON Estatistica_Time(VezesCampeao);
CREATE INDEX idx_pais_time ON Time(Pais);
CREATE INDEX idx_pais_time_hash ON Time(Pais) USING HASH;
CREATE INDEX idx_estatistica_time_id ON Estatistica_Time(Id);
CREATE INDEX idx_estatistica_time_id_hash ON Estatistica_Time(Id) USING HASH;
CREATE INDEX idx_time_id ON Time(Id);
CREATE INDEX idx_time_id_hash ON Time(Id) USING HASH;
