/* Llista de totes les transaccions realitzades per empreses que estan situades en el mateix país "Non Institute"
   Mostra el llistat aplicant JOIN i subconsultes.*/
SELECT * 
FROM company
INNER JOIN transaction ON company.id = transaction.company_id
HAVING company.country = ( 
	SELECT country
    FROM company
    WHERE company_name = "Non Institute");
        
-- Mostra el llistat aplicant solament subconsultes.
SELECT * 
FROM transaction
HAVING company_id IN (
	SELECT id 
	FROM company
	WHERE country = (
		SELECT country
		FROM company
		WHERE company_name = "Non Institute")
        );