SELECT MIN(plano.valor) AS faturamento_minimo, 
MAX(plano.valor) AS faturamento_maximo, 
CAST(AVG(plano.valor) AS DECIMAL(4,2)) AS faturamento_medio, 
SUM(plano.valor) AS faturamento_total 

FROM SpotifyClone.plano AS plano
INNER JOIN SpotifyClone.usuario AS usuario 
ON usuario.plano_id = plano.plano_id;