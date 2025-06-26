/* Utilitzant només subconsultes (sense utilitzar JOIN)
** Mostra totes les transaccions realitzades per empreses d’Alemanya. */
SELECT id, credit_card_id, company_id, user_id, lat, longitude, timestamp, SUM(amount) AS total_amount, declined 
FROM transaction
WHERE company_id IN (
	SELECT id FROM company
	WHERE country = "Germany"
)
GROUP BY id, credit_card_id, company_id, user_id, lat, longitude, timestamp, declined;

-- Llista les empreses que han realitzat transaccions per un amount superior a la mitjana de totes les transaccions.
SELECT transaction.company_id, ROUND(AVG(transaction.amount),2) AS avg_amount
FROM transaction
WHERE transaction.company_id IN (
	SELECT company.id FROM company)
GROUP BY transaction.company_id
HAVING ROUND(AVG(transaction.amount),2) > (
		SELECT ROUND(AVG(avg_amount),2)
		FROM (
			SELECT ROUND(AVG(transaction.amount),2) AS avg_amount
            FROM transaction
			GROUP BY transaction.company_id) AS subquery
		);

-- Eliminaran del sistema les empreses que no tenen transaccions registrades, entrega el llistat d'aquestes empreses.
SELECT *
FROM company
WHERE company.id NOT IN (
	SELECT transaction.company_id 
    FROM transaction)