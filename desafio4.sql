SELECT user.nome_usuario AS usuario, 
IF(MAX(YEAR(historico.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.usuario AS user
INNER JOIN SpotifyClone.historico_reproducoes AS historico 
ON user.id_usuario = historico.id_usuario
GROUP BY user.nome_usuario
ORDER BY nome_usuario;