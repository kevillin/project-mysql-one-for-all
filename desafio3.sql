SELECT user.nome_usuario AS usuario, 
COUNT(historico.id_usuario) AS qt_de_musicas_ouvidas, 
ROUND(SUM(cancoes.duracao / 60), 2) AS total_minutos 
FROM SpotifyClone.usuario AS user
INNER JOIN SpotifyClone.historico_reproducoes AS historico 
ON user.id_usuario = historico.id_usuario
INNER JOIN SpotifyClone.cancoes AS cancoes
ON cancoes.id_cancao = historico.id_cancao
GROUP BY user.nome_usuario
ORDER BY nome_usuario;