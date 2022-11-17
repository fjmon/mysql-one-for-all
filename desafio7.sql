SELECT artista.artista AS artista, album.album AS album, 
COUNT(usuario_id) AS seguidores

FROM SpotifyClone.artista AS artista
INNER JOIN SpotifyClone.album AS album
ON artista.artista_id = album.artista_id
INNER JOIN SpotifyClone.seguindo AS seguindo
ON artista.artista_id = seguindo.artista_id
GROUP BY artista.artista, album.album
ORDER BY seguindo DESC, artista.artista, album.album;