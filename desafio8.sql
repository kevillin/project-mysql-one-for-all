SELECT artistas.nome_artista AS artista, albuns.nome_album AS album FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.albuns AS albuns
ON artistas.id_artista = albuns.id_artista
WHERE artistas.nome_artista = 'Elis Regina'
GROUP BY albuns.nome_album
ORDER BY albuns.nome_album;