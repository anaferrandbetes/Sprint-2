-- Llistat dels països que estan generant vendes.
SELECT DISTINCT company.country, FORMAT(SUM(transaction.amount),2, 'es_ES') AS total_amount
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
WHERE transaction.declined = 0 
GROUP BY company.country
ORDER BY company.country ASC;

-- Des de quants països es generen les vendes.
SELECT COUNT(DISTINCT company.country), FORMAT(SUM(transaction.amount),2, 'es_ES') AS total_amount
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
WHERE transaction.declined = 0;

-- Identifica la companyia amb la mitjana més gran de vendes.
SELECT company.id, company.company_name, AVG(transaction.amount) AS avg_amount, company.country
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
WHERE transaction.declined = 0
GROUP BY company.id, company.company_name, company.country
ORDER BY avg_amount DESC
LIMIT 1;