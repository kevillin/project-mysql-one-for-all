SELECT cancoes.nome_cancao AS cancao, 
COUNT(historico.id_cancao) AS reproducoes
FROM SpotifyClone.cancoes AS cancoes
INNER JOIN SpotifyClone.historico_reproducoes AS historico 
ON historico.id_cancao = cancoes.id_cancao
GROUP BY historico.id_cancao
ORDER BY reproducoes DESC, cancoes.nome_cancao LIMIT 2;