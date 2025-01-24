-- Consulta de ingressos com valor menor que 50 pela organizadora ESL

SELECT 
    i.Id,
    i.IdEvento,
    i.Valor,
    i.DataVendaInicio,
    i.DataVendaFim,
    i.Lote,
    i.TipoAssento,
    e.Nome AS Evento,
    e.Organizador
FROM 
    Ingresso i
JOIN 
    Evento e ON i.IdEvento = e.Id
WHERE 
    i.Valor < 50.00
    AND e.Organizador = 'ESL';

CREATE INDEX idx_valor_ingresso ON Ingresso(Valor);
CREATE INDEX idx_organizador_evento ON Evento(Organizador);
CREATE INDEX idx_organizador_evento_Hash ON Evento(Organizador) USING HASH;
CREATE INDEX idx_idevento_ingresso ON Ingresso(IdEvento);
CREATE INDEX idx_idevento_ingresso_Hash ON Ingresso(IdEvento) USING HASH;
