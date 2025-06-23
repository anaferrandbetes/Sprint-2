-- Exercici 2: Quina és la mitjana de vendes per país? Presenta els resultats ordenats de major a menor mitjà.
SELECT company.country, company.id, company.company_name, AVG(transaction.amount) AS avg_amount
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
GROUP BY company.country, company.id, company.company_name
ORDER BY avg_amount DESC;