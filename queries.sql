// CONSULTA 1: Clientes Dependentes e seus Titulares //
SELECT 
    dep.nome AS cliente_dependente,
    tit.nome AS cliente_titular
FROM cliente dep
JOIN cliente tit ON dep.id_responsavel = tit.id;

// CONSULTA 2A: Top 5 Contas com MAIS Transações //
SELECT 
    conta_id, 
    COUNT(*) AS total_transacoes
FROM transacao
GROUP BY conta_id
ORDER BY total_transacoes DESC
LIMIT 5;

// CONSULTA 2B: Top 5 Contas com MENOS Transações //
SELECT 
    conta_id, 
    COUNT(*) AS total_transacoes
FROM transacao
GROUP BY conta_id
ORDER BY total_transacoes ASC
LIMIT 5;

// CONSULTA 3: Saldo Total de Cada Conta //
SELECT 
    conta_id,
    SUM(
        CASE 
            WHEN tipo = 'DEPOSITO' THEN valor
            WHEN tipo IN ('SAQUE', 'PAGAMENTO') THEN -valor
            ELSE 0
        END
    ) AS saldo_total
FROM transacao
GROUP BY conta_id;
