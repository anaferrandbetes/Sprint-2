/* Exercici 1: Presenta el nom, telèfon, país, data i amount, d'aquelles empreses que van realitzar transaccions amb un valor 
   comprès entre 350 i 400 euros i en alguna d'aquestes dates: 29 d'abril del 2015, 20 de juliol del 2018 i 13 de març del 2024. 
   Ordena els resultats de major a menor quantitat.*/
   SELECT company.company_name, company.phone, company.country, LEFT(transaction.timestamp,10) AS trx_date, transaction.amount 
   FROM company
   INNER JOIN transaction ON company.id = transaction.company_id
   WHERE transaction.amount BETWEEN 350 AND 400
   AND LEFT	(transaction.timestamp,10) IN ('2015-04-29', '2018-07-20','2024-03-13')
   GROUP BY company.company_name, company.phone, company.country, trx_date, transaction.amount
   ORDER BY transaction.amount DESC