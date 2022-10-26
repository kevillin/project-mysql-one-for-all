SELECT artistas.nome_artista AS artista, 
albuns.nome_album AS album, 
COUNT(id_usuario) AS seguidores 
FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.albuns AS albuns
ON artistas.id_artista = albuns.id_artista
INNER JOIN SpotifyClone.seguindo_artistas AS seguindo
ON artistas.id_artista = seguindo.id_artista
GROUP BY artistas.nome_artista, albuns.nome_album
ORDER BY seguidores DESC, artistas.nome_artista, albuns.nome_album;