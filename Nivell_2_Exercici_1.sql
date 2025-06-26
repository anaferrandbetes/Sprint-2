/* Exercici 1: Cinc dies amb la quantitat més gran d'ingressos a l'empresa per vendes. 
   Mostra la data de cada transacció juntament amb el total de les vendes.*/
SELECT 
	company.id, 
	company.company_name, 
	DATE_FORMAT(transaction.timestamp, '%d-%m-%Y') AS trx_date, 
	FORMAT(SUM(transaction.amount), 2, 'es_ES') AS total_amount
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
WHERE transaction.declined = 0 
GROUP BY company.id, company.company_name, trx_date
ORDER BY SUM(transaction.amount) DESC
LIMIT 5;