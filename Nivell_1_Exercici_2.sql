-- Primer llistem tots els països únics de la taula company
SELECT DISTINCT country
FROM company
ORDER BY country ASC;

-- Ara comptarem el països en els quals les vendes siguin diferents 0
SELECT COUNT(DISTINCT company.country)
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
HAVING SUM(transaction.amount) <> 0;

-- Extraiem l'empresa amb la mitjana més gran de vendes
SELECT company.id, company.company_name, AVG(transaction.amount) AS avg_amount, company.country
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
GROUP BY company.id, company.company_name, company.country
ORDER BY avg_amount DESC
LIMIT 1;