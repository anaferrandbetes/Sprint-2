-- Exercici 2: Quina és la mitjana de vendes per país? Presenta els resultats ordenats de major a menor mitjà.
SELECT company.country, company.id, company.company_name, ROUND(AVG(transaction.amount),2) AS avg_amount
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
WHERE transaction.declined = 0
GROUP BY company.country, company.id, company.company_name
ORDER BY avg_amount DESC;