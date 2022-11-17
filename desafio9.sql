SELECT COUNT(reproducao.momento) AS quantidade_musicas_no_historico 
FROM SpotifyClone.reproducao AS reproducao
INNER JOIN SpotifyClone.usuario AS usuario
ON reproducao.usuario_id = usuario.usuario_id
WHERE usuario.usuario = 'Barbara Liskov';