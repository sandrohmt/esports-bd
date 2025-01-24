CREATE VIEW JogadoresMaisVezesCampeoes AS
SELECT 
    J.Nick,
    J.Nome,
    E.VezesCampeao
FROM 
    Estatistica_Jogador E
JOIN 
    Jogador J ON E.Id = J.Id
ORDER BY 
    E.VezesCampeao DESC;
