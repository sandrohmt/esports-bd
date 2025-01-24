-- Consulta de times canadenses ranking 1 em qualquer categoria

SELECT DISTINCT
    t.Id AS TimeId,
    t.Nome AS NomeTime,
    t.Pais,
    t.Treinador,
    rt.Pontuacao,
    ct.Nome AS Categoria,
    ct.Descricao
FROM
    Time t
JOIN
    Ranking_Time rt ON t.Id = rt.IdTime
JOIN
    Categoria_Time ct ON ct.Id = rt.IdCategoriaTime
WHERE
    t.Pais = 'Canadá'
    AND rt.Posicao = 1;

CREATE INDEX idx_time_pais ON Time(Pais);
CREATE INDEX idx_time_pais_Hash ON Time(Pais) USING HASH;
CREATE INDEX idx_ranking_time_posicao ON Ranking_Time(Posicao);
CREATE INDEX idx_ranking_time_posicao_Hash ON Ranking_Time(Posicao) USING HASH;
CREATE INDEX idx_ranking_time_idtime ON Ranking_Time(IdTime);
CREATE INDEX idx_ranking_time_idtime_Hash ON Ranking_Time(IdTime) USING HASH;
CREATE INDEX idx_ranking_time_idcategoriatime ON Ranking_Time(IdCategoriaTime);
CREATE INDEX idx_ranking_time_idcategoriatime_Hash ON Ranking_Time(IdCategoriaTime) USING HASH;
