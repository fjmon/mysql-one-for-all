SELECT usuario.usuario AS usuario, 
COUNT(reproducao.usuario_id) AS qt_de_musicas_ouvidas, 
ROUND(SUM(cancao.duracao / 60), 2) AS total_minutos 
FROM SpotifyClone.usuario AS usuario

INNER JOIN SpotifyClone.reproducao AS reproducao
ON usuario.usuario_id = reproducao.usuario_id
INNER JOIN SpotifyClone.cancao AS cancao
ON reproducao.cancao_id = cancao.cancao_id
GROUP BY usuario.usuario
ORDER BY usuario;