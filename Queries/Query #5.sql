-- Consulta de jogadores ranking 1 em qualquer categoria com 18 anos ou menos

SELECT
	j.Id,
    j.Nick,
    j.Idade,
    j.Nacionalidade,
    cj.Nome As Categoria,
    cj.Descricao,
    rj.Pontuacao
FROM
	Jogador j
JOIN 
	Ranking_Jogador rj ON j.id = rj.IdJogador
JOIN 	
	Categoria_Jogador cj ON cj.id = rj.IdCategoriaJogador
WHERE posicao = 1
AND Idade <= 18;

CREATE INDEX idx_ranking_posicao ON Ranking_Jogador(posicao);
CREATE INDEX idx_ranking_posicao_Hash ON Ranking_Jogador(posicao) USING HASH;
CREATE INDEX idx_jogador_idade ON Jogador(Idade);
CREATE INDEX idx_ranking_idjogador ON Ranking_Jogador(IdJogador);
CREATE INDEX idx_ranking_idjogador_Hash ON Ranking_Jogador(IdJogador) USING HASH;
CREATE INDEX idx_ranking_idcategoria ON Ranking_Jogador(IdCategoriaJogador);
CREATE INDEX idx_ranking_idcategoria_Hash ON Ranking_Jogador(IdCategoriaJogador) USING HASH;

