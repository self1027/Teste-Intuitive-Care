USE ans_dados;

-- Verificar se existem dados para 2024 primeiro
SELECT COUNT(*) AS total_2024 FROM demonstracoes_contabeis WHERE YEAR(data) = 2024;

-- Adicionar pequeno delay para garantir que tudo está carregado
DO SLEEP(1);

-- Consulta ultimo trimestre
SELECT 
    d.registro_ans,
    o.razao_social,
    SUM(d.vl_saldo_final) AS total_despesas
FROM demonstracoes_contabeis d FORCE INDEX (PRIMARY)
JOIN operadoras o FORCE INDEX (PRIMARY) ON d.registro_ans = o.registro_ans
WHERE YEAR(d.data) = 2024 
AND MONTH(d.data) BETWEEN 10 AND 12
AND (d.descricao LIKE CONVERT(_utf8mb4 '%EVENTOS%ASSISTÊNCIA%SAÚDE%' USING utf8mb4) 
     OR d.descricao LIKE CONVERT(_utf8mb4 '%SINISTROS%ASSISTÊNCIA%SAÚDE%' USING utf8mb4))
GROUP BY d.registro_ans, o.razao_social
ORDER BY total_despesas DESC
LIMIT 10;

-- Consulta para o ano todo de 2024
SELECT 
    d.registro_ans,
    o.razao_social,
    SUM(d.vl_saldo_final) AS total_despesas
FROM demonstracoes_contabeis d FORCE INDEX (PRIMARY)
JOIN operadoras o FORCE INDEX (PRIMARY) ON d.registro_ans = o.registro_ans
WHERE YEAR(d.data) = 2024 
AND (d.descricao LIKE CONVERT(_utf8mb4 '%EVENTOS%ASSISTÊNCIA%SAÚDE%' USING utf8mb4) 
     OR d.descricao LIKE CONVERT(_utf8mb4 '%SINISTROS%ASSISTÊNCIA%SAÚDE%' USING utf8mb4))
GROUP BY d.registro_ans, o.razao_social
ORDER BY total_despesas DESC
LIMIT 10;