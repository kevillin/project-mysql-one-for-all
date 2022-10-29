SELECT COUNT(historico.data_reproducao) AS quantidade_musicas_no_historico FROM SpotifyClone.historico_reproducoes AS historico
INNER JOIN SpotifyClone.usuario AS usuario
ON historico.id_usuario = usuario.id_usuario
WHERE usuario.nome_usuario = 'Barbara Liskov';