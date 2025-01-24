-- Consulta de times brasileiros com mais de 5 patrocinios

SELECT t.Nome AS Time, COUNT(p.Id) AS TotalPatrocinadores
FROM Time t
JOIN Patrocinio pt ON t.Id = pt.IdTime
JOIN Patrocinador p ON pt.IdPatrocinador = p.Id
WHERE t.Pais = 'Brasil'
GROUP BY t.Id
HAVING COUNT(p.Id) > 5;

CREATE INDEX idx_Pais_Time ON Time(Pais);
CREATE INDEX idx_Pais_Time_Hash ON Time(Pais) USING HASH;
CREATE INDEX idx_idtime_patrocinio ON Patrocinio(IdTime);
CREATE INDEX idx_idtime_patrocinio_Hash ON Patrocinio(IdTime) USING HASH;
CREATE INDEX idx_idpatrocinador_patrocinio ON Patrocinio(IdPatrocinador);
CREATE INDEX idx_idpatrocinador_patrocinio_Hash ON Patrocinio(IdPatrocinador) USING HASH;
