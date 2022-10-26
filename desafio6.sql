SELECT MIN(planos.valor_plano) AS faturamento_minimo, MAX(planos.valor_plano) AS faturamento_maximo, CAST(AVG(planos.valor_plano) AS DECIMAL(4,2)) AS faturamento_medio, SUM(planos.valor_plano) AS faturamento_total FROM SpotifyClone.planos AS planos
INNER JOIN SpotifyClone.usuario AS usuario 
ON usuario.id_plano = planos.id_plano;