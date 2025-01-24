-- OBS: Aparentemente o MySQL não aceita criação de indexes hash. Então decidi criá-los mesmo assim onde eu julguei que deveriam ser criados, mas também fiz versões deles iguais só que usando b-tree.

-- Índices BTREE

CREATE INDEX idx_salario_Contrato ON Contrato(Salario);
CREATE INDEX idx_data_inicio_Contrato ON Contrato(DataInicio);
CREATE INDEX idx_idjogador_contrato ON Contrato(IdJogador);
CREATE INDEX idx_idtime_contrato ON Contrato(IdTime);
CREATE INDEX idx_idtime_patrocinio ON Patrocinio(IdTime);
CREATE INDEX idx_idpatrocinador_patrocinio ON Patrocinio(IdPatrocinador);
CREATE INDEX idx_valor_ingresso ON Ingresso(Valor);
CREATE INDEX idx_organizador_evento ON Evento(Organizador);
CREATE INDEX idx_idevento_ingresso ON Ingresso(IdEvento);
CREATE INDEX idx_time_estatistica_time_id ON Estatistica_Time(Id);
CREATE INDEX idx_vitorias_Estatistica_Time ON Estatistica_Time(Vitorias);
CREATE INDEX idx_derrotas_Estatistica_Time ON Estatistica_Time(Derrotas);
CREATE INDEX idx_partidas_Estatistica_Time ON Estatistica_Time(Partidas);
CREATE INDEX idx_ranking_posicao ON Ranking_Jogador(posicao);
CREATE INDEX idx_jogador_idade ON Jogador(Idade);
CREATE INDEX idx_ranking_idjogador ON Ranking_Jogador(IdJogador);
CREATE INDEX idx_ranking_idcategoria ON Ranking_Jogador(IdCategoriaJogador);
CREATE INDEX idx_time_pais ON Time(Pais);
CREATE INDEX idx_ranking_time_posicao ON Ranking_Time(Posicao);
CREATE INDEX idx_ranking_time_idtime ON Ranking_Time(IdTime);
CREATE INDEX idx_ranking_time_idcategoriatime ON Ranking_Time(IdCategoriaTime);
CREATE INDEX idx_data_fim_contrato ON Contrato (DataFim);
CREATE INDEX idx_vezes_campeao_estatistica_time ON Estatistica_Time(VezesCampeao);
CREATE INDEX idx_time_id ON Time(Id);
CREATE INDEX idx_data_partida_partida ON Partida(DataPartida);
CREATE INDEX idx_partida_idtimevencedor ON Partida(IdTimeVencedor);

-- Índices HASH

CREATE INDEX idx_idjogador_contrato_Hash ON Contrato(IdJogador) USING HASH; 
CREATE INDEX idx_idtime_contrato_Hash ON Contrato(IdTime) USING HASH;
CREATE INDEX idx_idtime_patrocinio_Hash ON Patrocinio(IdTime) USING HASH;
CREATE INDEX idx_idpatrocinador_patrocinio_Hash ON Patrocinio(IdPatrocinador) USING HASH;
CREATE INDEX idx_organizador_evento_Hash ON Evento(Organizador) USING HASH;
CREATE INDEX idx_idevento_ingresso_Hash ON Ingresso(IdEvento) USING HASH;
CREATE INDEX idx_time_estatistica_time_id_Hash ON Estatistica_Time(Id) USING HASH;
CREATE INDEX idx_ranking_posicao_Hash ON Ranking_Jogador(posicao) USING HASH;
CREATE INDEX idx_ranking_idjogador_Hash ON Ranking_Jogador(IdJogador) USING HASH;
CREATE INDEX idx_ranking_idcategoria_Hash ON Ranking_Jogador(IdCategoriaJogador) USING HASH;
CREATE INDEX idx_time_ranking_timetimepais_Hash ON Time(Pais) USING HASH;
CREATE INDEX idx_ranking_time_posicao_Hash ON Ranking_Time(Posicao) USING HASH;
CREATE INDEX idx_ranking_time_idtime_Hash ON Ranking_Time(IdTime) USING HASH;
CREATE INDEX idx_ranking_time_idcategoriatime_Hash ON Ranking_Time(IdCategoriaTime) USING HASH;
CREATE INDEX idx_contrato_jogador_Hash ON Contrato (IdJogador) USING HASH;
CREATE INDEX idx_nacionalidade_jogador_Hash ON Jogador (Nacionalidade) USING HASH;
CREATE INDEX idx_contrato_time_Hash ON Contrato (IdTime) USING HASH;
CREATE INDEX idx_pais_time_hash ON Time(Pais) USING HASH;
CREATE INDEX idx_estatistica_time_id_hash ON Estatistica_Time(Id) USING HASH;
CREATE INDEX idx_time_id_hash ON Time(Id) USING HASH;