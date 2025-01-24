CREATE VIEW JogosMaisPopulares AS
SELECT 
    J.Nome AS JogoNome,
    SUM(TS.TotalVisualizacoes) AS TotalVisualizacoes
FROM 
    Jogo J
JOIN 
    Torneio T ON J.Id = T.IdJogo
JOIN 
    Transmissao TS ON T.IdEvento = TS.IdEvento
GROUP BY 
    J.Id, J.Nome
ORDER BY 
    TotalVisualizacoes DESC;
