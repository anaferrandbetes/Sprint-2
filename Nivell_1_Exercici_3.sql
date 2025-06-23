/* La consulta princial és extreure totes les transaccions
   La subconsulta és el total d'empreses d'Alemanya */
SELECT id, credit_card_id, company_id, user_id, lat, longitude, timestamp, SUM(amount) AS total_amount, declined 
FROM transaction
WHERE company_id IN (
	SELECT id FROM company
	WHERE country = "Germany"
)
GROUP BY id, credit_card_id, company_id, user_id, lat, longitude, timestamp, declined;

-- Llista les empreses que han realitzat transaccions per un amount superior a la mitjana de totes les transaccions.
SELECT company.id, company.company_name, AVG(transaction.amount) AS avg_per_company, company.country
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
GROUP BY company.id, company.company_name, company.country
HAVING AVG(transaction.amount) > (
SELECT AVG(avg_amount)
FROM (
	SELECT AVG(transaction.amount) AS avg_amount
	FROM transaction 
    GROUP BY transaction.company_id
    ) AS subquery
);

-- Llistat d'empreses que no tenen transaccions registrades
SELECT *
FROM company
LEFT JOIN transaction ON company.id = transaction.company_id
WHERE transaction.id IS NULL
-- No hi ha cap, no cal eliminar cap registres 