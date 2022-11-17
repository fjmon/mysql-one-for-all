SELECT usuario.usuario AS usuario, 
IF (MAX(YEAR(reproducao.momento)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.usuario AS usuario

INNER JOIN SpotifyClone.reproducao AS reproducao
ON usuario.usuario_id = reproducao.usuario_id
GROUP BY usuario.usuario
ORDER BY usuario;