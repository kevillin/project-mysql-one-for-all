SELECT c.nome_cancao AS nome, COUNT(h.id_usuario) AS reproducoes FROM SpotifyClone.historico_reproducoes AS h
INNER JOIN SpotifyClone.usuario AS u
ON u.id_usuario = h.id_usuario
INNER JOIN SpotifyClone.planos AS p
ON u.id_plano = p.id_plano
INNER JOIN SpotifyClone.cancoes AS c
ON h.id_cancao = c.id_cancao
WHERE p.tipo_plano IN ('gratuito', 'pessoal')
GROUP BY c.nome_cancao
ORDER BY nome;