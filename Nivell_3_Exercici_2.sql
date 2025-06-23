/* Exercici 2: Quantitat de transaccions que realitzen les empreses.  
Llistat de les empreses on especifiquis si tenen més de 400 transaccions o menys.*/
SELECT company.id, company.company_name, COUNT(transaction.id) AS trx_count,
 CASE 
	WHEN COUNT(transaction.id) > 400 THEN '1'
	ELSE '0'
	END AS trx_mes_400
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
GROUP BY  company.id, company.company_name
ORDER BY trx_count DESC