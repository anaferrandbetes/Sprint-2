/* Exercici 1: Cinc dies amb la quantitat més gran d'ingressos a l'empresa per vendes. 
   Mostra la data de cada transacció juntament amb el total de les vendes.*/
SELECT company.id, company.company_name, LEFT(transaction.timestamp,10) AS trx_date, SUM(transaction.amount) AS total_amount
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
GROUP BY company.id, company.company_name, trx_date
ORDER BY total_amount DESC
LIMIT 5;