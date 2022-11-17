SELECT cancao.cancao AS nome, 
COUNT(reproducao.usuario_id) AS reproducoes
FROM SpotifyClone.reproducao AS reproducao
INNER JOIN SpotifyClone.usuario AS usuario
ON usuario.usuario_id = reproducao.usuario_id
INNER JOIN SpotifyClone.plano AS plano
ON usuario.plano_id = plano.plano_id
INNER JOIN SpotifyClone.cancao AS cancao
ON reproducao.cancao_id = cancao.cancao_id
WHERE plano.plano IN ('gratuito', 'pessoal')
GROUP BY cancao.cancao
ORDER BY nome;