SELECT cancao.cancao AS cancao, 
COUNT(reproducao.cancao_id) AS reproducoes
FROM SpotifyClone.cancao AS cancao

INNER JOIN SpotifyClone.reproducao AS reproducao 
ON reproducao.cancao_id = cancao.cancao_id
GROUP BY reproducao.cancao_id
ORDER BY reproducoes DESC, cancao.cancao LIMIT 2;